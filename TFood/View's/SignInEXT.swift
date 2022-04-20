//
//  SignInEXT.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 5.04.22.
//

import UIKit



extension SignInVC{
    
    
    
    func bindSignInVM(){
        signInVM.statusText.bind( workerData: {(statusText) in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        })
    }
    
//    func setUpStatusLabel(){
//        statusLabel.text = "Don't have an account?"
//        statusLabel.textColor = .systemGray4
//        statusLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
//    }
    
    func setUpSignUpBtn(){
        signUpBtn.setTitle("Sign Up", for: .normal)
        signUpBtn.backgroundColor = .black
        signUpBtn.layer.cornerRadius = 20
        signUpBtn.setTitleColor(.systemGreen, for: .normal)
    }
    
    func setUpOrLabel(){
        orLabel.text = "Don't have an account?"
        orLabel.textColor = .systemGray4
        orLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
    }
    
    func setUptFoodLabel(){
        tFoodLabel.text = "TFood"
        tFoodLabel.textColor = .black
        tFoodLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    }
    
    func setUpTF(){
        loginTF.backgroundColor = .systemGray4
        passwordTF.backgroundColor = .systemGray4
        loginTF.layer.cornerRadius = 20
        passwordTF.layer.cornerRadius = 20
        loginTF.placeholder = "login..."
        passwordTF.placeholder = "password..."
    }
    
    func setUpBtn(){
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.backgroundColor = .black
        signInBtn.layer.cornerRadius = 20
        signInBtn.setTitleColor(.white, for: .normal)
    
    }
    
    @objc func pressSignInBtn(){

    signInVM.signInBtnPressed(email: loginTF.text ?? "", password: passwordTF.text ?? "")

    }
    
    @objc func pressSignUpBtn(){
        let signUpVC = SignUpVC()
        present(signUpVC, animated: true, completion: nil)
    }
    
    func goInApp(_: SignInVM) {
        print("F")
        let mainVC = MainVC()
        mainVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(mainVC, animated: true, completion: nil)
    }
    
    func setUpAlert(_: SignInVM, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.actionSheet)
            alertController.addAction(UIAlertAction(title: "Yes, daddy", style: UIAlertAction.Style.destructive))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    

    
    
    
}

