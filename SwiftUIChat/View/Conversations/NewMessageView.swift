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
    
    var body: some View {
        ScrollView {
            SearchBar(text: $text, isEditing: $isEditing)
                .onTapGesture { isEditing.toggle() }
                .padding()
            
            VStack(alignment: .leading) {
                ForEach((0 ... 10), id: \.self) { _ in
                    Button(action: {
                        showChatView.toggle()
                        mode.wrappedValue.dismiss()
                    }, label: {
                        UserCellView()
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
