//
//  UserCellView.swift
//  SwiftUIChat
//
//  Created by Auto on 6/1/24.
//

import SwiftUI
import Kingfisher

struct UserCellView: View {
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                //image
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                //message info
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.username)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(user.fullname)
                        .font(.system(size: 15))
                }

                Spacer()
            }
            .padding(.horizontal)
            
        }
        .padding(.top)
    }
}

//#Preview {
//    UserCellView()
//}
