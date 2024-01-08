//
//  SwiftUIChatApp.swift
//  SwiftUIChat
//
//  Created by Auto on 4/1/24.
//

import SwiftUI
import Firebase

@main
struct SwiftUIChatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
