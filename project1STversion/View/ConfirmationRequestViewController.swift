//
//  ConfirmationRequestViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 6/18/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit
import LGButton

class ConfirmationRequestViewController: UIViewController {
    @IBOutlet weak var ImExlable: UILabel!
    @IBOutlet weak var QuantityLabel: UILabel!
    @IBOutlet weak var WeightLabel: UILabel!
    @IBOutlet weak var Volume: UILabel!
    @IBOutlet weak var WidthLable: UILabel!
    @IBOutlet weak var HightLabel: UILabel!
    @IBOutlet weak var Lenght: UILabel!
    @IBOutlet weak var PickUPLable: UILabel!
    @IBOutlet weak var DestinationLable: UILabel!
    @IBOutlet weak var CargoTypeLabel: UILabel!
    @IBOutlet weak var StartDate: UILabel!
    @IBOutlet weak var EndDate: UILabel!
    @IBOutlet weak var AcceptImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "appLogo-1"))
        
        ApiMethods.TransportRequestDetails(requestId : (UserDefaults.standard.integer(forKey: "reqId") + 11)) { (ss) in
            self.CargoTypeLabel.text = "Cargo Type : " + ss.cargoType
            self.QuantityLabel.text = "Quantity : " + String(ss.Quantity!)
            self.WeightLabel.text = "Weight : " + String(ss.Weight!)
            self.Volume.text = "Volume : " + String(ss.Volume!)
            self.WidthLable.text = "Width  : " + String(ss.Width!)
            self.HightLabel.text = "Hieght : " + String(ss.Hieght!)
            self.Lenght.text = "Lenght : " + String(ss.Length!)
            self.PickUPLable.text = ss.PickUp
            self.DestinationLable.text = ss.Destination
            self.StartDate.text = "Start Date: " + ss.StartDate
            self.EndDate.text = "End Date: " + ss.EndDate
            ApiMethods.GetUser(UserId: Int(ss.comIm_Ex)! , Usser: { (User) in
                
                self.ImExlable.text = User.name
            })
        // Do any additional setup after loading the view.
    }
    }
    @IBAction func AcceppteAction(_ sender: UIButton) {
        print("clicked")
//        self.performSegue(withIdentifier: "companyAcceptRequest", sender: nil)
        UserDefaults.standard.set(true, forKey: "AcceptedRequest")
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func IgnorreAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "companyAcceptRequest", sender: nil)
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
