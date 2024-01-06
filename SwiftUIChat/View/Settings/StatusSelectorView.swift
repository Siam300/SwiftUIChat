//
//  StatusSelectorView.swift
//  SwiftUIChat
//
//  Created by Auto on 5/1/24.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("CURRENTLY SET TO")
                        .foregroundStyle(.gray)
                        .padding()
                    
                    StatusCell(status: viewModel.status)
                        .background(.white)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundStyle(.gray)
                        .padding()
                    
                    
                    // for loop for status
                    VStack {
                        ForEach((UserStatus.allCases.filter({ $0 != .notConfigured }))
                                , id: \.self) { status in
                            Button(action: {
                                viewModel.updateStauts(status)
                            }, label: {
                                StatusCell(status: status)
                            })
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

struct StatusCell: View {
    let status: UserStatus
    
    var body: some View {
        HStack {
            Text(status.title)
                .foregroundStyle(.black)
            Spacer()
        }
        .padding(.horizontal)
        .frame(height: 50)
    }
}
