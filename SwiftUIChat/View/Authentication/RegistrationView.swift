//
//  RegistrationView.swift
//  SwiftUIChat
//
//  Created by Auto on 4/1/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack { Spacer() }
                Text("Get Started.")
                    .font(.title)
                    .bold()
                
                Text("Create your account")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 32) {
                    CustomTextField(imageName: "envelope", placeHolderText: "Email", isSecureField: false, text: $email)
                        .autocapitalization(.none)
                    
                    CustomTextField(imageName: "person", placeHolderText: "Username", isSecureField: false, text: $username)
                    
                    CustomTextField(imageName: "person", placeHolderText: "Full Name", isSecureField: false, text: $fullname)
                    
                    CustomTextField(imageName: "lock", placeHolderText: "Password", isSecureField: true, text: $password)
                }
                .padding([.top, .horizontal], 32)
            }
            .padding(.leading)
            
            Button(action: {
                print("Sign Up")
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            })
            .padding(.top, 24)
            .shadow(color: .gray, radius: 10)
            
            Spacer()
            
            Button {
                mode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have account?")
                        .font(.system(size: 14))
                    
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
            }

        }
    }
}

#Preview {
    RegistrationView()
}
