//
//  RegisterViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 3/17/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import UIKit
import LGButton

class RegisterViewController: UIViewController {
  
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var AddressTextFiled: UITextField!
    @IBOutlet weak var PhoneTextFiled: UITextField!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var companyNameTextFiled: UITextField!
    @IBOutlet weak var errorLable: UILabel!
//    static var company:Company?
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextActinButton(_ sender: LGButton) {
        let myColor = UIColor.orange
        if (AddressTextFiled.text == "" || PhoneTextFiled.text == "" || emailTextFiled.text == "" || companyNameTextFiled.text == ""){
            errorLable.text = "fill empty space "

            if (companyNameTextFiled.text == ""){
                companyNameTextFiled.layer.borderWidth =  2
                companyNameTextFiled.layer.cornerRadius = 7
                companyNameTextFiled.layer.borderColor = myColor.cgColor

            }else{
                companyNameTextFiled.layer.borderWidth =  0
            }
            if (emailTextFiled.text == "" ){
                emailTextFiled.layer.borderWidth =  2
                emailTextFiled.layer.cornerRadius = 7
                emailTextFiled.layer.borderColor = myColor.cgColor

            }else{
                emailTextFiled.layer.borderWidth =  0

            }
            if(PhoneTextFiled.text == "" ){
                PhoneTextFiled.layer.borderWidth =  2
                PhoneTextFiled.layer.cornerRadius = 7
                PhoneTextFiled.layer.borderColor = myColor.cgColor

            }else{
                PhoneTextFiled.layer.borderWidth =  0
            }
            if (AddressTextFiled.text == ""){
                AddressTextFiled.layer.borderWidth =  2
                AddressTextFiled.layer.cornerRadius = 7
                AddressTextFiled.layer.borderColor = myColor.cgColor

            }else{
                AddressTextFiled.layer.borderWidth =  0


            }
            }else{
            if (IsVailidEmail(emailID: emailTextFiled.text!)){
        
                var company = User()
                
                company.name = companyNameTextFiled.text
//                company.address = AddressTextFiled.text
                company.email = emailTextFiled.text
//                company.phone.append(PhoneTextFiled.text!)
//                company?.companyID = "121"
//                company?.specialization = "dddddd"
//                company?.taxCard = 233
//                company?.taxFileNumber = 876
//                company?.image = "jghchg"
//                company?.password = "gggffdddd"
//                company?.rate = 3.2
//                company?.type = "hfyftdtdt"
//                company?.userID = 1
                
                performSegue(withIdentifier: "secondRegister", sender: company)
//                let vc = storyboard?.instantiateViewController(withIdentifier: "SecondRegisterID") as! SecondRegisterViewController
//                vc.newUser = company
//                self.navigationController?.pushViewController(vc, animated: true)
//            }else{
//                errorLable.text = "Enter valid data"
//            }
//        }
    }
    
    func IsVailidEmail(emailID :String )-> Bool{
        let EmailRegEx = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}"
        let EmailTest = NSPredicate(format: "SELF MATCHES %@", EmailRegEx)
        return EmailTest.evaluate(with: emailID)
        
    }
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondRegisterID"{
            let myVc = segue.destination as! SecondRegisterViewController
            myVc.newUser = sender as? User
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
