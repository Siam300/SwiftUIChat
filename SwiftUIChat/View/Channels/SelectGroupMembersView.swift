//
//  CreateGroupView.swift
//  SwiftUIChat
//
//  Created by Auto on 15/1/24.
//

import SwiftUI

struct SelectGroupMembersView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //search var
                SearchBar(text: $searchText, isEditing: .constant(false))
                    .padding()
                
                //selected user
                SelectedGroupMembersView()
                
                //user list view
                ScrollView {
                    ForEach((0 ... 10), id: \.self) { _ in
                        UserCellView(user: MOCK_USER)
                    }
                }
            }
            .navigationBarItems(leading: cancelButton, trailing: nextButton)
            .navigationTitle("New Group")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var nextButton: some View {
        NavigationLink(destination: Text("Destination"), label: {
            Text("Next").bold()
        })
    }
    
    var cancelButton: some View {
        Button(action: {
            print("Dismiss view")
        }, label: {
            Text("Cancel")
        })
    }
}

#Preview {
    SelectGroupMembersView()
}
