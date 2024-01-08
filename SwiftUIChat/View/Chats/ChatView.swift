//
//  ChatsView.swift
//  SwiftUIChat
//
//  Created by Auto on 4/1/24.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            //messages
            ScrollView {
                VStack {
                    ForEach(viewModel.messages) { message in
                        MessageView(isFromCurrentUser: message.isFromCurrentUser, messageText: message.messageText)
                        
                    }
                }
            }
            
            //text input
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle("User Name")
        .navigationBarTitleDisplayMode(.inline)
//        .padding(.vertical)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

#Preview {
    ChatView()
}
