//
//  SettingsHeaderView.swift
//  SwiftUIChat
//
//  Created by Auto on 5/1/24.
//

import SwiftUI

struct SettingsHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Bruce Wayne")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                
                Text("Available")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .frame(height: 80)
        .background(.white)
    }
}

#Preview {
    SettingsHeaderView()
}