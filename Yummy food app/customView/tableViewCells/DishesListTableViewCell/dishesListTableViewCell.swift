//
//  dishesListTableViewCell.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 01/08/2023.
//

import UIKit

class dishesListTableViewCell: UITableViewCell {

    static let id = String(describing: dishesListTableViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!
    
    func tableSetup(dish : DishStruct){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titlelbl.text = dish.name
        discriptionLbl.text = dish.description
    }
    
    func OrderTableSetup(order : OrderStruct){
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titlelbl.text = order.dish?.name
        discriptionLbl.text = order.name
    }
    
    
}
