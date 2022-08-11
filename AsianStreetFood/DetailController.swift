//
//  DetailController.swift
//  AsianStreetFood
//
//  Created by Dusan Orescanin on 11/08/2022.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var food: Food!

    override func viewDidLoad() {
        super.viewDidLoad()
        foodImageView.image = UIImage(named: food.image)
        nameLabel.text = food.name
        descLabel.text = food.desc
        countryLabel.text = food.country

    }

}
