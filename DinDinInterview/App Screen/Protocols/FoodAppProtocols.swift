//
//  FoodAppProtocols.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 29/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import UIKit

protocol FoodAppViewToPresenterProtocol : class {
    var view : FoodAppPresenterToViewProtocol? { get set }
    var interactor : FoodAppPresenterToInteractorProtocol? { get set }
    var router : FoodAppPresenterToRouterProtocol? { get set }
    
    //Create function to pass data / parameters from view to presenter
}

protocol FoodAppPresenterToViewProtocol : class {
    //Create function to pass data / model from presenter to view
}

protocol FoodAppPresenterToRouterProtocol : class {
    
}

protocol FoodAppPresenterToInteractorProtocol : class {
    var presenter : FoodAppInteractorToPresenterProtocol? { get set }
    
    //Create function to pass data / model from presenter to interactor to make networking calls
}

protocol FoodAppInteractorToPresenterProtocol : class {
    //Create function to pass data / model from interactor to presenter
}
