//
//  HomeViewController.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 30/07/2023.
//

import UIKit
import ProgressHUD
class HomeViewController: UIViewController {
   
    

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    
    @IBOutlet weak var chefsDishesCollectionView: UICollectionView!
    var categories : [DishCategoryStruct] = []
    var popular : [DishStruct] = []
    var specials : [DishStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        popularDishesCollectionView.delegate = self
        popularDishesCollectionView.dataSource = self
        chefsDishesCollectionView.delegate = self
        chefsDishesCollectionView.dataSource = self
        registerCells()
        fetchingDataFromAPI()
    }
    
    private func registerCells(){
        
        categoriesCollectionView.register(UINib(nibName: categoryCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: categoryCollectionViewCell.id)
        
        popularDishesCollectionView.register(UINib(nibName: popularDishesCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: popularDishesCollectionViewCell.id)
        chefsDishesCollectionView.register(UINib(nibName: ChefSpecialsCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: ChefSpecialsCollectionViewCell.id)
    }
    
    
    private func fetchingDataFromAPI(){
        
        
        ProgressHUD.show()
        NetworkService().fetch(path: "dish-categories", responseClass: WelcomeHome.self) { response in
            switch response {
            case .success(let data):
                ProgressHUD.dismiss()
                guard let data = data else { return}
                self.categories = data.data?.categories ?? []
                self.popular = data.data?.populars ?? []
                self.specials = data.data?.specials ?? []
                self.categoriesCollectionView.reloadData()
                self.popularDishesCollectionView.reloadData()
                self.chefsDishesCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }

    }
    

    
}

extension HomeViewController :  UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return categories.count
        case popularDishesCollectionView:
            return popular.count
        case chefsDishesCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesCollectionView:
            let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: categoryCollectionViewCell.id, for: indexPath) as! categoryCollectionViewCell
            cell.setUpCategory(category: categories[indexPath.row])
            return cell

        case popularDishesCollectionView:
            
            let cell = popularDishesCollectionView.dequeueReusableCell(withReuseIdentifier: popularDishesCollectionViewCell.id, for: indexPath) as!  popularDishesCollectionViewCell
            cell.setup(dish: popular[indexPath.row])
            return cell
            

        case chefsDishesCollectionView:
            let cell = chefsDishesCollectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialsCollectionViewCell.id , for: indexPath) as! ChefSpecialsCollectionViewCell
            cell.setupChefs(dish: specials[indexPath.row])
            return cell
        default:
            return  UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionView {
        
            let controller = listDishesViewController.instantiat()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
             
            
            
            
        }else{
            let controller = dishDetailsViewController.instantiat()
            controller.dish = collectionView == popularDishesCollectionView ? popular[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
