//
//  SignDynamic.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 4.04.22.
//

import Foundation

class SignInDynamic <T> {
    typealias WorkerData = (T) -> Void
    private var workerData: WorkerData?
    
    func bind( workerData: WorkerData?){
        self.workerData = workerData
    }
    
    var value: T{
        didSet{
            workerData?(value)
        }
    }
    
    init(v: T){
        value = v
    }
    
}
