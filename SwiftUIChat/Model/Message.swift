//
//  Message.swift
//  SwiftUIChat
//
//  Created by Auto on 8/1/24.
//

import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?
}
