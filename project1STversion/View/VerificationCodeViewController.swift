//
//  VerificationCodeViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 3/17/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import UIKit
import LGButton

class VerificationCodeViewController: UIViewController {
    @IBOutlet weak var firstCharTextField: UITextField!
    @IBOutlet weak var secondCharTextField: UITextField!
    @IBOutlet weak var thirdCharTextField: UITextField!
    @IBOutlet weak var forthCharTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    let key = "KCQG"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ConfirmAction(_ sender: LGButton) {
        
        let code = firstCharTextField.text! + secondCharTextField.text! + thirdCharTextField.text! + forthCharTextField.text!
        
        if code == key {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmNewPasswordViewController") as! ConfirmNewPasswordViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else{
            messageLabel.textColor = UIColor.orange
            messageLabel.text = "Code is not correct"
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
