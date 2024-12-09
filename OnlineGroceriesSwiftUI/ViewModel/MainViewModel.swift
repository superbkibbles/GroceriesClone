//
//  MainViewModel.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Mend Mzury on 11/30/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared = MainViewModel()
    
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage: String = ""
    
    init() {
        #if DEBUG
        txtEmail = "test@gmail.com"
        txtPassword = "123456"
        #endif
    }
    
    // MARK: ServiceCall
    func serviceCallLogin() {
        if (txtEmail.isEmpty || txtPassword.isEmpty) {
            self.showError = true
            self.errorMessage = "please enter valid email address or password"
            return
        }
        if (!txtEmail.isValidEmail) {
            self.showError = true
            self.errorMessage = "please enter valid email"
            return
        }
        
        ServiceCall.post(parameter:  ["email": txtEmail, "password": txtPassword, "dervice_token": ""], path: Globs.SV_LOGIN) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    print(response)
                    self.showError = true
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                } else {
                    self.showError = true
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                }
            }
        } failure: { error in
            self.showError = true
            self.errorMessage = error?.localizedDescription ?? "Fail"
        }
        
    }
    
}
