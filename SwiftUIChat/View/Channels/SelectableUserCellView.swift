//
//  SelectableUserCellView.swift
//  SwiftUIChat
//
//  Created by Auto on 15/1/24.
//

import SwiftUI

struct SelectableUserCellView: View {
    let selectableUser: SelectableUser
    
    var body: some View {
        VStack {
            HStack {
                //image
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                //message info
                VStack(alignment: .leading, spacing: 4) {
                    Text(selectableUser.user.username)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(selectableUser.user.fullname)
                        .font(.system(size: 15))
                }

                Spacer()
                
                Image(systemName: selectableUser.isSelected ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(selectableUser.isSelected ? .blue : .gray)
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                
            }
            .padding(.horizontal)
            
        }
        .padding(.top)
    }
}

#Preview {
    SelectableUserCellView(selectableUser: SelectableUser(user: MOCK_USER))
}
