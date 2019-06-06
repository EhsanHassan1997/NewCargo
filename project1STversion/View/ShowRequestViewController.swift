//
//  ShowRequestViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 4/11/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import UIKit
import LGButton

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
    @IBOutlet weak var AcceptConditionButton: UIImageView!
    @IBOutlet weak var IgnoreButton: LGButton!
    @IBOutlet weak var AcceptButton: LGButton!
    var  ReqTOTO : RequestDetaile!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //        ReqTOTO.cargoType = "liqued"
        //        ReqTOTO.Quantity = 3
        //        ReqTOTO.Weight = 4.5
        //        ReqTOTO.Hieght = 2
        //        ReqTOTO.Length = 4
        //        ReqTOTO.Width = 3
        
        //        ReqTOTO.StartDate = Date()
        //        var SdateComponents = DateComponents()
        //        SdateComponents.year = 2019
        //        SdateComponents.month = 7
        //        SdateComponents.day = 20
        //
        //        ReqTOTO.EndDate = Date()
        //        var EdateComponents = DateComponents()
        //        EdateComponents.year = 2020
        //        EdateComponents.month = 2
        //        EdateComponents.day = 10
        
        //        ReqTOTO.Volume = ReqTOTO.Weight! *  ReqTOTO.Hieght! * ReqTOTO.Width!
        
        //        ReqTOTO.PickUp = " 23 st Giza Tahrer"
        //        ReqTOTO.Destination = "34 st cairo naser"
        
        //        CargoType.text = ReqTOTO.cargoType
        //        QuantityOfCargo.text = String(ReqTOTO.Quantity!)
        //        WeightOfCargo.text = String(ReqTOTO.Weight!)
        //        VolumeOfCargo.text = String(ReqTOTO.Volume!)
        //        WidthOfCargo.text = String(ReqTOTO.Width!)
        //        LenghtOfCargo.text = String(ReqTOTO.Length!)
        //        PickUpLocation.text = String(ReqTOTO.PickUp!)
        //        DestinationLocation.text = String(ReqTOTO.Destination!)
        
        //       let userCalendar = Calendar.current // user calendar
        //       let someDateTime = userCalendar.date(from: SdateComponents)
        
        //        let formatter = DateFormatter()
        //        formatter.dateFormat = "yyyy/MM/dd"
        //        let someDateTime = formatter.date(from: ReqTOTO.StartDate )
        let userCalendar = Calendar.current
        //        ReqTOTO.StartDate = Date()
        var SdateComponents = DateComponents()
        SdateComponents.year = 2019
        SdateComponents.month = 7
        SdateComponents.day = 20
        //        SdateComponents.dateFormat = "dd/MM/yyyy"
        let firstLandPhoneCallDate = userCalendar.date(from: SdateComponents)!
        let myFormatter = DateFormatter()
        
        //        myFormatter.string(from: firstLandPhoneCallDate) // What gives?
        
        print("jhhgcf",myFormatter.string(from: firstLandPhoneCallDate))
        StartDate.text = myFormatter.string(from: firstLandPhoneCallDate)
        //        label.text = result
        
        ImportExportLogoImage.layer.cornerRadius = ImportExportLogoImage.bounds.width / 2
        ImportExportLogoImage.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AcceptAction(_ sender: LGButton) {
    }
    
    @IBAction func IgnoreActoin(_ sender: LGButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransportNotification") as! TransportNotificationViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("notification button is clicked")
        
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

