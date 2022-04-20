//
//  SignUpVM.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 4.04.22.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import Firebase



protocol SignUpVMDelegate: class {
    func setUpAlert(_: SignUpVM , message: String)
    func dismissView()
}


class SignUpVM {
   
    
    
    
    weak var delegate: SignUpVMDelegate?
    private let loginMinLength: Int = 6
    private let passwordMinLength: Int = 8
    private lazy var passwordRegex: String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{\(passwordMinLength),}$"
    
    func validateDataForPush(name: String, secondName: String, age: String, email: String, password: String, confirmPassword: String ){
        if  name != "" && secondName != "" && age != "" && email != "" && password != "" && confirmPassword != "" {
            if email.count >= loginMinLength{
                if password.matches(regex: passwordRegex){
                    if password == confirmPassword {
                     print("OK!")
                        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                            if error != nil{
                                if error?.localizedDescription != nil {
                                    print("\(error!.localizedDescription)")
                                    self.delegate?.setUpAlert(self, message: "\(error!.localizedDescription)" )
                                }else{
                                    self.delegate?.setUpAlert(self, message: "Oh...Shit" )
                                }
                                
                                self.delegate?.setUpAlert(self, message: "\(error?.localizedDescription)" )
                            }else{
                                self.delegate?.dismissView()
                                print(result?.user.uid)
                                let ref = Database.database(url: "https://tfood-ababe-default-rtdb.europe-west1.firebasedatabase.app").reference().child("workers")
                                ref.child((result?.user.uid)!).updateChildValues(
                                    [
                                    "name" : name,
                                    "secondName" : secondName,
                                    "age" : age,
                                    "login" : email,
                                    "password" : password
                                    ])
                            }
                        }
                    }else{
                      print("Пароли не совпадают")
                        self.delegate?.setUpAlert(self, message: "Passwords do not match")
                        }
                }else{
                    print("пароль должен содержать минимум: 1 большую, 1 маленькую, 1 цифру. Должен быть не менее 8 символов")
                    self.delegate?.setUpAlert(self, message: "Password must contain: 1UpC\n1LowC\n1num\nmin8symb")
                }
            }else{
                print("Лоин должен содержать минимум 6 символов")
                self.delegate?.setUpAlert(self, message: "Check your email")
            }

        }else{
            print("Заполните все поля!")
            self.delegate?.setUpAlert(self, message: "Fill all the fields")
        }
    }

    
}



extension String{
    func matches(regex: String)-> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}



extension SignUpVM{

}
