//
//  CartViewController.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 30/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cartTableView: UITableView!
    
    var sum : Float!
    
    let cellIdentifier = "cartCell"
    var foodArr = [String]()
    var imageArr = [UIImage]()
    var priceArr = [String]()
    @IBOutlet weak var amountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CartTableViewCelll", bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        let reducedArray = priceArr.map({$0.replacingOccurrences(of: "$", with: "")})
        let intArray = reducedArray.map{Float($0)!}
        sum = intArray.reduce(0, +)
        amountLabel.text = "Total : $\(String(format:"%.2f", sum))"
    }
    
    @objc func deleteItems(_ sender: UIButton) {
        let buttonPosition = sender.convert(CGPoint.zero, to: self.cartTableView)
        let indexPath = self.cartTableView.indexPathForRow(at:buttonPosition)
        
        self.foodArr.remove(at: indexPath!.row)
        self.priceArr.remove(at: indexPath!.row)
        self.imageArr.remove(at: indexPath!.row)
        
        let reducedArray = priceArr.map({$0.replacingOccurrences(of: "$", with: "")})
        let intArray = reducedArray.map{Float($0)!}
        let sum = intArray.reduce(0, +)
        cartTableView.reloadData()
        amountLabel.text = "Total : $\(String(format:"%.2f", sum))"
    }
}

extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CartTableViewCelll {
            
            cell.closeButton.addTarget(self, action: #selector(deleteItems(_ :)), for: .touchUpInside)
            cell.foodImageView.image = imageArr[indexPath.row]
            cell.priceLabel.text = priceArr[indexPath.row]
            cell.foodTitle.text = foodArr[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
