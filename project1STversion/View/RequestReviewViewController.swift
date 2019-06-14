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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BookAction(_ sender: LGButton) {
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
