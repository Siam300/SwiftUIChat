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
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    override init() {
        super .init()
        userSession = Auth.auth().currentUser
        
        fetchUser()
    }
    
    func logIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
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
        guard let uid = tempCurrentUser?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": imageUrl]) { _ in
                self.userSession = self.tempCurrentUser
//                self.fetchUser()
            }
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
}
