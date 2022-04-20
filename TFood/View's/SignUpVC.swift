//
//  SignUpVC.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 15.03.22.
//

import UIKit



class SignUpVC: UIViewController, SignUpVMDelegate {
    
    
    
    //MARK: - Declaration
    let nameTF = UITextField()
    let secondNameTF = UITextField()
    let ageTF = UITextField()
    let emailTF = UITextField()
    let passwordTF = UITextField()
    let confirmPasswordTF = UITextField()
    let submitBtn = UIButton()
    let signUpLabel = UILabel()
    let signUpVM = SignUpVM()
   
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {

        view.backgroundColor = .white
        view.addSubview(submitBtn)
        view.addSubview(signUpLabel)
        view.addSubview(nameTF)
        view.addSubview(secondNameTF)
        view.addSubview(ageTF)
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(confirmPasswordTF)
        submitBtn.addTarget(self, action: #selector(pressSubmitBtn), for: .touchUpInside)
        signUpVM.delegate = self
    }
    
    
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        //Fnc's
        setUpSubmitBtn()
        setUpSignUpLabel()
        setUpTFiels(textField: nameTF)
        nameTF.placeholder = "Name...*"// порнуха конечно
        setUpTFiels(textField: secondNameTF)
        secondNameTF.placeholder = "Second Name...*"
        setUpTFiels(textField: ageTF)
        ageTF.placeholder = "Age...*"
        setUpTFiels(textField: emailTF)
        emailTF.placeholder = "Login...*"
        setUpTFiels(textField: passwordTF)
        passwordTF.placeholder = "Password...*"
        passwordTF.isSecureTextEntry = true
        setUpTFiels(textField: confirmPasswordTF)
        confirmPasswordTF.placeholder = "Confirm Password...*"
        confirmPasswordTF.isSecureTextEntry = true
        //Frame's
        submitBtn.frame = .init(x: 0, y: 550, width: 200, height: 50)
        submitBtn.center.x = view.center.x
        signUpLabel.frame = .init(x: 0, y: 30, width: 165, height: 50)
        signUpLabel.center.x = view.center.x
        nameTF.frame = .init(x: 0, y: 100, width: 250, height: 50)
        nameTF.center.x = view.center.x
        secondNameTF.frame = .init(x: 0, y: 170, width: 250, height: 50)
        secondNameTF.center.x = view.center.x
        ageTF.frame = .init(x: 0, y: 240, width: 250, height: 50)
        ageTF.center.x = view.center.x
        emailTF.frame = .init(x: 0, y: 310, width: 250, height: 50)
        emailTF.center.x = view.center.x
        passwordTF.frame = .init(x: 0, y: 380, width: 250, height: 50)
        passwordTF.center.x = view.center.x
        confirmPasswordTF.frame = .init(x: 0, y: 450, width: 250, height: 50)
        confirmPasswordTF.center.x = view.center.x
        
    }
    
    
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
}






