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

    }
    

    
    func sendMessage(_ messageText: String) {
        
    }
}
