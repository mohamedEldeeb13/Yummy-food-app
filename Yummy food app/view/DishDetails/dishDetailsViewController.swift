//
//  dishDetailsViewController.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 31/07/2023.
//

import UIKit
import ProgressHUD

class dishDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var discriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    var dish : DishStruct!
    override func viewDidLoad() {
        super.viewDidLoad()
        populateItem()

        
    }
    private func populateItem(){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        caloriesLbl.text = dish.formattedCalories
        discriptionLbl.text = dish.description
    }
    
    @IBAction func placeOrderBtn(_ sender: UIButton) {
        
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else{
            ProgressHUD.showError("Please enter your name")
            return
        }
        ProgressHUD.show("Placing Order...")
        NetworkService().send(name: name, dishId: dish.id ?? "", responseClass: OrderStruct.self) { response in
            switch response{
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received. 👨🏼‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    

}
