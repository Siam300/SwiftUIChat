//
//  ChatBubbleView.swift
//  SwiftUIChat
//
//  Created by Auto on 7/1/24.
//

import SwiftUI

struct ChatBubble: Shape {
    var isCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight ,isCurrentUser ? .bottomLeft : .bottomRight ], cornerRadii: CGSizeMake(16, 16))
        
        return Path(path.cgPath)
    }
}

#Preview {
    ChatBubble(isCurrentUser: false)
}
