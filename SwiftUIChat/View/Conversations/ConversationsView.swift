//
//  ConversationsView.swift
//  SwiftUIChat
//
//  Created by Auto on 4/1/24.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showMessageView = false
    @State private var showChatView = false
    @State var selectedUser: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = selectedUser {
                NavigationLink(
                    destination: ChatView(user: user),
                    isActive: $showChatView,
                    label: { })
            }

            //chats
            ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack { Spacer() }
                    
                    ForEach(viewModel.recentMessages) { message in
                        ConversationCellView(viewModel: ConversationCellViewModel(message))
                    }
                }
            }
            
            FloatingButton(show: $showMessageView)
            .sheet(isPresented: $showMessageView, content: {
                NewMessageView(showChatView: $showChatView, user: $selectedUser)
            })
            
        }
    }
}

#Preview {
    ConversationsView()
}
