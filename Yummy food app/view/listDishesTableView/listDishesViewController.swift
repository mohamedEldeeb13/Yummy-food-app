//
//  listDishesViewController.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 02/08/2023.
//

import UIKit
import ProgressHUD

class listDishesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    static let id = String(describing: listDishesViewController.self)

    @IBOutlet weak var listDishesTableView: UITableView!
    
    var dishesArray : [DishStruct] = []
    var category : DishCategoryStruct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listDishesTableView.delegate = self
        listDishesTableView.dataSource = self
        title = category.name
        register()
        fetchingDataFromAPI()

    }
    private func register(){
        listDishesTableView.register(UINib(nibName: dishesListTableViewCell.id , bundle: nil), forCellReuseIdentifier: dishesListTableViewCell.id)
    }
    
    private func fetchingDataFromAPI(){
        ProgressHUD.show()
        let id = category.id ?? ""
        NetworkService().fetch(path: "dishes/\(id)", responseClass: WelcomeDishes.self) { response in
            switch response{
            case .success(let data):
                guard let data = data else {return}
                self.dishesArray = data.data ?? []
                self.listDishesTableView.reloadData()
                ProgressHUD.dismiss()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dishesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listDishesTableView.dequeueReusableCell(withIdentifier: dishesListTableViewCell.id) as! dishesListTableViewCell
        cell.tableSetup(dish: dishesArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = dishDetailsViewController.instantiat()
        controller.dish = dishesArray[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
   

}
