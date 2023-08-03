//
//  onboardingCollectionViewCell.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 29/07/2023.
//

import UIKit

class onboardingCollectionViewCell: UICollectionViewCell {
    
    static let id = String(describing: onboardingCollectionViewCell.self)
    
    @IBOutlet weak var onboardingDescription: UILabel!
    @IBOutlet weak var onboardingTitle: UILabel!
    @IBOutlet weak var onboardingImage: UIImageView!
    func setUp(_ slide : onboarding){
        onboardingTitle.text = slide.title
        onboardingDescription.text = slide.description
        onboardingImage.image = slide.image
    }
}
