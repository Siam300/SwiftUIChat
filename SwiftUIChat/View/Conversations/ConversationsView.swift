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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            NavigationLink(
                destination: ChatView(),
                isActive: $showChatView,
                label: { })
            
            //chats
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach((0 ... 10), id: \.self) { _ in
                        ConversationCellView()
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
                NewMessageView(showChatView: $showChatView)
            })
        }
    }
}

#Preview {
    ConversationsView()
}
