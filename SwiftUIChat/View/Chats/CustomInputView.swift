//
//  CustomInputView.swift
//  SwiftUIChat
//
//  Created by Auto on 7/1/24.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var text: String
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
            HStack {
                TextField("Message", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.body)
                    .frame(minHeight: 30)
                
                Button(action: action, label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                })
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
        }
    }
}

//#Preview {
//    CustomInputView()
//}
