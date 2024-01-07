//
//  ChatsView.swift
//  SwiftUIChat
//
//  Created by Auto on 4/1/24.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            //messages
            ScrollView {
                VStack {
                    ForEach((0 ... 10), id: \.self) { _ in
                        MessageView(isFromCurrentUser: true)
                        MessageView(isFromCurrentUser: false)
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
        print("Send Message text: \(messageText)")
        messageText = ""
    }
}

#Preview {
    ChatView()
}
