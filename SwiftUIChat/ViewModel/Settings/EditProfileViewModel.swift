//
//  EditProfileViewModel.swift
//  SwiftUIChat
//
//  Created by Auto on 19/1/24.
//

import UIKit

class EditProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(_ user: User) {
        self.user = user
    }
    
    func updateProfileImage(_ image: UIImage) {
        
    }
    
    func updateName(_ name: String) {
        
    }
    
    func updateStatus(_ status: UserStatus) {
        
    }
}
