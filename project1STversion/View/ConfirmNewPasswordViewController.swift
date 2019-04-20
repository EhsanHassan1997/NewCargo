//
//  ConfirmNewPasswordViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 3/25/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import UIKit
import LGButton

class ConfirmNewPasswordViewController: UIViewController {
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DoneAction(_ sender: LGButton) {
        
        if confirmPasswordTextField.text == newPasswordTextField.text {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController")as! SignInViewController
//            vc.myPassword = newPasswordTextField.text!
            self.present(vc, animated: true, completion: nil)
            
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
