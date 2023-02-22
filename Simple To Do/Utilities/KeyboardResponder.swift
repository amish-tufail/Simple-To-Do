//
//  KeyboardResponder.swift
//  Simple To Do
//
//  Created by Amish Tufail on 22/02/2023.
//

import Foundation
import SwiftUI
import ObjectiveC

class KeyboardResponder: ObservableObject {
    private var notificationCenter: NotificationCenter
    
    @Published var currentHeight: CGFloat = 0
    
    init(center: NotificationCenter = .default) {
        notificationCenter = center
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        currentHeight = 0
    }
}
