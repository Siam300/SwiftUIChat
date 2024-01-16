//
//  CreateGroupView.swift
//  SwiftUIChat
//
//  Created by Auto on 15/1/24.
//

import SwiftUI

struct SelectGroupMembersView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel = SelectGroupMembersViewModel()
    
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
                    ForEach(viewModel.selectableUsers) { selectableUser in
                        SelectableUserCellView(viewModel: SelectableUserCellViewModel(selectableUser: selectableUser))
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
