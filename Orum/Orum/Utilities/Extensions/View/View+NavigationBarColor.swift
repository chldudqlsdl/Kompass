//
//  View+NavigationBarColor.swift
//  Orum
//
//  Created by 차차 on 11/22/23.
//

import SwiftUI

extension View {
    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }

}
