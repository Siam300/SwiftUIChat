//
//  SelectGroupMembersViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 16/1/24.
//

import Firebase

class SelectGroupMembersViewModel: ObservableObject {
    @Published var selectableUsers = [SelectableUser]()
    
    init() {
        fetchUsers()
    }
    
    //fetch users
    func fetchUsers() {
        Firestore.firestore().collection("users").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            let users = documents.compactMap({ try? $0.data(as: User.self) })
                .filter({ $0.id != AuthViewModel.shared.userSession?.uid }) //filtering current user so that users cant chat themself
            
            self.selectableUsers = users.map({ SelectableUser(user: $0) })
        }
    }
    //select or deselect users
    
    //filter users for search
}
