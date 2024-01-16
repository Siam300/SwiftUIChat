//
//  Channel.swift
//  SwiftUIChat
//
//  Created by Auto on 16/1/24.
//

import FirebaseFirestoreSwift

struct Channel: Identifiable, Decodable {
    @DocumentID var id: String?
    let name: String
    let imageUrl: String?
    let uids: [String]
    var lastMessage: String
}
