//
//  LoginView.swift
//  Todo
//
//  Created by Vinh Nguyen on 2019/09/27.
//  Copyright © 2019 GCS. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign in")
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            
            Button(action: self.handleLogin) {
                Text("Login")
            }
            .padding()
            
            NavigationLink(destination: SignUpView()) {
                Text("Sign up")
            }
        }
        .padding()
    }
    
    func handleLogin() {
        self.session.logIn(email: self.email, password: self.password) { (result, error) in
            if error != nil {
                print("Error")
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
