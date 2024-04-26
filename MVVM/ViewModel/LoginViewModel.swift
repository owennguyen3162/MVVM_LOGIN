//
//  LoginViewModel.swift
//  MVVM
//
//  Created by Nguyen Anh Tuan on 26/4/24.
//

import Foundation


enum LoginResult {
    case success
    case failed (String, Bool)
    
}
class LoginViewModel {
    var email: String;
    var password: String;
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    typealias Complete = (LoginResult) -> Void
    
     func login(email: String, password: String, complete: Complete) {
        if (email.isEmpty || password.isEmpty){
            complete(.failed("Login failed", false))
        }else{
            LoginModel.shared().save(email: email, password: password)
            complete(.success)
        }
    }
    
     func fetchDataWhenLoginSuccess() -> (String, String) {
        let (email,password) = LoginModel.shared().read()
        return (email,password)
    }
    
}
