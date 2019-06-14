//
//  ShowRequestViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 4/11/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import UIKit
import LGButton
import Kingfisher

class ShowRequestViewController: UIViewController {
    
    @IBOutlet weak var ImportExportLogoImage: UIImageView!
    @IBOutlet weak var ImportExportNameLable: UILabel!
    @IBOutlet weak var CargoType: UILabel!
    @IBOutlet weak var QuantityOfCargo: UILabel!
    @IBOutlet weak var WeightOfCargo: UILabel!
    @IBOutlet weak var VolumeOfCargo: UILabel!
    @IBOutlet weak var WidthOfCargo: UILabel!
    @IBOutlet weak var HeightOfCargo: UILabel!
    @IBOutlet weak var LenghtOfCargo: UILabel!
    @IBOutlet weak var PickUpLocation: UILabel!
    @IBOutlet weak var DestinationLocation: UILabel!
    @IBOutlet weak var StartDate: UILabel!
    @IBOutlet weak var EndDate: UILabel!
    @IBOutlet weak var PriceTextField: UITextField!
    @IBOutlet weak var imageTerms: UIImageView!
    @IBOutlet weak var IgnoreButton: LGButton!
    @IBOutlet weak var AcceptButton: LGButton!
    @IBOutlet weak var EnterPriceLable: UILabel!
    
//    var  ReqTOTO = RequestDetaile()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\nhi\n")
        ApiMethods.TransportRequestDetails(requestId : 3) { (ss) in
            self.CargoType.text = "Cargo Type : " + ss.cargoType
            self.QuantityOfCargo.text = "Quantity : " + String(ss.Quantity!)
            self.WeightOfCargo.text = "Weight : " + String(ss.Weight!)
            self.VolumeOfCargo.text = "Volume : " + String(ss.Volume!)
            self.WidthOfCargo.text = "Width  : " + String(ss.Width!)
            self.HeightOfCargo.text = "Hieght : " + String(ss.Hieght!)
            self.LenghtOfCargo.text = "Lenght : " + String(ss.Length!)
            self.PickUpLocation.text = ss.PickUp
            self.DestinationLocation.text = ss.Destination
            self.StartDate.text = "Start Date: " + ss.StartDate
            self.EndDate.text = "End Date: " + ss.EndDate
            ApiMethods.GetUser(UserId: Int(ss.comIm_Ex)! , Usser: { (User) in
                self.ImportExportNameLable.text = User.name
            })
        }

        ApiMethods.CreateOffer(RequestId: 3, Price: Double(self.PriceTextField.text!)!)

    }
    
    @IBAction func AcceptingAction(_ sender: LGButton) {
        var price : Int!
        //let cost = Double(textField.text!)
        price = Int(PriceTextField.text!)
        
        if (price != nil ){
            print("notification button is clicked")
            
        }else if (price == nil){
            
            EnterPriceLable.text = "Plese enter your price"
            
        }else if (price == 0){
            
            EnterPriceLable.text = "Plese enter valid price"
            
        }
        print("price = ", price)
    }
    @IBAction func IgnoreActoin(_ sender: LGButton) {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransportNotification") as! TransportNotificationViewController
                self.navigationController?.pushViewController(vc, animated: true)
                print("notification button is clicked")
    }
    
    @IBAction func TermsConditions(_ sender: UIButton) {
        let image : UIImage! = sender.image(for:.normal)
        
        if (image == UIImage(named:  "Unchecked")){
            
            sender.setImage( UIImage(named:"CheckTerms"), for:[] )
            
        }else{
            
            sender.setImage( UIImage(named:"Unchecked"), for: [] )
            
        }
        
    }
    
    
    
    
}

