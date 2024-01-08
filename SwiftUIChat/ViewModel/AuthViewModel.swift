//
//  AuthViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 8/1/24.
//

import Firebase

class AuthViewModel: NSObject, ObservableObject {
    
    func logIn() {
        print("LogIn user from viewModel")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Registration failed with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            
            let data: [String: Any] = ["email": email,
                                       "fullname": fullname,
                                       "username": username ]
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                print("DEBUG: Successfully updated user info in firebase")
            }
        }
    }
    
    func updateProfileImage() {
        
    }
    
    func signOut() {
        
    }
}
