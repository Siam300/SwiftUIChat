//
//  User.swift
//  SwiftUIChat
//
//  Created by Auto on 9/1/24.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}

let MOCK_USER  = User(username: "test", fullname: "testing", email: "test@gmail.com", profileImageUrl: "www.test.com")
