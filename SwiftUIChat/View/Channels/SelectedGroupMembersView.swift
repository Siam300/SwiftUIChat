//
//  SelectedGroupMembersView.swift
//  SwiftUIChat
//
//  Created by Auto on 15/1/24.
//

import SwiftUI

struct SelectedGroupMembersView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach((0 ... 5), id: \.self) { _ in
                    ZStack(alignment: .topTrailing) {
                        VStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                            
                            Text("Dummy person")
                                .font(.system(size: 11, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 64)
                        
                        Button(action: {
                            print("Deselct user")
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                                .padding(4)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        })
                        
                    }
                }
            }
        }
        .animation(.spring())
        .padding()
    }
}

#Preview {
    SelectedGroupMembersView()
}
