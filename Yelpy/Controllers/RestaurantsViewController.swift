//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant  = restaurantsArray[indexPath.row]
        //set Label to restaurant name for each cell
        cell.lable.text = restaurant["name"] as? String ?? ""
        
        //set Image of restaurant
        if let imageURLString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageURLString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }

        return cell
    }
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    
  
    // –––––– TODO: configure the API and Initialize restaurantsArray
    
    
    
    var restaurantsArray: [[String:Any?]] = []
    
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getAPIData()
        tableView.rowHeight = 142
        

    }
    
    
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData(){
        API.getRestaurants() {(restaurants) in guard let restaurants = restaurants else {
            return
        }
        print(restaurants)
        self.restaurantsArray = restaurants
        self.tableView.reloadData() //reload data!
    }
    
}
    
// ––––– TODO: Create tableView Extension and TableView Functionality

}
