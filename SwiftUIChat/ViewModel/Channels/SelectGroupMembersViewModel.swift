//
//  SelectGroupMembersViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 16/1/24.
//

import Firebase

class SelectGroupMembersViewModel: ObservableObject {
    @Published var selectableUsers = [SelectableUser]()
    @Published var selectedUsers = [SelectableUser]()
    
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
    func selectUser(_ user: SelectableUser, isSelected: Bool) {
        guard let index = selectableUsers.firstIndex(where: { $0.id == user.id }) else { return }
        
        selectableUsers[index].isSelected = isSelected
        
        if isSelected {
            selectedUsers.append(selectableUsers[index])
        } else {
            selectedUsers.removeAll(where: { $0.id == user.id })
        }
    }
    
    //filter users for search
}
