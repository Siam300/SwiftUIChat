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
                    
                    StatusCell(viewModel: StatusViewModel(rawValue: 0)!)
                        .background(.white)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundStyle(.gray)
                        .padding()
                    
                    
                    // for loop for status
                    VStack {
                        ForEach((StatusViewModel.allCases.filter({ $0 != .notConfigured }))
                                , id: \.self) { viewModel in
                            Button(action: {
                                
                            }, label: {
                                StatusCell(viewModel: viewModel)
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
    let viewModel: StatusViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.title)
                .foregroundStyle(.black)
            Spacer()
        }
        .padding(.horizontal)
        .frame(height: 50)
    }
}
