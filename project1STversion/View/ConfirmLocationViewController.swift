//
//  ConfirmLocationViewController.swift
//  testingAnimation
//
//  Created by Apple on 6/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ConfirmLocationViewController: UIViewController {
    
    @IBOutlet weak var LocationLabel: UILabel!
    
    @IBOutlet weak var DoneButton: UIButton!
    
    @IBOutlet weak var BackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DoneButton.layer.cornerRadius = 10
        BackButton.layer.cornerRadius = 10
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        LocationLabel.text = UserDefaults.standard.string(forKey: "LocationTaped")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackAction(_ sender: UIButton) {
        self.view.removeFromSuperview()
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
