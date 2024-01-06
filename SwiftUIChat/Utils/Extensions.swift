//
//  Extensions.swift
//  SwiftUIChat
//
//  Created by Auto on 6/1/24.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
