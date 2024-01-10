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
                    ForEach((0 ... 10), id: \.self) { _ in
                        NavigationLink(destination: ChatView(user: MOCK_USER)) {
                            ConversationCellView()
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            
            Button(action: {
                showMessageView.toggle()
            }, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $showMessageView, content: {
                NewMessageView(showChatView: $showChatView, user: $selectedUser)
            })
        }
    }
}

#Preview {
    ConversationsView()
}
