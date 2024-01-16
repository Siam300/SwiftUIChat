//
//  SelectableUserCellViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 16/1/24.
//

import SwiftUI

struct SelectableUserCellViewModel {
    let selectableUser: SelectableUser
    
    var profileImageUrl: URL? {
        return URL(string: selectableUser.user.profileImageUrl)
    }
    
    var userName: String {
        return selectableUser.user.username
    }
    
    var fullName: String {
        return selectableUser.user.fullname
    }
    
    var selectedImageName: String {
        return selectableUser.isSelected ? "checkmark.circle.fill" : "circle"
    }
    
    var selectImageForegroundColor: Color {
        return selectableUser.isSelected ? .blue : .gray
    }
}
