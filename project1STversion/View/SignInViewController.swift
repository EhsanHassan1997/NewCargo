//
//  ViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 1/29/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import UIKit
import LGButton

class SignInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var rememberMeButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(UserDefaults.standard.bool(forKey: "rememberUser")){
            emailTextField.text = UserDefaults.standard.string(forKey: "userEmail")
            passwordTextField.text = UserDefaults.standard.string(forKey: "userPassword")
            rememberMeButton.setImage( UIImage(named:"CheckedRememberme"), for: [] )
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK:- Forget Password
    
    @IBAction func ForgetPasswordAction(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VerifyEmailViewControllerID") as! VerifyEmailViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // MARK:- Remember Me
    
    @IBAction func RememberMeAction(_ sender: UIButton) {
        
        let image : UIImage! = sender.image(for:.normal)

        if (image == UIImage(named:  "rememberMe")){
            
            sender.setImage( UIImage(named:"CheckedRememberme"), for:[] )
            UserDefaults.standard.set(true, forKey: "rememberUser")
            
        }else{
            
            sender.setImage( UIImage(named:"rememberMe"), for: [] )
            UserDefaults.standard.set(false, forKey: "rememberUser")
            
        }
        
    }
    
    // MARK:- Sign In
    
    @IBAction func SignInAction(_ sender: UIButton) {
    
        let email = emailTextField.text
        let password = passwordTextField.text
        
            

//        let email = emailTextField.text
//        let password = passwordTextField.text
//        user.email = "ehsanhassan2015@gmail.com"
//        user.password = "1997son28son1"

        
//        errorMessageLabel.text = "/knjkdjhbjkhbkf"
        
        if (password == "" && email == "") {
            
            errorMessageLabel.text = "Fill Empty Space"
            
        }else if password == "" {
            if IsVailidEmail(emailID: email!){
                
                errorMessageLabel.text = "Please Enter password"
                
            }else{
                
                errorMessageLabel.text = "Enter valid data"
                
            }
            
        }else if email == "" {
            
            errorMessageLabel.text = "Please Enter Email"
        
        }else {
         
            if IsVailidEmail(emailID: email!){
                
                errorMessageLabel.text = ""
                
                ApiMethods.LoginUser(Email: email!, Password: password!) { (tokeN,Type) in
                    print("token:-  ",tokeN)
                    UserDefaults.standard.set(tokeN, forKey: "token")
                    UserDefaults.standard.set(true, forKey: "Logged")
                    UserDefaults.standard.set(Type, forKey: "userType")
                    if(UserDefaults.standard.bool(forKey: "rememberUser")){
                        UserDefaults.standard.set(self.emailTextField.text, forKey: "userEmail")
                        UserDefaults.standard.set(self.passwordTextField.text, forKey: "userPassword")
                    }else{
                        UserDefaults.standard.set("", forKey: "userEmail")
                        UserDefaults.standard.set("", forKey: "userPassword")
                    }
                    if(Type == "transport"){
                        self.performSegue(withIdentifier: "transportSigningIn", sender: nil)
                    }
                    if(Type == "import_export"){
                        self.performSegue(withIdentifier: "importExportSigningIn", sender: nil)
                    }
                }
//                    }else {
//
//                        errorMessageLabel.text = "Your password don't match this email"
//
//                    }
                
//                }else{
//
//                    errorMessageLabel.text = "This email not found"
//
//                }
//
                
                //            }
                
            }else{
                
                errorMessageLabel.text = "Enter valid data"
                
            }
                
        }

        
    }
    
    // MARK:- Register
    
    @IBAction func RegisterAction(_ sender: UIButton) {
        print("11")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterID")as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // MARK:- Is Valid Email
    
    func IsVailidEmail(emailID :String )-> Bool{
        let EmailRegEx = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}"
        let EmailTest = NSPredicate(format: "SELF MATCHES %@", EmailRegEx)
        return EmailTest.evaluate(with: emailID)
        
    }
    
    
}
