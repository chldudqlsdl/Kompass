
# Kompass<img src="https://github.com/chldudqlsdl/Kompass/assets/83645833/867f42d6-0f45-4ad6-a58d-ac3063953771" align=left width=120>

> 외국인을 위한, 한글을 가장 제대로 ∙ 재미있게 배울 수 있는 방법  🇰🇷  
> 2인 개발 (+ 2인 디자인) (23.09.04 ~ 23.11.24)

<br />

## 💭 소개

> 한국과 한국어를 사랑하는 외국인이 정말 많은 요즘, 더불어 **한글의 인기도 높아지고 있어요**  
> **무엇이든 처음 배울 때, 제대로 배우는게 가장 중요하다고 생각해요**
> 
> Kompass 는 **한글을 한글답게** 가르치기 위한 방법을 끊임없이 고민했어요  
> **한글을 알파벳으로 바꾸어 가르치지 않고**, 직접 한국인의 소리를 들으면서 배워요   
> 자음은 **연상기억법**으로 평생 까먹지 않게, 모양이 서로 비슷한 모음은 **직접 쓰면서** 배우도록 했어요  
> 한글을 다 배우면 한국 음식 ∙ 명소 읽으며 복습도 해보고, 자주 틀린 자모음은 한 곳에서 모아볼 수 있어요
> 
> **한글(Korean)공부의 가장 든든한 나침반(Compass), Kompass 와 함께 한글 떼기 가보자고~**



<br />

## ✨ 기능 및 구현사항
<img src="https://github.com/chldudqlsdl/Kompass/assets/83645833/350ca266-0cc5-4ca2-af13-24a5883b36b4" >

**0. 기술 개요** 
  - **SwiftUI 기반 개발**

**1. 온보딩 ∙ 프롤로그 뷰** 
  - **교육앱이므로, 학습 이전에 학습 시스템에 대한 충분한 숙지가 이루어지도록 함**
  - AppStorage 를 활용해 첫 사용자에게만 온보딩뷰를 노출

**2. 교육탭(메인탭)**
  - **자모음 ∙ 받침 별로 각각 다른 방식으로 가장 효율적으로 한글을 배울 수 있도록 커리큘럼을 구성**
  - **앱 전반의 상태 관리를 효과적으로 처리하기 위해 `@EnvironmentObject`를 활용하여   `EducationManager`를 주입함으로써, 사용자 경험을 일관되게 유지**
  - 자음교육 : LottieAnimation 을 통한 연상기억법 활용(ㄱ - 🔫)  
  - 모음교육 : 직접 쓰면서 배우게 하기 위해 `UIViewRepresentable` 을 통한 `pencilKit` 과 SwiftUI 를 연결  
- 공통 : 자모음 학습시 반드시 해당 소리를 듣게 하고, 퀴즈를 풀어야 챕터를 마칠 수 있도록 설정
- UI : `matchedGeometryEffect` 와 `@Namespace` 을 활용한 앱스토어와 유사한 매끄러운 UI 구현

**3. 연습탭**
 - **자모음 학습 후 실제 한국어 단어를 통해 한글을 심화 학습할 수 있도록 함**
- 한국 명소 ∙ 음식 ∙ 자주쓰는 표현과 같은 외국인이 흥미를 가질 만 한 단어로 학습

**4. 컬렉션탭**
 - **커리큘럼의 모든 자모음을 카드 형태로 한 공간에서 복습할 수 있도록 함**
- 교육탭에서 퀴즈를 풀 때 틀린 한글은 AppStorage 에 저장하는데, 이를 모아서 보여주어 취약한 영역을 보충할 수 있도록 함


<br />


## 🤔 개발과정의 고민

<details>
<summary><strong style="font-size: 1.2em;">@EnvironmentObject 를 활용한 상태관리</strong></summary>

### EducationManager 와 @EnvironmentObject

Kompass 앱에서 교육과 관련된 모든 속성과 메서드를 관리하는 EducationManager 를 선언. `@StateObject` 로 인스턴스를 선언하여 관리하고, 이를 각 탭에 `@EnvironmentObject` 로 주입. LearnTab 의 모든 하위뷰들은 `educationManager` 에 접근하여 변경사항을 알릴 수 있다. 

싱글톤패턴의 장점을 가지면서도 SwiftUI의 선언적 프로그래밍 스타일을 효과적으로 유지할 수 있다.

```swift
struct ContentView: View {
    @StateObject var educationManager: EducationManager = EducationManager()
    @StateObject var practiceManager: PracticeManager = PracticeManager()
    
    var body: some View {
            TabView {
                LearningView()
                    .environmentObject(educationManager)
                    .tabItem {
                        Label("Learn", systemImage: "book")
                    }
                
                PracticeView()
                    .environmentObject(practiceManager)
                    .tabItem {
                        Label("Practice", systemImage: "message.and.waveform.fill")
                    }
                
                CollectionView()
                    .environmentObject(educationManager)
                    .tabItem {
                        Label("Collection", systemImage: "rectangle.stack.fill")
                    }
            }
    }
}
```


</details>

<details>
<summary><strong style="font-size: 1.2em;">학습 콘텐츠에서의 화면전환</strong></summary>

### 학습 콘텐츠의 생소한 화면 전환 방식

<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/b620a23d-ec04-4e09-9dc1-3289c3178563">

보통의 교육 콘텐츠에서는 위 그림 처럼 현재 뷰가 왼쪽으로 사라지면서 오른쪽에서 새로운 뷰가 나타나는 방식으로 화면 전환을 한다. 하지만 일반적으로 사용하는 대부분의 앱에서는 아래와 같은 방식으로 화면 전환을 한다. 

NavigationView 와 NavigationLink (UINavigationController) 을 사용한 방법은 애니메이션은 비슷하지만, 뷰가 스택에 쌓이면서 뷰 간에 계층이 생긴다. 또한 계층이 깊어질 수록 메모리 사용량도 증가할 수 있다.
.sheet ∙ .fullScreenCover 를 사용하면 모달 형태로 뷰가 생기거나, 아래에서 위로 올라오는 애니메이션으로 구현되어 있기에 사용자 입장에서 어색함을 느낄 수 있다. 

### transition 을 통해 구현

educationManager 의 속성에 따라 뷰를 바꿔주는데 이 상황에서 SwiftUI 의 trasition 메서드에 asymmetric 를 사용해주었다. asymmetric 메서드는 뷰 트랜지션시 삽입과 사라짐 시의 애니메이션을 지정해줄 수 있어서 왼쪽으로 사라지고 오른쪽에서 나타나는 뷰 전환을 쉽게 구현해줄 수 있었다. 

```swift
struct LearningLessonView: View {

    @EnvironmentObject var educationManager: EducationManager
    
    var body: some View {
        switch educationManager.currentEducation {

        case .learning:
            HangulEducationLearningView(progressValue: $progressValue)
                .environmentObject(educationManager)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        case .recap:
            HangulEducationRecapView(progressValue: $progressValue)
                .environmentObject(educationManager)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
    }
}
```


</details>
  
<details>
<summary><strong style="font-size: 1.2em;">PencilKit 사용을 위한 UIKit 과 SwiftUI 의 연결</strong></summary>

### PKCanvasView

모음은 서로 모양이 비슷해서 쉽게 익숙해지기 위해서는 직접 써보는 방법이 가장 효율적이라고 판단했고, 이를 위해 PencilKit 을 사용하여 펜을 통한 쓰기를 구현하고자 하였다. 펜을 쓰게 될 뷰로 `PKCanvasView` 를 사용하는데, 이는 `UIScrollView` 를 상속하고 있다. 이 때문에 SwiftUI 기반 UI를 사용하고 있는 Kompass 에서 UIKit 뷰를 사용해야만 하였다. 

### UIViewControllerRepresentable

<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/9f714f6b-1eeb-419d-ae46-b8131599a63a">

프로토콜 `UIViewControllerRepresentable` 을 사용하면 UIViewController 를 SwiftUI 에서 사용할 수 있으며, 데이터도 잘 주고 받을 수 있다.

```swift
struct Canvas: UIViewControllerRepresentable {
    
    @Binding var writingCount : Int
    @EnvironmentObject var educationManager: EducationManager
        
    func makeUIViewController(context: Context) -> UIViewController {
        let fallingViewController = FallingViewController(writingCount: $writingCount, educationManager: educationManager)
        return fallingViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

class FallingViewController : UIViewController, UITextFieldDelegate, PKCanvasViewDelegate, UICollisionBehaviorDelegate {
        
        @Binding var writingCount: Int
    var educationManager: EducationManager
        // ... [후략] ...
}
```

</details>

<br />

## 📚 Framework ∙ Library

| Category| Name | Tag |
| ---| --- | --- |
| Framework| SwiftUI | UI |
| | PencilKit | Drawing    |
| | CoreMotion | Motion |
| | AvKit | Sound |
|Library | Lottie |LottieAnimation  |

<br />


## 📺 앱 구동 화면 
|온보딩 뷰|교육탭(메인탭)|자음학습뷰| 복습뷰(리캡뷰)|
|:-:|:-:|:-:|:-:|
|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/e6b28af2-65f7-49fe-a9ad-1a0ae6aed822">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/c654d97c-e4c3-41ad-954c-fbe2f39e73b5">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/082a68c8-d48d-4ac4-a693-1f2f91d5e030">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/1035e122-ed9a-4786-b3b5-2e5113c4263b">|
|**퀴즈뷰**|**모음학습뷰(PencilKit)**|**연습탭**|**컬렉션탭**|
|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/1ce1d77b-a4c4-4188-9d19-b75bf7e9130e">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/33dbc17c-edff-4aee-9143-16ceacc76f96">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/3c5b5838-211c-4154-bad3-01a3a836ada3">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/19190ae6-27d6-4ae8-b42d-e1c1f50e480b">|




