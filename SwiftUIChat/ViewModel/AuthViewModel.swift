//
//  AuthViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 8/1/24.
//

import Firebase
import FirebaseAuth
import UIKit

class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthinticateuser = false
    private var tempCurrentUser: FirebaseAuth.User?
    
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
            self.tempCurrentUser = user
            
            let data: [String: Any] = ["email": email,
                                       "fullname": fullname,
                                       "username": username ]
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                self.didAuthinticateuser = true
            }
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        print("DEBUG: Profile image uploaded from viewModel")
        guard let uid = tempCurrentUser?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": imageUrl]) { _ in
                print("DEBUG: Successfully updated user data")
            }
        }
    }
    
    func signOut() {
        
    }
}
