//
//  SignUpEXT.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 5.04.22.
//

import UIKit

extension SignUpVC{


    func setUpSignUpLabel(){
        signUpLabel.text = "Sign Up"
        signUpLabel.textColor = .black
        signUpLabel.font = UIFont.systemFont(ofSize: 45, weight: .bold)
    }
    
    func setUpTFiels(textField: UITextField){
        textField.backgroundColor = .systemGray4
        textField.layer.cornerRadius = 20
        //textField.placeholder = "login..."
        
    }
    
    func setUpSubmitBtn(){
        submitBtn.setTitle("Register", for: .normal)
        submitBtn.backgroundColor = .black
        submitBtn.layer.cornerRadius = 20
        submitBtn.setTitleColor(.white, for: .normal)
        
    }
    

    
    @objc func pressSubmitBtn(){
        signUpVM.validateDataForPush(name: nameTF.text ?? "", secondName: secondNameTF.text ?? "", age: ageTF.text ?? "", email: emailTF.text ?? "", password: passwordTF.text ?? "1", confirmPassword: confirmPasswordTF.text ?? "")//исправить эту хуйню
        
    }
    
    func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUpAlert(_: SignUpVM , message: String){
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.actionSheet)
            alertController.addAction(UIAlertAction(title: "Yes, daddy", style: UIAlertAction.Style.destructive))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}

