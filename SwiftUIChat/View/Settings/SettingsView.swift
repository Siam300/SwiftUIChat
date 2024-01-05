//
//  SettingsView.swift
//  SwiftUIChat
//
//  Created by Auto on 4/1/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("")
                    .frame(height: 0)
                VStack(spacing: 32) {
                    NavigationLink(destination: EditProfileView()) {
                        SettingsHeaderView()
                    }
                    
                    VStack(spacing: 1) {
                        ForEach((SettingsCellViewModel.allCases), id: \.self) { viewModel in
                            SettingsCellView(viewModel: viewModel)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Log Out")
                            .foregroundColor(.red)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: UIScreen.main.bounds.width, height: 50)
                            .background(Color.white)
                    }

                    Spacer()
                }                
            }
        }
    }
}

#Preview {
    SettingsView()
}
