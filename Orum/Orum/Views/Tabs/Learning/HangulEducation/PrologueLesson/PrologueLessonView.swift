//
//  PrologueLessonView.swift
//  Orum
//
//  Created by 차차 on 11/14/23.
//

import SwiftUI

struct PrologueLessonView: View {
    
    @Binding var isPresented: Bool
    
    @EnvironmentObject var educationManager: EducationManager
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize : DynamicTypeSize
    
    @State private var index = 0
    
    var prologuePage : HangulPrologue {
        educationManager.prologue[index]
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                    VStack(spacing: 0) {
                        VStack(spacing: 16) {
                            Text(prologuePage.title)
                                .bold()
                                .font(.title)
                                .foregroundStyle(Color(uiColor: prologuePage.color[0]))
                                .multilineTextAlignment(.center)
                                .padding(.top, 10)

                            Text(.init(prologuePage.text))
                                .font(.body)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                        }
                        .frame(height : dynamicTypeSize.prologueTextHeight)
                        
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 358)
                            .foregroundColor(Color(uiColor: UIColor(hex: "F8F8F8")))
                            .overlay {
                                if prologuePage.image.count == 1 {
                                    Image(prologuePage.image[0])
                                        .resizable()
                                        .scaledToFit()
                                } else {
                                    LazyHStack{
                                        PageView(images: prologuePage.image)
                                    }
                                }
                            }
                            .padding(.bottom, 100)
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.ultraThinMaterial)
                            .frame(height: UIScreen.main.bounds.height * 0.15)
                        
                        VStack(spacing: 0){
                            
                            Button(action: {
                                if index < educationManager.prologue.count - 1 {
                                    index += 1
                                } else {
                                    withAnimation {
                                        isPresented.toggle()
                                    }
                                }
                            },label: {
                                Text("Continue")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .bold()
                            })
                            .buttonStyle(.borderedProminent)
                            .padding(.horizontal, 24)
                            .padding(.top, 24)
                            .padding(.bottom, 48)
                        }
                        .tint(Color(uiColor: prologuePage.color[1]))
                    }
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .navigationBarItems(leading: Button(action: {
                index -= 1
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .foregroundStyle(index == 0 ? .clear : Color(uiColor: .systemGray3))

            })
                .disabled(index == 0 ? true : false)
            )
            .buttonStyle(.plain)

            
        }
    }
}

struct PageView : View {
    
    var images: [String]
    
    var body: some View {
        TabView {
            ForEach(0 ..< images.count){ index in
                Image(images[index])
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: 358, height: 358)
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

extension DynamicTypeSize {
    var prologueTextHeight : CGFloat {
        switch self {
            
        case .xSmall:
            200
        case .small:
            200
        case .medium:
            200
        case .large:
            200
        case .xLarge:
            200
        case .xxLarge:
            220
        case .xxxLarge:
            250
        case .accessibility1:
            300
        case .accessibility2:
            300
        case .accessibility3:
            300
        case .accessibility4:
            300
        case .accessibility5:
            300
        @unknown default:
            300
        }
    }
}

#Preview {
    PrologueLessonView(isPresented: .constant(true))
        .environmentObject(EducationManager())
}
