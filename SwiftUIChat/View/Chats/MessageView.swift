//
//  MessageView.swift
//  SwiftUIChat
//
//  Created by Auto on 7/1/24.
//

import SwiftUI

struct MessageView: View {
    var isFromCurrentUser: Bool
    
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                
                Text("Dummy Text for testing.")
                    .padding(12)
                    .background(.blue)
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                    .padding(.horizontal)
            } else {
                HStack(alignment: .bottom) {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    Text("Dummy Text for testing")
                        .padding(12)
                        .background(Color(.systemGray6))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isCurrentUser: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
                
                Spacer()
            }
        }
    }
}

#Preview {
    MessageView(isFromCurrentUser: true)
}
