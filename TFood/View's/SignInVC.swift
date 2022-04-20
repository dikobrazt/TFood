//
//  SignInVC.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 15.03.22.
//

import UIKit
import CloudKit



class SignInVC: UIViewController, signInVMDelegate {

    
    
    
    
    //MARK: - Declaration
    let signInBtn = UIButton()
    let loginTF = UITextField()
    let passwordTF = UITextField()
    let tFoodLabel = UILabel()
    let orLabel = UILabel()
    let signUpBtn = UIButton()
    let statusLabel = UILabel()
    var signInVM = SignInVM()
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(loginTF)
        view.addSubview(passwordTF)
        view.addSubview(signInBtn)
        view.addSubview(tFoodLabel)
        view.addSubview(orLabel)
        view.addSubview(signUpBtn)
        view.addSubview(statusLabel)
        signInBtn.addTarget(self, action: #selector(pressSignInBtn), for: .touchUpInside)
        signUpBtn.addTarget(self, action: #selector(pressSignUpBtn), for: .touchUpInside)
            bindSignInVM()
        signInVM.delegate = self
        
      
        
    }
    
    
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
         setUpBtn()
         setUpTF()
         passwordTF.isSecureTextEntry = true
         setUptFoodLabel()
         setUpOrLabel()
         setUpSignUpBtn()
         //setUpStatusLabel()
    }
    
    
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        signInBtn.frame = .init(x: 0, y: 570, width: 200, height: 50)
        signInBtn.center.x = view.center.x
        loginTF.frame = .init(x: 0, y: 350, width: 200, height: 50)
        loginTF.center.x = view.center.x
        passwordTF.frame = .init(x: 0, y:425, width: 200, height: 50)
        passwordTF.center.x = view.center.x
        tFoodLabel.frame = .init(x: 0, y: 50, width:150 , height: 100)
        tFoodLabel.center.x = view.center.x
        orLabel.frame = .init(x: 0, y: 615, width: 170, height: 50)
        orLabel.center.x = view.center.x
        signUpBtn.frame = .init(x: 0, y: 660, width: 200, height: 50)
        signUpBtn.center.x = view.center.x
        statusLabel.frame = .init(x: 0, y: 150, width: 200, height: 50)
    }
}


