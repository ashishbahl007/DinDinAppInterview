//
//  CartTableViewCelll.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 30/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import UIKit

class CartTableViewCelll: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        closeButton.layer.cornerRadius = 0.5 * closeButton.bounds.size.width
        closeButton.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
