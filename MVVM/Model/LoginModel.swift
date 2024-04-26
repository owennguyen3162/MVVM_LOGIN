//
//  LoginModel.swift
//  MVVM
//
//  Created by Nguyen Anh Tuan on 26/4/24.
//

import Foundation

class LoginModel {

    private static var shareDataManager: LoginModel = {
        let loginModel = LoginModel()
        return loginModel
    }()
  
    
     class func shared() -> LoginModel {
        return shareDataManager
    }
    
    func read() -> (String, String) {
           let email = UserDefaults.standard.string(forKey: "email") ?? ""
           let password = UserDefaults.standard.string(forKey: "password") ?? ""
           return (email, password)
       }
    
    func save(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "email")
                UserDefaults.standard.set(password, forKey: "password")
                UserDefaults.standard.synchronize()
    }
    
}
