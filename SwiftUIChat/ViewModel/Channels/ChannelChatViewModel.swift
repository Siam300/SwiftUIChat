//
//  ChannelChatViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 17/1/24.
//

import Foundation

class ChannelChatViewModel: ObservableObject {
    let channel: Channel
    @Published var messages = [Message]()
    
    init(_ channel: Channel) {
        self.channel = channel
        fetchChannelMessages()
    }
    
    //fetch channel messages
    func fetchChannelMessages() {
        
    }
    
    //send channel messages
    func sendChannelMessage() {
        
    }
}
