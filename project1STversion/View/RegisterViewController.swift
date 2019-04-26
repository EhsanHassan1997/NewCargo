//
//  RegisterViewController.swift
//  project1STversion
//
//  Created by Ehsan Hassan on 4/12/19.
//  Copyright © 2019 Ehsan Hassan. All rights reserved.
//

import UIKit
import LGButton
import Kingfisher

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var errorMessageLable: UILabel!
    @IBOutlet weak var nextButton: LGButton!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let Image = info[.originalImage] as? UIImage {
             profileImageView.image = Image
            profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
            profileImageView.clipsToBounds = true
        }
        picker.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func AddImageAction(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func nextAction(_ sender: LGButton) {
        
        let myColor = UIColor.orange
        if (addressTextField.text == "" || phoneTextField.text == "" || emailTextField.text == "" || companyNameTextField.text == ""){
            errorMessageLable.text = "fill empty space "
            
            if (companyNameTextField.text == ""){
                companyNameTextField.layer.borderWidth =  2
                companyNameTextField.layer.cornerRadius = 7
                companyNameTextField.layer.borderColor = myColor.cgColor
                
            }else{
                companyNameTextField.layer.borderWidth =  0
            }
            if (emailTextField.text == "" ){
                emailTextField.layer.borderWidth =  2
                emailTextField.layer.cornerRadius = 7
                emailTextField.layer.borderColor = myColor.cgColor
                
            }else{
                emailTextField.layer.borderWidth =  0
                
            }
            if(phoneTextField.text == "" ){
                phoneTextField.layer.borderWidth =  2
                phoneTextField.layer.cornerRadius = 7
                phoneTextField.layer.borderColor = myColor.cgColor
                
            }else{
                phoneTextField.layer.borderWidth =  0
            }
            if (addressTextField.text == ""){
                addressTextField.layer.borderWidth =  2
                addressTextField.layer.cornerRadius = 7
                addressTextField.layer.borderColor = myColor.cgColor
                
            }else{
                addressTextField.layer.borderWidth =  0
                
                
            }
        }else{
            if (IsVailidEmail(emailID: emailTextField.text!)){
                var company = Company()
                company.name = companyNameTextField.text
                company.email = emailTextField.text
                company.Phone = phoneTextField.text
                company.Address = addressTextField.text
                performSegue(withIdentifier: "secondRegister", sender: company)
            
//        company.image = profileImageView
            }else{
                errorMessageLable.text = "Enter valid data"

            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondRegister"{
            let vc = segue.destination as! SecondRegisterViewController
            vc.myCompany = sender as? Company
        }
    }
    
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
