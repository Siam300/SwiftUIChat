//
//  ConversationViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 10/1/24.
//

import Firebase

struct MessageViewModel {
    let message: Message
    
    init(_ message: Message) {
        self.message = message
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        return URL(string: message.user?.profileImageUrl ?? "")
    }
    
    var fullname: String {
        return message.user?.fullname ?? ""
    }
}
