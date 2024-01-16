//
//  CreateChannelViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 16/1/24.
//

import UIKit

class CreateChannelViewModel: ObservableObject {
    let users: [User]
    @Published var didCreateChannel = false
    
    init(_ selectableUsers: [SelectableUser]) {
        self.users = selectableUsers.map({ $0.user })
        
        print(self.users)
    }
    
    func createChannel(name: String, image: UIImage?) {
        guard let currentUser = AuthViewModel.shared.currentUser else { return }
        guard let currentUid = currentUser.id else { return }
        
        var uids = users.compactMap({ $0.id })
        uids.append(currentUid)
        
        var data: [String: Any] = ["name": name,
                                   "uids": uids,
                                   "lastMessage": "\(currentUser.fullname) has created channel"]
        
        if let image = image {
            ImageUploader.uploadImage(image: image) { imageUrl in
                data["imageUrl"] = imageUrl
                COLLECTION_CHANNELS.document().setData(data) { _ in
                    print("DEBUG: Did upload channel with image")
                    self.didCreateChannel = true
                }
            }
        } else {
            COLLECTION_CHANNELS.document().setData(data) { _ in
                print("DEBUG: Did upload channel without image")
                self.didCreateChannel = true
            }
        }
    }
}
