//
//  SettingsView.swift
//  SwiftUIChat
//
//  Created by Auto on 4/1/24.
//

import SwiftUI

struct SettingsView: View {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                NavigationLink(
                    destination: EditProfileView(),
                    label: {
                        SettingsHeaderView(user: user)
                            .padding(.vertical)
                    })
                
                VStack(spacing: 1) {
                    ForEach(SettingsCellViewModel.allCases, id: \.self) { viewModel in
                        SettingsCellView(viewModel: viewModel)
                    }
                }
                
                Button(
                    action: {
                        AuthViewModel.shared.signOut()
                    }, label: {
                        Text("Log Out")
                            .foregroundColor(.red)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: UIScreen.main.bounds.width, height: 50)
                            .background(Color.white)
                    })
                
                Spacer()
            }
        }
    }
}

//#Preview {
//    SettingsView()
//}
