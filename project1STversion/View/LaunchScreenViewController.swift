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

        self.LogoImageView.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.height * 0.5)
        
        if(!UserDefaults.standard.bool(forKey: "Logged")){
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.LogoImageView.transform = .identity
            }) { (bool) in
               
                self.performSegue(withIdentifier: "SignIn", sender: nil)
            }
        }else{
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.LogoImageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            }) { (bool) in
                self.performSegue(withIdentifier: "transport", sender: nil)
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
