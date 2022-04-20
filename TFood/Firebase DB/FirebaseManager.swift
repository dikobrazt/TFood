//
//  FirebaseManager.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 6.04.22.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseDatabase


class FirebaseManager{
    
    static let shated = FirebaseManager()
    
    private func configureFB() -> Firestore{
        var workersDB: Firestore!
        var settingsFB = FirestoreSettings()
        settingsFB = Firestore.firestore().settings
        workersDB = Firestore.firestore()
        return workersDB
       
    }
    
    func getDataFromDB(collection: String, docName: String, completion: @escaping (Worker?) -> Void){
        let db = configureFB()
        db.collection(collection).document(docName).getDocument(completion: {(document, error) in
            if error != nil{
                completion(nil)
                return
            }else{
                let workerInfo = Worker(firstName: document?.get("firstName") as! String, secondName: document?.get("secondName") as! String, age: document?.get("age") as! String, workPosition: document?.get("workPosition") as! String, login: document?.get("login") as! String, password: document?.get("password") as! String)
                completion(workerInfo)
            }
        })
    }
    

    
    
    
}
