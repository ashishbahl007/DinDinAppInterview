//
//  FoodAppEntity.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 29/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import UIKit

struct FoodAppEntity {
  let title: String
  let price: String
  let image: UIImage

  static func allFood() -> [FoodAppEntity] {
    return [
      FoodAppEntity(title: "Pizza", price: "$4.99", image: #imageLiteral(resourceName: "Pizza")),
      FoodAppEntity(title: "Noodles", price: "$6.99", image: #imageLiteral(resourceName: "Noodles")),
      FoodAppEntity(title: "Chicken Curry", price: "$7.49", image: #imageLiteral(resourceName: "chicken curry"))
    ]
  }
    
    static func allSides() -> [FoodAppEntity] {
      return [
        FoodAppEntity(title: "Chicken Strips", price: "$3.99", image: #imageLiteral(resourceName: "ChickenStrips")),
        FoodAppEntity(title: "Chicken Wings", price: "$4.99", image: #imageLiteral(resourceName: "ChickenWings")),
        FoodAppEntity(title: "Fish 'N' Chips", price: "$7.49", image: #imageLiteral(resourceName: "fishnchips")),
        FoodAppEntity(title: "French Fries", price: "$3.49", image: #imageLiteral(resourceName: "FrenchFries")),
        FoodAppEntity(title: "Potato Wedges", price: "$2.99", image: #imageLiteral(resourceName: "PotatoWedges")),
        FoodAppEntity(title: "Burger", price: "$5.99", image: #imageLiteral(resourceName: "Hamburger")),
        FoodAppEntity(title: "Rolls", price: "$6.49", image: #imageLiteral(resourceName: "Spring Rolls"))
      ]
    }
    
    static func allBeverages() -> [FoodAppEntity] {
      return [
        FoodAppEntity(title: "Beer", price: "$9.99", image: #imageLiteral(resourceName: "beer")),
        FoodAppEntity(title: "Coffee", price: "$15.99", image: #imageLiteral(resourceName: "coffee")),
        FoodAppEntity(title: "Coca Cola", price: "$10.99", image: #imageLiteral(resourceName: "cocacola")),
        FoodAppEntity(title: "Fresh Lime Soda", price: "$3.49", image: #imageLiteral(resourceName: "Fresh lime soda"))
      ]
    }
}

