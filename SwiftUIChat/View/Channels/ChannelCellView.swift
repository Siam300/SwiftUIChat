//
//  ChannelCellView.swift
//  SwiftUIChat
//
//  Created by Auto on 15/1/24.
//

import SwiftUI

struct ChannelCellView: View {
    var body: some View {
        NavigationLink(destination: Text("Channel chat view")) {
            VStack {
                HStack {
                    //image
                    Image(systemName: "person.2.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                    
                    //message info
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Group chat")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("Dummy User: Test group message")
                            .font(.system(size: 15))
                    }
                    .foregroundColor(Color.black)
                    Spacer()
                }
                .padding(.horizontal)
                
                Divider()
            }
            .padding(.top)
        }
    }
}

#Preview {
    ChannelCellView()
}
