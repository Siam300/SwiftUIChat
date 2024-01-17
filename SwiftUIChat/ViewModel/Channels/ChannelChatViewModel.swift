//
//  ChannelChatViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 17/1/24.
//

import Firebase

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
    func sendChannelMessage(messageText: String) {
        guard let currentUser = AuthViewModel.shared.currentUser else { return }
        guard let currentUid = currentUser.id else { return }
        guard let channelId = channel.id else { return }

        let data: [String: Any] = ["text": messageText,
                                   "fromId": currentUid,
                                   "toId": channelId,
                                   "read": false,
                                   "timestamp": Timestamp(date: Date())]
        
        COLLECTION_CHANNELS.document(channelId)
            .collection("messages").document().setData(data)
        
        let lastMessage = "\(currentUser.fullname): \(messageText)"
        COLLECTION_CHANNELS.document(channelId).updateData(["lastMessage": lastMessage])
    }
}
