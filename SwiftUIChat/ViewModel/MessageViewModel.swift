//
//  ConversationViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 10/1/24.
//

import Firebase

struct MessageViewModel {
    let message: Message
    
    var currentUid: String { return AuthViewModel.shared.userSession?.uid ?? "" }
    
    var isFromCurrentUser: Bool { return message.fromId == currentUid }
}
