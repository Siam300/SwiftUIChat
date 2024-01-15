//
//  ChannelsView.swift
//  SwiftUIChat
//
//  Created by Auto on 4/1/24.
//

import SwiftUI

struct ChannelsView: View {
    @State private var showCreateGroupView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                VStack {
                    ForEach((0 ... 10), id: \.self) { _ in
                        ChannelCellView()
                    }
                }
            }
            
            FloatingButton(show: $showCreateGroupView)
                .sheet(isPresented: $showCreateGroupView, content: {
                    SelectGroupMembersView()
                })
        }
    }
}

#Preview {
    ChannelsView()
}

struct FloatingButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            show.toggle()
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
    }
}
