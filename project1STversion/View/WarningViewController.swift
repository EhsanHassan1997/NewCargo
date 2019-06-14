//
//  WarningViewController.swift
//  project1STversion
//
//  Created by Apple on 6/14/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class WarningViewController: UIViewController {

    @IBOutlet weak var WarningView: UIView!
    @IBOutlet weak var WarningLabel: UILabel!
    @IBOutlet weak var OKButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        WarningView.transform = CGAffineTransform(scaleX: 1.5, y: 0.5)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .allowUserInteraction, animations: {
            self.WarningView.transform = .identity
        }) { (Succ) in
            
        }
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        WarningView.layer.cornerRadius = 20
        OKButton.layer.cornerRadius = 20
        WarningLabel.text = UserDefaults.standard.string(forKey: "warning")
        UserDefaults.standard.set("", forKey: "warning")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func OKAction(_ sender: UIButton) {
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
