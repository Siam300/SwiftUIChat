//
//  Message.swift
//  SwiftUIChat
//
//  Created by Auto on 8/1/24.
//

import Foundation

struct Message: Identifiable {
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
}
