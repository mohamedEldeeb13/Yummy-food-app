//
//  ChefSpecialsCollectionViewCell.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 31/07/2023.
//

import UIKit

class ChefSpecialsCollectionViewCell: UICollectionViewCell {
    
    static let id  = String(describing: ChefSpecialsCollectionViewCell.self)

    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    func setupChefs(dish : DishStruct){
        titleLbl.text = dish.name
        dishImage.kf.setImage(with: dish.image?.asUrl)
        discriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    
}
