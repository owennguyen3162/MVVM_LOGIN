//
//  ViewController.swift
//  MVVM
//
//  Created by Nguyen Anh Tuan on 26/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldemail: UITextField!
    @IBOutlet weak var texDone: UILabel!
    
    let LoginVM = LoginViewModel(email: "This is email", password: "This is password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }
    
    private func updateView () {
        textFieldemail.placeholder = LoginVM.email
        textFieldPassword.placeholder = LoginVM.password
    }
    
    private func fetchDataWhenLoginSuccess () {
        let (email, password) = LoginVM.fetchDataWhenLoginSuccess()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.texDone.text = "DONE \(email) \(password)"
        }
    }


    @IBAction func LoginAction(_ sender: Any) {
        let email = textFieldemail.text
        let password = textFieldPassword.text
        LoginVM.login(email: email ?? "", password: password ?? "") {
            (result) in
            switch(result){
            case .success :
                print("Login success")
                fetchDataWhenLoginSuccess()
                return
            case .failed(let text, let bol) :
                print(text)
            }
        }
    }
}

