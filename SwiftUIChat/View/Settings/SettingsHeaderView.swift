//
//  SettingsHeaderView.swift
//  SwiftUIChat
//
//  Created by Auto on 5/1/24.
//

import SwiftUI
import Kingfisher

struct SettingsHeaderView: View {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                
                Text(user.status.title)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .frame(height: 80)
        .background(.white)
    }
}

//#Preview {
//    SettingsHeaderView()
//}
