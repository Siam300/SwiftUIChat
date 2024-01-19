//
//  NewMessageViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 10/1/24.
//

import SwiftUI
import Firebase

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        Firestore.firestore().collection("users").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
                .filter({ $0.id != AuthViewModel.shared.userSession?.uid }) //filtering current user so that users cant chat themself
            
            //---------------Alternative----------------------//
            
//            documents.forEach { document in
//                guard let user = try? document.data(as: User.self) else { return }
//                self.users.append(user)
//            }
            
            //---------------Alternative Ends Here ----------------------//
            
        }
    }
    
}
