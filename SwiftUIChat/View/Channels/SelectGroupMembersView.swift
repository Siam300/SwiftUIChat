//
//  CreateGroupView.swift
//  SwiftUIChat
//
//  Created by Auto on 15/1/24.
//

import SwiftUI

struct SelectGroupMembersView: View {
    @State private var searchText = ""
    @State private var isEditing = false
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel = SelectGroupMembersViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //search var
                SearchBar(text: $searchText, isEditing: $isEditing)
                    .onTapGesture {
                        isEditing.toggle()
                    }
                    .padding()
                
                //selected user
                if !viewModel.selectedUsers.isEmpty {
                    SelectedGroupMembersView(viewModel: viewModel)
                }
                
                //user list view
                ScrollView {
                    ForEach(
                        searchText.isEmpty ? viewModel.selectableUsers :
                        viewModel.filteredUsers(searchText)
                    ) { selectableUser in
                        Button(action: {
                            viewModel.selectUser(selectableUser, isSelected: !selectableUser.isSelected)
                        }, label: {
                            SelectableUserCellView(viewModel: SelectableUserCellViewModel(selectableUser: selectableUser))
                        })
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
            mode.wrappedValue.dismiss()
        }, label: {
            Text("Cancel")
        })
    }
}

#Preview {
    SelectGroupMembersView()
}
