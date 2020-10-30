//
//  FoodAppRouter.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 29/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import Foundation

class FoodAppRouter: FoodAppPresenterToRouterProtocol {
    class func createFoodAppModule(view: ViewController) {
        let presenter : FoodAppViewToPresenterProtocol & FoodAppInteractorToPresenterProtocol = FoodAppPresenter()
        let interactor : FoodAppPresenterToInteractorProtocol = FoodAppInteractor()
        let router : FoodAppPresenterToRouterProtocol = FoodAppRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
}
