//
//  UserCellView.swift
//  SwiftUIChat
//
//  Created by Auto on 6/1/24.
//

import SwiftUI

struct UserCellView: View {
    var body: some View {
        VStack {
            HStack {
                //image
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                //message info
                VStack(alignment: .leading, spacing: 4) {
                    Text("User Name")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Full Name")
                        .font(.system(size: 15))
                }

                Spacer()
            }
            .padding(.horizontal)
            
        }
        .padding(.top)
    }
}

#Preview {
    UserCellView()
}
