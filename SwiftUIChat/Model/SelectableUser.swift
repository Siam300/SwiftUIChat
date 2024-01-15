//
//  SelectableUser.swift
//  SwiftUIChat
//
//  Created by Auto on 15/1/24.
//

import Foundation

struct SelectableUser: Identifiable {
    let user: User
    var isSelected: Bool = true
    
    var id: String {
        return user.id ?? NSUUID().uuidString
    }
}
