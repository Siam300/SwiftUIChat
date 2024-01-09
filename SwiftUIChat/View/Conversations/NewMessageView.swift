//
//  NewMessageView.swift
//  SwiftUIChat
//
//  Created by Auto on 6/1/24.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode
    @State private var text = ""
    @State private var isEditing = false
    @ObservedObject var viewModel = NewMessageViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $text, isEditing: $isEditing)
                .onTapGesture { isEditing.toggle() }
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    Button(action: {
                        showChatView.toggle()
                        mode.wrappedValue.dismiss()
                    }, label: {
                        UserCellView(user: user)
                            .foregroundColor(.black)
                    })
                }
            }
        }
    }
}

#Preview {
    NewMessageView(showChatView: .constant(true))
}
