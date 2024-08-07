
# Kompass<img src="https://github.com/chldudqlsdl/Kompass/assets/83645833/867f42d6-0f45-4ad6-a58d-ac3063953771" align=left width=150>

> 外国人のために、ハングルを最も正しく・楽しく学べる方法  🇰🇷  
> 2人開発 (+ 2人デザイン) (23.09.04 ~ 23.11.24)  
> [📺 アプリ紹介動画のリンク(YouTube)](https://www.youtube.com/watch?v=H8hxAiN7f84&t=46s)

<br />

## 💭 紹介

> 最近、韓国や韓国語を愛する外国人が本当に多くなっていて、それに伴い**ハングルの人気も高まっています。**
> **何でも最初に学ぶときは、正しく学ぶことが一番大切だと思います。**
> 
>Kompassは**ハングルをハングルらしく**教える方法を絶えず模索してきました。   
> **ハングルをアルファベットに変換して教えるのではなく**、直接韓国人の発音を聞きながら学びます。  
> 子音は**連想記憶法**で一生忘れないようにし、形が似ている母音は**直接書きながら**学ぶようにしました。  
> ハングルをすべて学んだら、韓国料理や名所を読みながら復習もでき、よく間違える子音と母音は一箇所にまとめて確認することができます
> 
> **ハングル（Korean）学習の最強のコンパス、Kompassと一緒にハングルマスターしよう〜！**



<br />

## ✨ 機能と実装事項
<img src="https://github.com/chldudqlsdl/Kompass/assets/83645833/350ca266-0cc5-4ca2-af13-24a5883b36b4" >

**0. 技術概要**
  - **SwiftUIベースでの開発**

**1. オンボーディング・プロローグビュー**
  - **教育アプリなので、学習前に学習システムを十分に理解できるようにする**
  - AppStorageを活用して、初めてのユーザーにのみオンボーディングビューを表示

**2. 教育タブ（メインタブ）**
  - **子音・母音・パッチムごとに異なる方式で、最も効率的にハングルを学べるカリキュラムを構成**
  - **アプリ全体の状態管理を効果的に処理するために、`@EnvironmentObject`を使用して`EducationManager`を注入し、ユーザー体験を一貫して維持**
  - 子音教育：LottieAnimationを用いた連想記憶法の活用（例：ㄱ - 🔫）
  - 母音教育：直接書きながら学べるように`UIViewRepresentable`を使って`pencilKit`とSwiftUIを接続  
  - 共通：子音・母音の学習時に必ず該当する音を聞かせ、クイズを解いてから章を終了できるように設定
  - UI：`matchedGeometryEffect`と`@Namespace`を活用し、App Storeに似た滑らかなUIを実装

**3. 練習タブ**
  - **子音・母音学習後に実際の韓国語単語を通じてハングルを深く学べるようにする**
  - 韓国の名所・料理・よく使う表現など、外国人が興味を持ちやすい単語で学習

**4. コレクションタブ**
  - **カリキュラムのすべての子音・母音をカード形式で一か所に集め、復習できるようにする**
  - 教育タブでクイズを解くときに間違えたハングルはAppStorageに保存し、それを集めて表示することで、弱点を補強できるようにする


<br />


## 🤔 開発過程での悩みと学んだ点 (ぜひお読みください🙏)

<details>
<summary><strong style="font-size: 1.2em;">@EnvironmentObject を活用した状態管理</strong></summary>

### EducationManager と @EnvironmentObject

Kompassアプリで教育に関連するすべての属性とメソッドを管理する`EducationManager`を宣言。`@StateObject`でインスタンスを宣言して管理し、各タブにこれを`@EnvironmentObject`として注入。LearnTabのすべてのサブビューは`educationManager`にアクセスして変更を通知できる。

シングルトンパターンの利点を持ちながら、SwiftUIの宣言的プログラミングスタイルを効果的に維持することができる。

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
<summary><strong style="font-size: 1.2em;">学習コンテンツにおける画面遷移</strong></summary>

### 学習コンテンツの斬新な画面遷移方式

<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/b620a23d-ec04-4e09-9dc1-3289c3178563">

通常の教育コンテンツでは、上の図のように現在のビューが左に消え、右から新しいビューが現れる形式で画面遷移が行われます。しかし、一般的に使用されるほとんどのアプリでは、以下のような方法で画面遷移が行われます。

`NavigationView`と`NavigationLink`（`UINavigationController`）を使用する方法では、アニメーションは似ていますが、ビューがスタックに積み重なるため、ビュー間に階層が生じます。また、階層が深くなるほどメモリ使用量も増加する可能性があります。

` .sheet`や`.fullScreenCover`を使用すると、モーダル形式でビューが表示されたり、下から上に上がるアニメーションで実装されるため、ユーザーが違和感を感じることがあります。

### transitionを通じて実装

`educationManager`の属性に応じてビューを切り替える際、SwiftUIの`transition`メソッドで`asymmetric`を使用しました。`asymmetric`メソッドは、ビューのトランジション時に、挿入と消去の際のアニメーションを指定できるため、左に消えて右から現れるビューの切り替えを簡単に実装できました。

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
<summary><strong style="font-size: 1.2em;">PencilKitの使用のためにUIKitとSwiftUIを接続</strong></summary>

### PKCanvasView

母音は形が似ているため、早く慣れるためには実際に書いてみる方法が最も効果的だと判断し、それを実現するためにPencilKitを使用してペンで書く機能を実装しようとしました。ペンを使うビューとして`PKCanvasView`を使用しますが、これは`UIScrollView`を継承しています。そのため、SwiftUIベースのUIを使用しているKompassでは、UIKitのビューを使用する必要がありました。

### UIViewControllerRepresentable

<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/9f714f6b-1eeb-419d-ae46-b8131599a63a">

プロトコル`UIViewControllerRepresentable`を使用すれば、`UIViewController`をSwiftUIで利用でき、データのやり取りもスムーズに行うことができます。

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


## 📺 アプリの起動画面
|オンボーディングビュー|教育タブ（メインタブ）|子音学習ビュー| 復習ビュー（リキャップビュー）|
|:-:|:-:|:-:|:-:|
|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/e6b28af2-65f7-49fe-a9ad-1a0ae6aed822">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/c654d97c-e4c3-41ad-954c-fbe2f39e73b5">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/082a68c8-d48d-4ac4-a693-1f2f91d5e030">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/1035e122-ed9a-4786-b3b5-2e5113c4263b">|
|**クイズビュー**|**母音学習ビュー（PencilKit）**|**練習タブ**|**コレクションタブ**|
|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/1ce1d77b-a4c4-4188-9d19-b75bf7e9130e">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/33dbc17c-edff-4aee-9143-16ceacc76f96">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/3c5b5838-211c-4154-bad3-01a3a836ada3">|<img width="200" src="https://github.com/chldudqlsdl/Kompass/assets/83645833/19190ae6-27d6-4ae8-b42d-e1c1f50e480b">|




