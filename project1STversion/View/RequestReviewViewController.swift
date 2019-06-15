//
//  RequestReviewViewController.swift
//  project1STversion
//
//  Created by Apple on 6/14/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit
import LGButton

class RequestReviewViewController: UIViewController {

    var request : Request!
    
    @IBOutlet weak var CargoTypeLabel: UILabel!
    
    @IBOutlet weak var QuantityLabel: UILabel!
 
    @IBOutlet weak var WeightLabel: UILabel!
    
    @IBOutlet weak var VolumeLabel: UILabel!
    
    @IBOutlet weak var WidthLabel: UILabel!
    
    @IBOutlet weak var HieghtLabel: UILabel!
    
    @IBOutlet weak var LengthLabel: UILabel!
    
    @IBOutlet weak var PickUpLabel: UILabel!
    
    @IBOutlet weak var Destination: UILabel!
    
    @IBOutlet weak var StartDateLabel: UILabel!
    
    @IBOutlet weak var EndDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CargoTypeLabel.text = "Cargo Type: " + request.cargoType
        
        QuantityLabel.text = "Quantity: " + String(request.Quantity!)
        
        WeightLabel.text = "Weight: " + String(request.Weight!) + " " + UserDefaults.standard.string(forKey: "WieghtMeasure")!
        if(UserDefaults.standard.string(forKey: "WieghtMeasure") == "KG"){
            request.Weight = request.Weight / 1000
        }
        if(UserDefaults.standard.string(forKey: "WieghtMeasure") == "G"){
            request.Weight = request.Weight / (1000*1000)
        }
        UserDefaults.standard.set("",forKey: "WieghtMeasure")
        
        VolumeLabel.text = "Volume: " + String(request.Width! * request.Length! * request.Hieght!) + " Cubic Meter"
        
        WidthLabel.text = "Width: " + String(request.Width!) + " " + UserDefaults.standard.string(forKey: "WidthMeasure")!
        if(UserDefaults.standard.string(forKey: "WidthMeasure") == "cm"){
            request.Width = request.Width / 100
        }
        UserDefaults.standard.set("",forKey: "WidthMeasure")

        HieghtLabel.text = "Hieght: " + String(request.Hieght!) + " " + UserDefaults.standard.string(forKey: "HieghtMeasure")!
        if(UserDefaults.standard.string(forKey: "HieghtMeasure") == "cm"){
            request.Hieght = request.Hieght / 100
        }
        UserDefaults.standard.set("",forKey: "HieghtMeasure")

        LengthLabel.text = "Length: " + String(request.Length!) + " " + UserDefaults.standard.string(forKey: "LengthMeasure")!
        if(UserDefaults.standard.string(forKey: "LengthMeasure") == "cm"){
            request.Length = request.Length / 100
        }
        UserDefaults.standard.set("",forKey: "LengthMeasure")

        PickUpLabel.text = request.PickUp
        Destination.text = request.Destination
        StartDateLabel.text = "Start Date: " + request.StartDate
        EndDateLabel.text = "End Date: " + request.EndDate
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BookAction(_ sender: LGButton) {
        ApiMethods.CreateRequest(request: request, companyID: UserDefaults.standard.integer(forKey: "UserID")) { (requestID) in
            if (requestID == 0){
                UserDefaults.standard.set("Error Connection", forKey: "warning")
                let Warning = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Warning") as! WarningViewController
                self.addChild(Warning)
                Warning.view.frame = self.view.frame
                self.view.addSubview(Warning.view)
                Warning.didMove(toParent: self)
            }
        }
        self.performSegue(withIdentifier: "RequestDone", sender: nil)
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
