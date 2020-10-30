//
//  FoodItemTableViewCell.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 29/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import UIKit
import GMStepper

class FoodItemTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var innerView: UIView!
    
    @IBOutlet weak var foodItemImageView: UIImageView!
    
    @IBOutlet weak var foodTitleLabel: UILabel!
    
    @IBOutlet weak var foodDetailsView: UIView!
    @IBOutlet weak var foodDetailsStackView: UIStackView!
    @IBOutlet weak var increaseDecreaseStepper: GMStepper!
    @IBOutlet weak var qtyLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    var model: FoodAppEntity? {
      didSet {
        foodItemImageView.image = model?.image
        foodTitleLabel.text = model?.title
        amountLabel.text = model?.price
      }
    }
    //MARK:- Cell Lofe Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        outerView.layer.backgroundColor = UIColor.clear.cgColor
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        outerView.layer.shadowOpacity = 0.2
        outerView.layer.shadowRadius = 10
        
        innerView.backgroundColor = .white
        innerView.layer.cornerRadius = 15.0
        innerView.layer.masksToBounds = true
    }
}
