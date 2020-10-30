//
//  FoodAppPresenter.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 29/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import UIKit

class FoodAppPresenter: FoodAppViewToPresenterProtocol {
    var view: FoodAppPresenterToViewProtocol?
    
    var interactor: FoodAppPresenterToInteractorProtocol?
    
    var router: FoodAppPresenterToRouterProtocol?
    
    
}

extension FoodAppPresenter : FoodAppInteractorToPresenterProtocol {
    
}
