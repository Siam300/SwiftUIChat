//
//  Constants.swift
//  SwiftUIChat
//
//  Created by Auto on 10/1/24.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")
let COLLECTION_CHANNELS = Firestore.firestore().collection("channels")


let KEY_FULLNAME = "fullname"
let KEY_USERNAME = "username"
let KEY_EMAIL = "email"
let KEY_STATUS = "status"
let KEY_PROFILE_IMAGE_URL = "profileImageUrl"
