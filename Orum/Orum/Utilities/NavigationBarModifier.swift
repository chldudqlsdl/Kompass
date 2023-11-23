//
//  NavigationBarModifier.swift
//  Orum
//
//  Created by 차차 on 11/22/23.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        let scrollEdgeAppearance = UINavigationBarAppearance()
        
        coloredAppearance.configureWithDefaultBackground()
        scrollEdgeAppearance.configureWithTransparentBackground()

        
        coloredAppearance.backgroundColor = backgroundColor
        scrollEdgeAppearance.backgroundColor = backgroundColor
        
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        scrollEdgeAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]

        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]
        scrollEdgeAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                 GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                     
                    Spacer()
                }
            }
        }
    }
}
