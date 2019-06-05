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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
