//
//  UserCellView.swift
//  SwiftUIChat
//
//  Created by Auto on 6/1/24.
//

import SwiftUI
import Kingfisher

struct ConversationCellView: View {
    @ObservedObject var viewModel: MessageViewModel
    
    var body: some View {
        VStack {
            HStack {
                //image
                KFImage(viewModel.chatParnerProfileImageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                //message info
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(viewModel.message.text)
                        .font(.system(size: 15))
                }
                
                Spacer()
            }
            .padding(.horizontal)
            
            Divider()
        }
        .padding(.top)
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

//#Preview {
//    ConversationCellView()
//}
