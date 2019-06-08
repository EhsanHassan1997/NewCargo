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
        
//        ApiMethods.LoginUser(Email: email!, Password: password!) { (tokeN) in
//            UserDefaults.standard.set(tokeN, forKey: "token")
        //     UserDefaults.standard.set(true, forKey: "Logged")
        
  //  }
//        ApiMethods.TransportRequestDetails(requestId: 3
//       , Request: (RequestDetaile)){(ReqTOTO) in
//
//        CargoType.text = "Cargo Type : " + ReqTOTO.cargoType
//        QuantityOfCargo.text = "Quantity : " + String(ReqTOTO.Quantity!)
//        WeightOfCargo.text = "Weight : " + String(ReqTOTO.Weight!)
//        VolumeOfCargo.text = "Volume : " + String(ReqTOTO.Volume!)
//        WidthOfCargo.text = "Width  : " + String(ReqTOTO.Width!)
//        HeightOfCargo.text = "Hieght : " + String(ReqTOTO.Hieght!)
//        LenghtOfCargo.text = "Lenght : " + String(ReqTOTO.Length!)
//        PickUpLocation.text = String(ReqTOTO.PickUp!)
//        DestinationLocation.text = String(ReqTOTO.Destination!)
//        ImportExportLogoImage.layer.cornerRadius = ImportExportLogoImage.bounds.width / 2
//        ImportExportLogoImage.clipsToBounds = true
//
//        }
        
        ApiMethods.TransportRequestDetails(requestId : 3) { (ReqTOTO) in
            print("Cargo Type:--\n", ReqTOTO.cargoType)
//            self.CargoType.text = "Cargo Type : " + ReqTOTO.cargoType
//            self.QuantityOfCargo.text = "Quantity : " + String(ReqTOTO.Quantity!)
//            self.WeightOfCargo.text = "Weight : " + String(ReqTOTO.Weight!)
//            self.VolumeOfCargo.text = "Volume : " + String(ReqTOTO.Volume!)
//            self.WidthOfCargo.text = "Width  : " + String(ReqTOTO.Width!)
//            self.HeightOfCargo.text = "Hieght : " + String(ReqTOTO.Hieght!)
//            self.LenghtOfCargo.text = "Lenght : " + String(ReqTOTO.Length!)
//            self.PickUpLocation.text = String(ReqTOTO.PickUp!)
//            self.DestinationLocation.text = String(ReqTOTO.Destination!)
        }
        
//        ReqTOTO.cargoType = "liqued"
//        ReqTOTO.Quantity = 3
//        ReqTOTO.Weight = 4.5
//        ReqTOTO.Hieght = 2
//        ReqTOTO.Length = 4
//        ReqTOTO.Width = 3
//        ReqTOTO.Volume = ReqTOTO.Weight! *  ReqTOTO.Hieght! * ReqTOTO.Width!
//        ReqTOTO.PickUp = " 23 st Giza Tahrer"
//        ReqTOTO.Destination = "34 st cairo naser"
        
        //        ReqTOTO.EndDate = Date()
        //        var EdateComponents = DateComponents()
        //        EdateComponents.year = 2020
        //        EdateComponents.month = 2
        //        EdateComponents.day = 10
        
        
        
        // let userCalendar = Calendar.current // user calendar
        // let someDateTime = userCalendar.date(from: SdateComponents)
        //let formatter = DateFormatter()
        //formatter.dateFormat = "yyyy/MM/dd"
        //let someDateTime = formatter.date(from: ReqTOTO.StartDate )
        //ReqTOTO.StartDate = Date()
        
//        let userCalendar = Calendar.current
//        var SdateComponents = DateComponents()
//        SdateComponents.year = 2019
//        SdateComponents.month = 7
//        SdateComponents.day = 20
//        let start = userCalendar.date(from: SdateComponents)!
//        let myFormatter = DateFormatter()
//        myFormatter.dateFormat = "dd/MM/y"
//        StartDate.text = " Start date : " + myFormatter.string(from: start)
//
//
//        var EdateComponents = DateComponents()
//        EdateComponents.year = 2020
//        EdateComponents.month = 2
//        EdateComponents.day = 10
//        let end = userCalendar.date(from:EdateComponents)!
//        let mmyFormatter = DateFormatter()
//        mmyFormatter.dateFormat = "dd/MM/y"
//        StartDate.text = "End date :" + myFormatter.string(from: end)
//
//
        
        //myFormatter.string(from: firstLandPhoneCallDate) // What gives?
        
        //        print("jhhgcf",myFormatter.string(from: firstLandPhoneCallDate))
        //        StartDate.text = myFormatter.string(from:firstLandPhoneCallDate )
        
        //        myFormatter.dateFormat = "MM/dd/yy"
        //        StartDate.text = myFormatter.string(from: firstLandPhoneCallDate)
        //        //label.text = result
        
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AcceptingAction(_ sender: LGButton) {
        var price : Int!
        //let cost = Double(textField.text!)
        price = Int(PriceTextField.text!)
        
        if (price != nil ){
            
            // open notifiaction again
            //            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransportNotification") as! TransportNotificationViewController
            //            self.navigationController?.pushViewController(vc, animated: true)
            print("notification button is clicked")
            
        }else if (price == nil){
            
            EnterPriceLable.text = "Plese enter your price"
            
        }else if (price == 0){
            
            EnterPriceLable.text = "Plese enter valid price"
            
        }
        print("price = ", price)
    }
    @IBAction func IgnoreActoin(_ sender: LGButton) {
        //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransportNotification") as! TransNotificationViewController
        //        self.navigationController?.pushViewController(vc, animated: true)
        //        print("notification button is clicked")
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

