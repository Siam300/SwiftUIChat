//
//  ChannelCellView.swift
//  SwiftUIChat
//
//  Created by Auto on 15/1/24.
//

import SwiftUI
import Kingfisher

struct ChannelCellView: View {
    let channel: Channel
    
    var body: some View {
        NavigationLink(destination: Text("Channel chat view")) {
            VStack {
                HStack {
                    //image
                    if let imageUrl = channel.imageUrl {
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.2.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                    }
                    
                    //message info
                    VStack(alignment: .leading, spacing: 4) {
                        Text(channel.name)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text(channel.lastMessage)
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

//#Preview {
//    ChannelCellView()
//}
