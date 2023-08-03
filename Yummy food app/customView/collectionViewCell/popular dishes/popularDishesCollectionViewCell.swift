//
//  popularDishesCollectionViewCell.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 30/07/2023.
//

import UIKit

class popularDishesCollectionViewCell: UICollectionViewCell {
    static let id = String(describing: popularDishesCollectionViewCell.self)
    
    @IBOutlet weak var discriptionLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var dishesImageView: UIImageView!
    
    func setup(dish : DishStruct){
        titleLbl.text = dish.name
        dishesImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        discriptionLbl.text = dish.description
    }
}
