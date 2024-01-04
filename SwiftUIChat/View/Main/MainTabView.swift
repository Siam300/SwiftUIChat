//
//  MainTabView.swift
//  SwiftUIChat
//
//  Created by Auto on 4/1/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                ChatsView()
                    .tabItem { Image(systemName: "bubble.left") }
                
                ChannelsView()
                    .tabItem { Image(systemName: "bubble.left.and.bubble.right") }
                
                SettingsView()
                    .tabItem { Image(systemName: "gear") }
            }
        }
    }
}

#Preview {
    MainTabView()
}
