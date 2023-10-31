//
//  NavigationManager.swift
//  Orum
//
//  Created by 차차 on 10/19/23.
//

import SwiftUI

final class NavigationManager: ObservableObject {
    enum ViewCycle: String { // TODO: 교육 컨텐츠 화면에 해당하는 뷰 사이클 생성하기
        case first // 여행 일자 입력 전
        case second // 여행 일자 입력 후 && 여행 일자 이전
        case third // 여행 일자 당일 이후 && 운항 정보 입력 이전
        case fourth // 운항 정보 입력 이후
        case fifth // 한글 교육 메인 화면
    }
    
    @AppStorage("viewCycle") var viewCycle: ViewCycle = .first
//    @Published var viewCycle: ViewCycle = .first
}
