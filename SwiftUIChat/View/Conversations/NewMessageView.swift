//
//  NewMessageView.swift
//  SwiftUIChat
//
//  Created by Auto on 6/1/24.
//

import SwiftUI

struct NewMessageView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach((0 ... 10), id: \.self) { _ in
                    UserCellView()
                }
            }
        }
    }
}

#Preview {
    NewMessageView()
}
