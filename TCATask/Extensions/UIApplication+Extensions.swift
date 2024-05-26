//
//  UIApplication+Extensions.swift
//  TCATask
//
//  Created by Ayman Atallah on 26/05/2024.
//

import UIKit

extension UIApplication {
    static func safeArea() -> UIEdgeInsets {
        if
            let windowScene = UIApplication.shared.connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
            let window = windowScene.windows.first {
            return window.safeAreaInsets
        }
        return UIEdgeInsets()
    }
}
