//
//  ImportExportMenuViewController.swift
//  project1STversion
//
//  Created by Apple on 6/5/19.
//  Copyright © 2019 ehsan hassan. All rights reserved.
//

import UIKit

class ImportExportMenuViewController: UIViewController {

    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var CompanyNameLabel: UILabel!
    @IBOutlet weak var PrfileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        
        CompanyNameLabel.text = UserDefaults.standard.string(forKey: "UserName")
        
        PrfileImageView.image = ImExImage 
        
        MenuView.transform = CGAffineTransform(translationX: MenuView.center.x - view.bounds.width, y: 0.5)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.MenuView.transform = .identity
        }) { (success) in
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ProfileAction(_ sender: UIButton) {
    }
    
    @IBAction func BookTransportAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateRequest") as! CreateRequestViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func PaymentAction(_ sender: UIButton) {
    }
    
    @IBAction func CurrentShipmentAction(_ sender: UIButton) {
    }
    
    @IBAction func HistoryOfShipmentAction(_ sender: UIButton) {
    }
    
    @IBAction func LogoutAction(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "Logged")
        self.performSegue(withIdentifier: "importExportLogout", sender: nil)
    }
    
    @IBAction func ContactUsAction(_ sender: UIButton) {
    }
    
    @IBAction func HelpAction(_ sender: UIButton) {
    }
    
    @IBAction func HideAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.MenuView.transform = CGAffineTransform(translationX: self.MenuView.center.x - 2 * self.view.bounds.width, y: 0.5)
        }) { (success) in
            self.view.removeFromSuperview()
        }
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
