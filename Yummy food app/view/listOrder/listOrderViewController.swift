//
//  listOrderViewController.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 02/08/2023.
//

import UIKit
import ProgressHUD

class listOrderViewController: UIViewController {
    
    var orderArray : [OrderStruct] = []

    @IBOutlet weak var listOrderTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listOrderTableView.delegate = self
        listOrderTableView.dataSource = self

        title = "Orders"
        register()
        fetchingDataFromAPI()
    }
    
    private func register(){
        listOrderTableView.register(UINib(nibName: dishesListTableViewCell.id , bundle: nil), forCellReuseIdentifier: dishesListTableViewCell.id)
    }
    private func fetchingDataFromAPI(){
        ProgressHUD.show()
        NetworkService().fetch(path: "orders", responseClass: WelcomeOrders.self) { response in
            switch response{
            case .success(let data):
                ProgressHUD.dismiss()
                guard let data = data else {return}
                self.orderArray = data.data ?? []
                self.listOrderTableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    

    

}
extension listOrderViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listOrderTableView.dequeueReusableCell(withIdentifier: dishesListTableViewCell.id) as! dishesListTableViewCell
        cell.OrderTableSetup(order: orderArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = dishDetailsViewController.instantiat()
        
        controller.dish = orderArray[indexPath.row].dish
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    
}
