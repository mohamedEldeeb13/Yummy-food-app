//
//  onboardingViewController.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 29/07/2023.
//

import UIKit

class onboardingViewController: UIViewController {
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    var onboardingArray :[onboarding] = []
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == onboardingArray.count-1 {
                nextBtn.setTitle("get started", for: .normal)
            }else{
                nextBtn.setTitle("next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        
        onboardingArray = [
            onboarding(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: UIImage(named: "slide2")!),
                    onboarding(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: UIImage(named: "slide1")!),
                    onboarding(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: UIImage(named: "slide3")! )
                ]
        pageControl.numberOfPages = onboardingArray.count
        
    }
    

    @IBAction func nextButton(_ sender: UIButton) {
        
        if currentPage == onboardingArray.count-1 {
            
            pageControl.currentPage = currentPage
            let vc = storyboard?.instantiateViewController(identifier: "homeNV") as! UINavigationController
            vc.modalTransitionStyle = .flipHorizontal
            
            
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true , completion: nil)
            
        }else{
            
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    

}

extension onboardingViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onboardingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCell", for: indexPath) as!onboardingCollectionViewCell
        cell.setUp(onboardingArray[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
    }
    
}
