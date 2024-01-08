//
//  ChatViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 8/1/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    
    init() {
        messages = MockMessages
    }
    
    var MockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messageText: "Hello"),
            .init(isFromCurrentUser: false, messageText: "hi, whats upp"),
            .init(isFromCurrentUser: true, messageText: "good and you?"),
            .init(isFromCurrentUser: false, messageText: "im great and hows everything going?"),
            .init(isFromCurrentUser: true, messageText: "ya so far im doing great and sorry got to go now"),
            .init(isFromCurrentUser: false, messageText: "okay see you soon...")
        ]
    }
    
    func sendMessage(_ messageText: String) {
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
}
