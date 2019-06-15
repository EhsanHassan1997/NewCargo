//
//  CreateRequestViewController.swift
//  project1STversion
//
//  Created by Apple on 6/7/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit
import DropDown
import GoogleMaps

//import 

class CreateRequestViewController: UIViewController, CLLocationManagerDelegate {

    var StartDateDatePicker = UIDatePicker()
    
    var EndDateDatePicker = UIDatePicker()

    var locationManager = CLLocationManager()

    let CargoTypeDropDown = DropDown()
    
    var acceptence : Bool!
    
    let WieghtMeasureDropDown = DropDown()
    
    let LengthMeasureDropDown = DropDown()
    
    let HieghtMeasureDropDown = DropDown()
    
    let WidthMeasureDropDown = DropDown()
    
    let PickUpLocationDropDown = DropDown()
    
    let DestinationDropDown = DropDown()
    
    @IBOutlet weak var TermsButton: UIButton!
    
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
    
    @IBOutlet weak var DestinationTextField: UITextField!
    
    @IBOutlet weak var StartDateTextField: UITextField!
    
    @IBOutlet weak var EndDateTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if(UserDefaults.standard.string(forKey: "Location_Return") == "PickUp"){
            PickUpLocationTextField.text = UserDefaults.standard.string(forKey: "LocationTaped")
            UserDefaults.standard.set("",forKey: "LocationTaped")
        }
        if(UserDefaults.standard.string(forKey: "Location_Return") == "Destination"){
            DestinationTextField.text = UserDefaults.standard.string(forKey: "LocationTaped")
            UserDefaults.standard.set("",forKey: "LocationTaped")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        CargoTypeDropDown.anchorView = CargoTypeAnchorView
        CargoTypeDropDown.dataSource = ["Liqued Materials","Sold Materials","Frozen Materials","Breakable Materials","Building Materials","Furniture","Vehicle","Vehicle Spare Parts"]
        
        WieghtMeasureDropDown.anchorView = WieghtMeasureAnchorView
        WieghtMeasureDropDown.dataSource = ["Ton","KG","G"]
        WieghtMeasureTextField.text = "Ton"
        
        LengthMeasureDropDown.anchorView = LengthMeasureAnchorView
        LengthMeasureDropDown.dataSource = ["Meter","cm"]
        LengthMeasureTextField.text = "Meter"
        
        HieghtMeasureDropDown.anchorView = HieghtMeasureAnchorView
        HieghtMeasureDropDown.dataSource = ["Meter","cm"]
        HieghtMeasureTextField.text = "Meter"
        
        WidthMeasureDropDown.anchorView = WidthMeasureAnchorView
        WidthMeasureDropDown.dataSource = ["Meter","cm"]
        WidthMeasureTextField.text = "Meter"
        
        StartDateDatePicker.datePickerMode = UIDatePicker.Mode.date
        
        StartDateDatePicker.addTarget(self, action: #selector(CreateRequestViewController.StartDateDatePickerValueChanged), for: UIControl.Event.valueChanged)
        
        EndDateDatePicker.datePickerMode = UIDatePicker.Mode.date
        
        EndDateDatePicker.addTarget(self, action: #selector(CreateRequestViewController.EndDateDatePickerValueChanged), for: UIControl.Event.valueChanged)
        
        let tapGusture = UITapGestureRecognizer(target: self, action: #selector(CreateRequestViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGusture)
        
        StartDateTextField.inputView = StartDateDatePicker
        
        EndDateTextField.inputView = EndDateDatePicker
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latitude = locations.last?.coordinate.latitude
        let longitude = locations.last?.coordinate.longitude
        UserDefaults.standard.set(Double(latitude!), forKey: "latitude")
        UserDefaults.standard.set(Double(longitude!), forKey: "longitude")
    }
    
    @objc func viewTapped(gestureRecognizer : UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func StartDateDatePickerValueChanged(_ sender: UIDatePicker) {
        
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "MM/dd/yyyy"
        
        StartDateTextField.text = dateformatter.string(from: sender.date)
        //        view.endEditing(true)
    }
    
    @objc func EndDateDatePickerValueChanged(_ sender: UIDatePicker) {
        
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "MM/dd/yyyy"
        
        EndDateTextField.text = dateformatter.string(from: sender.date)
        //        view.endEditing(true)
    }
    
    @IBAction func CargoTypeDropDownAction(_ sender: UIButton) {
        CargoTypeDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.CargoTypeTextField.text = item
        }
        
        DropDown.startListeningToKeyboard()
        
        CargoTypeDropDown.show()
    }
    
    @IBAction func WieghtDropDownAction(_ sender: UIButton) {
        WieghtMeasureDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.WieghtMeasureTextField.text = item
        }
        
        DropDown.startListeningToKeyboard()
        
        WieghtMeasureDropDown.show()
    }
    
    @IBAction func LengthMeasureDropDownAction(_ sender: UIButton) {
        LengthMeasureDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.LengthMeasureTextField.text = item
        }
        
        DropDown.startListeningToKeyboard()
        
        LengthMeasureDropDown.show()
    }
    
    @IBAction func HieghtMeasureDropDownAction(_ sender: UIButton) {
        HieghtMeasureDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.HieghtMeasureTextField.text = item
        }
        
        DropDown.startListeningToKeyboard()
        
        HieghtMeasureDropDown.show()
    }
    
    @IBAction func WidthMeasureMeasureDropDownAction(_ sender: UIButton) {
        WidthMeasureDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.WidthMeasureTextField.text = item
        }
        
        DropDown.startListeningToKeyboard()
        
        WidthMeasureDropDown.show()
    }
    
    @IBAction func SelectPickUpLocationAction(_ sender: UIButton) {
        UserDefaults.standard.set("PickUp", forKey: "Location_Return")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SetLocation") as! SetLocationOnMapViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func SelectDestinationAction(_ sender: UIButton) {
        UserDefaults.standard.set("Destination", forKey: "Location_Return")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SetLocation") as! SetLocationOnMapViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func TermsAndConditionAction(_ sender: UIButton) {
        let image : UIImage! = sender.image(for:.normal)
        
        if (image == UIImage(named:  "Unchecked")){
            
            sender.setImage( UIImage(named:"CheckTerms"), for:[] )
            acceptence = true
            
        }else{
            
            sender.setImage( UIImage(named:"Unchecked"), for: [] )
            acceptence = false
            
        }
    }
    
    @IBAction func NextAction(_ sender: UIButton) {
        if (CargoTypeTextField.text == ""){
            
            UserDefaults.standard.set("Enter Cargo Type", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
            
        }else if QuantityTextField.text == "" {
            
            UserDefaults.standard.set("Enter Quantity", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
            
        }else if WieghtTextField.text == "" {
            
            UserDefaults.standard.set("Enter Wieght", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
            
        }else if LengthTextField.text == "" {
            
            UserDefaults.standard.set("Enter Length", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
            
        }else if HieghtTextField.text == "" {
            
            UserDefaults.standard.set("Enter Hieght", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
            
        }else if WidthTextField.text == "" {
            
            UserDefaults.standard.set("Enter Width", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
            
        }else if PickUpLocationTextField.text == "" {
            
            UserDefaults.standard.set("Enter Pick Up Location", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
            
        }else if DestinationTextField.text == "" {
            
            UserDefaults.standard.set("Enter Destination", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
            
        }else if StartDateTextField.text == "" {
            
            UserDefaults.standard.set("Enter Start Date", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
            
        }else if EndDateTextField.text == "" {
            
            UserDefaults.standard.set("Enter End Date", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
            
        }else if StartDateDatePicker.date > EndDateDatePicker.date {
            UserDefaults.standard.set("End Date Should be after Start Date", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
        }else if acceptence {
            UserDefaults.standard.set(WieghtMeasureTextField.text, forKey: "WieghtMeasure")
            UserDefaults.standard.set(WidthMeasureTextField.text, forKey: "WidthMeasure")
            UserDefaults.standard.set(LengthMeasureTextField.text, forKey: "LengthMeasure")
            UserDefaults.standard.set(HieghtMeasureTextField.text, forKey: "HieghtMeasure")
            var request = Request()
            request.cargoType = CargoTypeTextField.text
            request.Destination = DestinationTextField.text
            request.EndDate = EndDateTextField.text
            request.Hieght = Double(HieghtTextField.text!)
            request.Length = Double(LengthTextField.text!)
            request.PickUp = PickUpLocationTextField.text
            request.Quantity = Int(QuantityTextField.text!)
            request.StartDate = StartDateTextField.text
            request.Weight = Double(WieghtTextField.text!)
            request.Width = Double(WidthTextField.text!)
            performSegue(withIdentifier: "RequestReview", sender: request)
        }else {
            UserDefaults.standard.set("you should accept terms and condition", forKey: "warning")
            let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
            self.addChild(Warning)
            Warning.view.frame = self.view.frame
            self.view.addSubview(Warning.view)
            Warning.didMove(toParent: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RequestReview"{
            let vc = segue.destination as! RequestReviewViewController
            vc.request = sender as? Request
        }
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
