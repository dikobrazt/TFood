//
//  SignInVM.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 4.04.22.
//

import Foundation
import FirebaseAuth



protocol signInVMDelegate: class{
    func goInApp(_: SignInVM)
    func setUpAlert(_: SignInVM, message: String)
}



class SignInVM {
    
    
    
    var statusText = SignInDynamic(v: "")
    weak var delegate: signInVMDelegate?
    
    func signInBtnPressed(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                self.delegate?.setUpAlert(self, message: error!.localizedDescription)
            }else{
                print("Вроде все заебись")
                self.delegate?.goInApp(self)
            }
        }
    }
}


