//
//  LaunchScreenViewController.swift
//  project1STversion
//
//  Created by Apple on 6/10/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var LogoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(!UserDefaults.standard.bool(forKey: "rememberUser")){
            UserDefaults.standard.set("", forKey: "userEmail")
            UserDefaults.standard.set("", forKey: "userPassword")
        }
        
        if(!UserDefaults.standard.bool(forKey: "Logged")){
            
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.LogoImageView.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height * 0.165)
            }) { (bool) in
               
                self.performSegue(withIdentifier: "SignIn", sender: nil)
            }
        }else{
//            self.LogoImageView.center = self.view.center
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveLinear, animations: {
                
                self.LogoImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }) { (bool) in
                if(UserDefaults.standard.string(forKey: "userType") == "transport"){
                    self.performSegue(withIdentifier: "transport", sender: nil)
                }
                if(UserDefaults.standard.string(forKey: "userType") == "import_export"){
                    self.performSegue(withIdentifier: "importExport", sender: nil)
                }
            }
        }
        
        // Do any additional setup after loading the view.
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
