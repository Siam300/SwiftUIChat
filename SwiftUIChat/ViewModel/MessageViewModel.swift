//
//  ConversationViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 10/1/24.
//

import Firebase

class MessageViewModel: ObservableObject {
    @Published var user: User?
    let message: Message
    
    init(_ message: Message) {
        self.message = message
        fetchUser()
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil }
        return URL(string: profileImageUrl)
    }
    
    var chatPartnerId: String {
        return message.fromId == currentUid ? message.toId : message.fromId
    }
    
    var fullname: String {
        guard let user = user else { return "" }
        return user.fullname
    }
    
    var chatParnerProfileImageUrl: URL? {
        guard let user = user else { return nil }
        return URL(string: user.profileImageUrl)
    }
    
    func fetchUser() {
        COLLECTION_USERS.document(chatPartnerId).getDocument { snapshot, _ in
            self.user = try? snapshot?.data(as: User.self)
        }
    }
}
