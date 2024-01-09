//
//  User.swift
//  SwiftUIChat
//
//  Created by Auto on 9/1/24.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}
