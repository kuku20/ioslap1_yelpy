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
     //  print(restaurant)
        //set Label to restaurant name for each cell
        cell.lable.text = restaurant["name"] as? String ?? ""
        cell.lable.sizeToFit()
        let categories = restaurant["categories"] as! [[String: Any]]
        cell.title.text = categories[0]["title"] as? String
        //to get the image.png
        let rate = (restaurant["rating"] as? Double)!
        let imageRate = (RatingBar(rawValue: rate)?.getImageName())!
        // to add image to lable
        // Create Attachment
        // create an NSMutableAttributedString that we'll append everything to
        let fullString = NSMutableAttributedString()
        // create our NSTextAttachment
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: imageRate)
        // wrap the attachment in its own attributed string so we can append it
        let image1String = NSAttributedString(attachment: image1Attachment)
        // add the NSTextAttachment wrapper to our full string, then add some more text.
        fullString.append(image1String)
        fullString.append(NSAttributedString())
        cell.ratingbar.attributedText = fullString

       cell.reviewcount.text = String((restaurant["review_count"] as? Int)!)
       cell.phone.text = restaurant["display_phone"] as? String ?? ""
        //set Image of restaurant
        if let imageURLString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageURLString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
           // cell.restaurantImage.sizeToFit()
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
       // print(restaurants)
        self.restaurantsArray = restaurants
        self.tableView.reloadData() //reload data!
    }
    
}
    
    enum RatingBar: Double {

        case five = 5.0
        case fourAndAHalf = 4.5
        case four = 4.0
        case threeAndAHalf = 3.5
        case three = 3.0
        case twoAndAHalf =  2.5
        case two = 2.0
        case oneAndAHalf = 1.5
        case one = 1.0
        case zero = 0.0
   
    
    func getImageName() -> String {
        switch self {
        case .five:
            return "regular_5.png"
        case .fourAndAHalf :
            return "regular_4_half.png"
        case .four :
            return "regular_4.png"
        case .threeAndAHalf :
            return "regular_3_half.png"
        case .three :
            return "regular_3.png"
        case .twoAndAHalf :
            return "regular_2_half.png"
        case .two :
            return "regular_2.png"
        case .oneAndAHalf :
            return "regular_1_half.png"
        case .one :
            return "regular_1.png"
        case .zero :
            return "regular_0.png"
        }
    }}
// ––––– TODO: Create tableView Extension and TableView Functionality

}
