//
//  View+SafeArea.swift
//  Orum
//
//  Created by 차차 on 11/21/23.
//

import SwiftUI

extension View {
    func safeArea() -> UIEdgeInsets {
        guard
            let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let safeArea = screen.windows.first?.safeAreaInsets else { return .zero }
        return safeArea
    }
}
