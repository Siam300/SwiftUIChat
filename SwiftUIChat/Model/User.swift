//
//  User.swift
//  SwiftUIChat
//
//  Created by Auto on 9/1/24.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    let username: String
    var fullname: String
    let email: String
    var profileImageUrl: String
    var status: UserStatus
}

let MOCK_USER  = User(username: "test",
                      fullname: "testing",
                      email: "test@gmail.com",
                      profileImageUrl: "www.test.com",
                      status: .available)
