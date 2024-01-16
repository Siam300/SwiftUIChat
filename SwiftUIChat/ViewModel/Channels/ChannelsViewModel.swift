//
//  ChannelsViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 16/1/24.
//

import Foundation

class ChannelsViewModel: ObservableObject {
    @Published var channels = [Channel]()
    
    init() {
        fetchChannels()
    }
    
    func fetchChannels() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_CHANNELS.whereField("uids", arrayContains: uid).getDocuments { snapshot, _ in //this will filter where user is in channels
            guard let documents = snapshot?.documents else { return }
            self.channels = documents.compactMap({ try? $0.data(as: Channel.self) })
        }
    }
}
