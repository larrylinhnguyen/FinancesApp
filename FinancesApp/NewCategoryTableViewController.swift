//
//  NewCategoryTableViewController.swift
//  FinancesApp
//
//  Created by Ricardo Gehrke Filho on 24/10/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit
import Color_Picker_for_iOS

class NewCategoryTableViewController: UITableViewController {

    //TODO: Replace gateway from View Controller to Model View Layer
    var categoryGateway: CategoryGatewayProtocol = CategoryGatewayInMemory.sharedInstance
    
    //MARK: Outlets
    
    @IBOutlet weak var categoryNameTextField: UITextField!
    @IBOutlet weak var colorPickerView: HRColorPickerView!
    @IBOutlet weak var colorPickerMapView: HRColorMapView!
    
    //MARK: ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPickerView.colorMapView = colorPickerMapView
//        colorPickerView.addTarget(self, action: "colorChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    //MARK: Actions
    
    @IBAction func saveCategoryPressed(sender: UIBarButtonItem) {
        var newCategory = CategoryModel()
        newCategory.name = categoryNameTextField.text!
        
        categoryGateway.save(newCategory)

        performSegueWithIdentifier("backToListCategoriesTableViewController", sender: sender)
    }
    
    @IBAction func colorChanged(sender: HRColorPickerView) {
        
    }
    
}
