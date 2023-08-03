//
//  categoryCollectionViewCell.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 30/07/2023.
//

import UIKit
import Kingfisher

class categoryCollectionViewCell: UICollectionViewCell {
    
    static let id = String(describing: categoryCollectionViewCell.self)

    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
   
    
    func setUpCategory(category : DishCategoryStruct){
        categoryTitle.text = category.name
        categoryImage.kf.setImage(with: category.image?.asUrl)
    }

}
