//
//  StatusSelectorView.swift
//  SwiftUIChat
//
//  Created by Auto on 5/1/24.
//

import SwiftUI

struct StatusSelectorView: View {
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("CURRENTLY SET TO")
                        .foregroundStyle(.gray)
                        .padding()
                    
                    HStack {
                        Text("Available")
                        Spacer()
                    }
                    .padding()
                    .background(.white)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundStyle(.gray)
                        .padding()
                        
                    
                    // for loop for status
                    VStack {
                        ForEach((0 ... 10), id: \.self) { _ in
                            HStack {
                                Text("Available")
                                Spacer()
                            }
                            .padding()
                        }
                    }
                    .background(.white)
                }
            }
        }
    }
}

#Preview {
    StatusSelectorView()
}
