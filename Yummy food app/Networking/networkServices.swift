//
//  networkServices.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 02/08/2023.
//

import Foundation
import Alamofire

class NetworkService {
    
    
    func fetch<T : Decodable>(path : String , responseClass : T.Type , completion :@escaping (Result<T? , NSError>) -> Void) {
            let url = "https://yummie.glitch.me/\(path)"
        AF.request(url, method: .get).validate().responseDecodable(of: T.self) { response in
            guard let responseObj = response.value else { return }
            completion(.success(responseObj))
        }
        
    }
    
    
    func send <T: Decodable>(name: String, dishId: String, responseClass: T.Type, completion:@escaping (Result<T?, NSError>) -> Void){
        let params = ["name": name]
        let url = "https://yummie.glitch.me/orders/\(dishId)"
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) { response in
            guard let responseObj = response.value else { return }
            completion(.success(responseObj))
        }
    }

}
