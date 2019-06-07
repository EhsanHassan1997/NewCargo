//
//  CreateRequestViewController.swift
//  project1STversion
//
//  Created by Apple on 6/7/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class CreateRequestViewController: UIViewController {

    @IBOutlet weak var CargoTypeTextField: UITextField!
    
    @IBOutlet weak var CargoTypeAnchorView: UIView!
    
    @IBOutlet weak var QuantityTextField: UITextField!
    
    @IBOutlet weak var WieghtTextField: UITextField!
    
    @IBOutlet weak var WieghtMeasureTextField: UITextField!
    
    @IBOutlet weak var WieghtMeasureAnchorView: UIView!
    
    @IBOutlet weak var LengthTextField: UITextField!
    
    @IBOutlet weak var LengthMeasureTextField: UITextField!
    
    @IBOutlet weak var LengthMeasureAnchorView: UIView!
    
    @IBOutlet weak var HieghtTextField: UITextField!
    
    @IBOutlet weak var HieghtMeasureTextField: UITextField!
    
    @IBOutlet weak var HieghtMeasureAnchorView: UIView!
    
    @IBOutlet weak var WidthTextField: UITextField!
    
    @IBOutlet weak var WidthMeasureTextField: UITextField!
    
    @IBOutlet weak var WidthMeasureAnchorView: UIView!
    
    @IBOutlet weak var PickUpLocationTextField: UITextField!
    
    @IBOutlet weak var PickUpLocationAnchorView: UIView!
    
    @IBOutlet weak var DestinationTextField: UITextField!
    
    @IBOutlet weak var DestinationAnchorView: UIView!
    
    @IBOutlet weak var StartDateTextField: UITextField!
    
    @IBOutlet weak var StartDateAnchorView: UIView!
    
    @IBOutlet weak var EndDateTextField: UITextField!
    
    @IBOutlet weak var EndDateAnchorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CargoTypeDropDownAction(_ sender: UIButton) {
    }
    
    @IBAction func WieghtDropDownAction(_ sender: UIButton) {
    }
    
    @IBAction func LengthMeasureDropDownAction(_ sender: UIButton) {
    }
    
    @IBAction func HieghtMeasureDropDownAction(_ sender: UIButton) {
    }
    
    @IBAction func WidthMeasureMeasureDropDownAction(_ sender: UIButton) {
    }
    
    @IBAction func PickUpLocationDropDownAction(_ sender: UIButton) {
    }
    
    @IBAction func DestinationDropDownAction(_ sender: UIButton) {
    }
    
    
    
    
    @IBAction func TermsAndConditionAction(_ sender: UIButton) {
    }
    
    @IBAction func NextAction(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
