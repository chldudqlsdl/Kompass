//
//  LearningView+ThumbnailView.swift
//  Orum
//
//  Created by 차차 on 11/21/23.
//

import SwiftUI

extension LearningView {
    @ViewBuilder
    func ThumbnailView(lesson: Lesson) -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            Image("Thumbnail_" + lesson.lessonName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .overlay {
                    if educationManager.lessonState[lesson.lessonName] == "locked" {
                        Rectangle()
                            .foregroundStyle(.ultraThinMaterial.opacity(0.95))
                    }
                }
                .clipShape(animateView ? RoundedRectangle(cornerRadius: 0) : RoundedRectangle(cornerRadius: 4))
        }
        .matchedGeometryEffect(id: lesson.id, in: animation)
    }
}
