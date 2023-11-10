//
//  VowelOnboarding.swift
//  Orum
//
//  Created by 차차 on 11/8/23.
//

import SwiftUI

struct CustomLineShapeWithAlignment: Shape {
    
    let stratPoint: Alignment
    let endPoint: Alignment
    
    init(stratPoint: Alignment, endPoint: Alignment) {
        self.stratPoint = stratPoint
        self.endPoint = endPoint
    }
    
    private func cgPointTranslator(alignment: Alignment, rect: CGRect) -> CGPoint {
        
        switch alignment {
        case .topLeading: 
            return CGPoint(x: rect.minX, y: rect.minY)
        
        case .top:
            return CGPoint(x: rect.midX, y: rect.minY)
        
        case .topTrailing:
            return CGPoint(x: rect.maxX, y: rect.minY)
            
        case .leading: 
            return CGPoint(x: rect.minX, y: rect.midY)
        
        case .center:
            return CGPoint(x: rect.midX, y: rect.midY)
        
        case .trailing:
            return CGPoint(x: rect.maxX, y: rect.midY)
            
        case .bottomLeading: 
            return CGPoint(x: rect.minX, y: rect.maxY)
        
        case .bottom:
            return CGPoint(x: rect.midX, y: rect.maxY)
        
        case .bottomTrailing:
            return CGPoint(x: rect.maxX, y: rect.maxY)
        
        default:
            return CGPoint(x: rect.minX, y: rect.minY)
        }
        
    }

    func path(in rect: CGRect) -> Path {
        
        Path { path in
            
            path.move(to: cgPointTranslator(alignment: stratPoint, rect: rect))
            path.addLine(to: cgPointTranslator(alignment: endPoint, rect: rect))
            
        }
        
    }
    
}


struct VowelOnboarding: View {
    @State private var isPressed = false
    
    var body: some View {
        ZStack {
                    
                    CustomLineShapeWithAlignment(stratPoint: .topLeading, endPoint: .bottomLeading)
                        .stroke(style: StrokeStyle(lineWidth: 1.0, dash: [5]))
                        .frame(width: 1.0)
                    
                    CustomLineShapeWithAlignment(stratPoint: .leading, endPoint: .trailing)
                        .stroke(style: StrokeStyle(lineWidth: 1.0, dash: [5]))
                        .frame(height: 1.0)
                    
                }
    }
}

#Preview {
    VowelOnboarding()
}
