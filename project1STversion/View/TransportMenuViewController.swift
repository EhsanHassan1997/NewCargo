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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        
        MenuView.transform = CGAffineTransform(translationX: MenuView.center.x - view.bounds.width, y: 0.5)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.MenuView.transform = .identity
        }) { (success) in
            
        }
        
//        self.showAnimate()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func HideAction(_ sender: UIButton) {
        self.removeAnimate()
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.MenuView.transform = CGAffineTransform(translationX: self.MenuView.center.x - 2 * self.view.bounds.width, y: 0.5)
        }) { (success) in
            self.view.removeFromSuperview()
        }
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

    @IBAction func PaymentAction(_ sender: UIButton) {
        
    }
    @IBAction func CurrentShipment(_ sender: UIButton) {
        
    }
    @IBAction func HistoryOfShipment(_ sender: UIButton) {
        
    }
   
    @IBAction func LogOtuAction(_ sender: Any) {
    }
    @IBAction func ContactUsAction(_ sender: Any) {
    }
    @IBAction func HelpAction(_ sender: Any) {
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
