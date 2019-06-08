//
//  TransportMenu ViewController.swift
//  project1STversion
//
//  Created by Apple on 4/26/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class TransportMenuViewController: UIViewController {

    @IBOutlet weak var CompanyName: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var PaymentButton: UIButton!
    @IBOutlet weak var HistoryOfShipment: UIButton!
    
    @IBOutlet weak var LogoutCutton: UIButton!
    @IBOutlet weak var CurrentShipment: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
//        self.showAnimate()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func HideAction(_ sender: UIButton) {
        self.removeAnimate()
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
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
