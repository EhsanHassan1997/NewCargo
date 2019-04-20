//
//  VerifyEmailViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 3/16/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import UIKit

class VerifyEmailViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var MessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    // MARK:- Confirmation
    
    @IBAction func ConfirmAction(_ sender: UIButton) {
        
        let email = emailTextField.text
        let user = User()
        user.email = "ehsanhassan2015@gmail.com"
        user.password = "1997son28son1"
        
        if email == ""{
            
            MessageLabel.textColor = UIColor.orange
            MessageLabel.text = "enter your email"
            
        }else if IsVailidEmail(emailID: email!){
                
                if (email == user.email){
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "VerificationCodeID")as! VerificationCodeViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }else{
                    
                    MessageLabel.textColor = UIColor.orange
                    MessageLabel.text = "Not found this email"
                    
                }
                
        }else{
            
            MessageLabel.textColor = UIColor.orange
            MessageLabel.text = "Enter Valid Email"
            
        }
    
    }
    
    // MARK:- Is Valid Email
    
    func IsVailidEmail(emailID :String )-> Bool{
        let EmailRegEx = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}"
        let EmailTest = NSPredicate(format: "SELF MATCHES %@", EmailRegEx)
        return EmailTest.evaluate(with: emailID)
        
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
