//
//  SignUpView.swift
//  Todo
//
//  Created by Vinh Nguyen on 2019/09/27.
//  Copyright © 2019 GCS. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("Email")
                    TextField("Enter emai address", text: $email)
                }
                .padding()
                
                HStack {
                    Text("Password")
                    SecureField("Enter password", text: $password)
                }
                .padding()
                
                Button(action: handleSignUp) {
                    Text("Sign Up")
                }
            }
        }
        .padding()
    }
    
    func handleSignUp() {
        guard !email.isEmpty && !password.isEmpty else {
            return
        }
        
        self.session.signUp(email: self.email, password: self.password) { (result, error) in
            if error != nil {
                print("Error")
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
