//
//  SelectableUserCellView.swift
//  SwiftUIChat
//
//  Created by Auto on 15/1/24.
//

import SwiftUI
import Kingfisher

struct SelectableUserCellView: View {
    let viewModel: SelectableUserCellViewModel
    
    var body: some View {
        VStack {
            HStack {
                //image
                KFImage(viewModel.profileImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                //message info
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.userName)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(viewModel.fullName)
                        .font(.system(size: 15))
                }

                Spacer()
                
                Image(systemName: viewModel.selectedImageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(viewModel.selectImageForegroundColor)
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                
            }
            .padding(.horizontal)
            
        }
        .padding(.top)
    }
}

//#Preview {
//    SelectableUserCellView(selectableUser: SelectableUser(user: MOCK_USER))
//}
