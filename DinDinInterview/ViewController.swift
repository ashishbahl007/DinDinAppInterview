//
//  ViewController.swift
//  DinDinInterview
//
//  Created by Ashish Bahl on 26/10/20.
//  Copyright © 2020 Ashish Bahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var pageControlView: UIView!
    @IBOutlet weak var pageControlScrollView: UIScrollView!
    @IBOutlet weak var pageControlImgView: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var titleCollectionView: UICollectionView!
    @IBOutlet weak var titleSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var filterBtn1: UIButton!
    @IBOutlet weak var filterBtn2: UIButton!
    
    @IBOutlet weak var tableViewViews: UIView!
    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var sidesTableView: UITableView!
    
    @IBOutlet weak var beveragesTableView: UITableView!
    
    @IBOutlet weak var buttonToCheckOut: UIButton!
    @IBOutlet weak var pageControlViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var mainViewTopConstraint: NSLayoutConstraint!
    
    //MARK:- VARIABLES
    
    private var lastContentOffset: CGFloat = 0
    var pageNumber = 0
    var stepperValue = 0
    
    var presenter : FoodAppViewToPresenterProtocol?
    
    var timer = Timer()
    var superview : UIView?
    
    let bannerImages = [#imageLiteral(resourceName: "Mondays"),#imageLiteral(resourceName: "Tuesdays"),#imageLiteral(resourceName: "Wednesdays"),#imageLiteral(resourceName: "Thursday"),#imageLiteral(resourceName: "Friday"),#imageLiteral(resourceName: "Saturday"),#imageLiteral(resourceName: "Sunday")]
    
    let titleArr = ["Food","Sides","Beverages"]
    
    let cellIdentifier = "foodCell"
    
    var foodArr = [String]()
    var imageArr = [UIImage]()
    var priceArr = [String]()
    
    //MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FoodAppRouter.createFoodAppModule(view: self) //Setting up VIPER architecture
        setupUI()
        configurePageControl()
    }
    
    //MARK:- SETUP UI
    
    func setupUI() {
        hideShowTableViews(false, foodTableView)
        hideShowTableViews(true, sidesTableView)
        hideShowTableViews(true, beveragesTableView)
        
        registerTableViewCells(foodTableView)
        registerTableViewCells(sidesTableView)
        registerTableViewCells(beveragesTableView)
        
        contentView.layer.cornerRadius = 5.0
        pageControlView.layer.cornerRadius = 5.0
        pageControlImgView.layer.cornerRadius = 5.0
        
        borderButton(filterBtn1)
        borderButton(filterBtn2)
    }
    
    //MARK:- SETUP BORDER FOR FILTER
    func borderButton(_ button : UIButton) {
        button.layer.cornerRadius = 15.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    //MARK:- REGISTER CELLS
    func registerTableViewCells(_ tableView : UITableView) {
        let nib = UINib(nibName: "FoodItemTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK:- Setup Page Control
    
    func configurePageControl() {
        self.pageControl.numberOfPages = bannerImages.count
        self.pageControl.currentPage = pageNumber
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.orange
        timer = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(moveToNextPage), userInfo:nil, repeats: true)
    }
    
    //MARK:- IBActions
    
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            hideShowTableViews(false, foodTableView)
            hideShowTableViews(true, sidesTableView)
            hideShowTableViews(true, beveragesTableView)
            break
        case 1 :
            hideShowTableViews(true, foodTableView)
            hideShowTableViews(false, sidesTableView)
            hideShowTableViews(true, beveragesTableView)
            break
        case 2 :
            hideShowTableViews(true, foodTableView)
            hideShowTableViews(true, sidesTableView)
            hideShowTableViews(false, beveragesTableView)
            break
        default:
            break
        }
    }
    
    @IBAction func filterButtonTouched(_ sender: UIButton) {
        if sender.currentTitle! == "Vegeterian" {
            print("Veg button touched")
        } else if sender.currentTitle! == "Non Vegeterian" {
            print("Non Veg button touched")
        } else {
            print("No button touched")
        }
    }
    
    @IBAction func checkOutClicked(_ sender: UIButton) {
        guard let cell = superview as? FoodItemTableViewCell else { return }
        stepperValue = Int(cell.increaseDecreaseStepper.value)
        if stepperValue == 0 {
            let alertController = UIAlertController(title: "ALERT", message: "There is nothing in the cart to check out", preferredStyle: .alert)
            let act = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(act)
            self.present(alertController, animated: true, completion: nil)
        } else {
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "CartViewController") as! CartViewController
            vc.foodArr = foodArr
            vc.imageArr = imageArr
            vc.priceArr = priceArr
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK:- Show / hide Tables
    func hideShowTableViews(_ canHide : Bool, _ tableView : UITableView) {
        tableView.isHidden = canHide
    }
    
    //MARK:- Next page
    @objc func moveToNextPage() {
        
        pageNumber += 1
        if pageNumber == 7 {
            pageNumber = 0
        }
        pageControl.currentPage = pageNumber 
        pageControlImgView.image = bannerImages[pageNumber]
    }
    
    //MARK:- Selector Functions
    
    @objc func stepperIncreasedDecreased(_ sender: UIStepper) {

        superview = sender.superview
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        
        guard let cell = superview as? FoodItemTableViewCell else { return }
        
        priceArr.append(cell.amountLabel.text!)
        foodArr.append(cell.foodTitleLabel.text!)
        imageArr.append(cell.foodItemImageView.image!)
        
        stepperValue = Int(sender.value)
        foodTableView.reloadData()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case foodTableView:
            return FoodAppEntity.allFood().count
        case sidesTableView :
            return FoodAppEntity.allSides().count
        case beveragesTableView :
            return FoodAppEntity.allBeverages().count
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FoodItemTableViewCell {
            switch tableView {
            case foodTableView:
                cell.model = FoodAppEntity.allFood()[indexPath.row]
            case sidesTableView :
                cell.model = FoodAppEntity.allSides()[indexPath.row]
            case beveragesTableView :
                cell.model = FoodAppEntity.allBeverages()[indexPath.row]
            default:
                break
            }
            cell.increaseDecreaseStepper.addTarget(self, action: #selector(stepperIncreasedDecreased(_ :)), for: .valueChanged)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(275)
    }

}


extension ViewController : UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset > scrollView.contentOffset.y) {
            UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
                self.pageControlView.isHidden = false
                self.mainViewTopConstraint.constant = 0
                self.view.superview?.layoutIfNeeded()
            }, completion: { (finished) -> Void in })
        } else if (self.lastContentOffset < scrollView.contentOffset.y) {
            UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
                self.pageControlView.isHidden = true
                self.mainViewTopConstraint.constant = -250
                self.view.superview?.layoutIfNeeded()
            }, completion: { (finished) -> Void in })
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

extension ViewController : FoodAppPresenterToViewProtocol {
    
}
