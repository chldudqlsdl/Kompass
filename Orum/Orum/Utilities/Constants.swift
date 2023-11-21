//
//  Constants.swift
//  Orum
//
//  Created by 차차 on 11/5/23.
//

import Foundation

struct Constants {
    struct Lesson {
        static let system: String = "System of Hangul"
        
        static let consonant0: String = "Consonant 0" // Consonant Prologue
        static let consonant1: String = "Consonant 1" // ㄱ,ㄴ,ㄷ,ㄹ
        static let consonant2: String = "Consonant 2" // ㅁ,ㅂ,ㅅ,ㅇ,ㅈ
        static let consonant3: String = "Consonant 3" // ㅊ,ㅋ,ㅌ,ㅍ,ㅎ
        static let consonant4: String = "Consonant 4" // ㄲ,ㄸ,ㅃ,ㅆ,ㅉ
        static let consonant5: String = "Consonant 5" // Consonant Quiz
        
        static let vowel0: String = "Vowel 0" // Vowel Prologue
        static let vowel1: String = "Vowel 1" // ㅡ,ㅣ : ㅏ,ㅓ,ㅗ,ㅜ : ㅐ,ㅔ
        static let vowel2: String = "Vowel 2" // ㅑ,ㅕ,ㅛ,ㅠ,ㅒ,ㅖ
        static let vowel3: String = "Vowel 3" // ㅢ,ㅟ,ㅚ,ㅘ,ㅝ,ㅙ,ㅞ
        static let vowel4: String = "Vowel 4" // Vowel Quiz
        
        static let batchim0: String = "Batchim 0" // Batchim Prologue
        static let batchim1: String = "Batchim 1" // ㄱ,ㄴ,ㄷ,ㄹ,ㅁ,ㅂ,ㅇ | ㅅ,ㅈ,ㅊ,ㅋ,ㅌ,ㅍ,ㄲ,ㅆ
        static let batchim2: String = "Batchim 2" // ㅎ | 겹받침
        static let batchim3: String = "Batchim 3" // Batchim Quiz

        
        static let lessons: [String] = [
            system, // 0
            consonant0, // 1
            consonant1, // 2
            consonant2, // 3
            consonant3, // 4
            consonant4, // 5
            consonant5, // 6
            vowel0, // 7
            vowel1, // 8
            vowel2, // 9
            vowel3, // 10
            vowel4, // 11
            batchim0, // 12
            batchim1, // 13
            batchim2, // 14
            batchim3, // 15
        ]
        
        static let lessonComponent: [[[String]]] = [
            [[]],
            [
                ["Prologue"],
                ["ㄱ","ㄴ","ㄷ","ㄹ"],
                ["ㅁ","ㅂ","ㅅ","ㅇ","ㅈ"],
                ["ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"],
                ["ㄲ","ㄸ","ㅃ","ㅆ","ㅉ"],
                ["Consonant Quiz"]
            ],
            [
                ["Prologue"],
                ["ㅡ","ㅣ","ㅏ","ㅓ","ㅗ","ㅜ","ㅐ","ㅔ"],
                ["ㅑ","ㅕ","ㅛ","ㅠ","ㅒ","ㅖ"],
                ["ㅢ","ㅚ","ㅟ","ㅘ","ㅝ","ㅙ","ㅞ"],
                ["Vowel Quiz"]
            ],
            [
                ["Prologue"],
                ["Basic"],
                ["Advanced"],
                ["Batchim Quiz"]
            ]
        ]
    }
    
    struct Hangul {
        static let consonants: [String] = [
            "ㄱ",
            "ㄴ",
            "ㄷ",
            "ㄹ",
            "ㅁ",
            "ㅂ",
            "ㅅ",
            "ㅇ",
            "ㅈ",
            "ㅊ",
            "ㅋ",
            "ㅌ",
            "ㅍ",
            "ㅎ",
            "ㄲ",
            "ㄸ",
            "ㅃ",
            "ㅆ",
            "ㅉ"
        ]
        
        static let consonantExamples: [String : [String]] = [
            "ㄱ" : ["가","구"],
            "ㄴ" : ["나","누"],
            "ㄷ" : ["다","두"],
            "ㄹ" : ["라","루"],
            "ㅁ" : ["마","무"],
            "ㅂ" : ["바","부"],
            "ㅅ" : ["사","수"],
            "ㅇ" : ["아","우"],
            "ㅈ" : ["자","주"],
            "ㅊ" : ["차","추"],
            "ㅋ" : ["카","쿠"],
            "ㅌ" : ["타","투"],
            "ㅍ" : ["파","푸"],
            "ㅎ" : ["하","후"],
            "ㄲ" : ["까", "꾸"],
            "ㄸ" : ["따", "뚜"],
            "ㅃ" : ["빠", "뿌"],
            "ㅆ" : ["싸", "쑤"],
            "ㅉ" : ["짜", "쭈"],
        ]
        
        static let consonantQuiz : [String : [String]] = [
            "ㄱ" : ["가로수길", "강남구"],
            "ㄴ" : ["바나나맛 우유", "누나"],
            "ㄷ" : ["다크나이트", "두부"],
            "ㄹ" : ["배스킨 라빈스", "후루트링"],
            "ㅁ" : ["마요네즈", "무지개"],
            "ㅂ" : ["보석바", "부산행"],
            "ㅅ" : ["사랑해", "수퍼마켙"],
            "ㅇ" : ["아이스크림", "새우깡"],
            "ㅈ" : ["자유시간", "제주도"],
            "ㅊ" : ["녹차", "추억"],
            "ㅋ" : ["카페", "초코칩쿠키"],
            "ㅌ" : ["스타벅스", "투게더"],
            "ㅍ" : ["초코파이", "콘푸로스트"],
            "ㅎ" : ["하트", "후참잘"],
            "ㄲ" : ["돈까스", "꿈꾸는"],
            "ㄸ" : ["아리따움", "뚜레쥬르"],
            "ㅃ" : ["아빠", "뿌링클"],
            "ㅆ" : ["싸이", "싸움의 고수"],
            "ㅉ" : ["짜파게티", "쭈꾸미"],
        ]
        
        static let consonantSound : [String : String] = [
            "ㄱ" : "g",
            "ㄴ" : "n",
            "ㄷ" : "d",
            "ㄹ" : "r",
            "ㅁ" : "m",
            "ㅂ" : "b",
            "ㅅ" : "s",
            "ㅇ" : " ",
            "ㅈ" : "j",
            "ㅊ" : "ch",
            "ㅋ" : "k",
            "ㅌ" : "t",
            "ㅍ" : "p",
            "ㅎ" : "h",
            "ㄲ" : "gg",
            "ㄸ" : "tt",
            "ㅃ" : "bb",
            "ㅆ" : "ss",
            "ㅉ" : "jj",
        ]
        
        static let consonantExamplesSound: [String : [String]] = [
            "ㄱ" : ["ga","gu"],
            "ㄴ" : ["na","nu"],
            "ㄷ" : ["da","du"],
            "ㄹ" : ["ra","ru"],
            "ㅁ" : ["ma","mu"],
            "ㅂ" : ["ba","bu"],
            "ㅅ" : ["sa","su"],
            "ㅇ" : [" a"," u"],
            "ㅈ" : ["ja","ju"],
            "ㅊ" : ["cha","chu"],
            "ㅋ" : ["ka","ku"],
            "ㅌ" : ["ta","tu"],
            "ㅍ" : ["pa","pu"],
            "ㅎ" : ["ha","hu"],
            "ㄲ" : ["gga", "ggu"],
            "ㄸ" : ["tta", "ttu"],
            "ㅃ" : ["bba", "bbu"],
            "ㅆ" : ["ssa", "ssu"],
            "ㅉ" : ["jja", "jju"],
        ]
        
        static let lottieName : [String: String] = [
            "ㄱ" : "gun",
            "ㄴ" : "nose",
            "ㄷ" : "drink",
            "ㄹ" : "road",
            "ㅁ" : "mouth",
            "ㅂ" : "bucket",
            "ㅅ" : "squid",
            "ㅇ" : "nothing",
            "ㅈ" : "jump",
            "ㅊ" : "champion",
            "ㅋ" : "key",
            "ㅌ" : "tooth",
            "ㅍ" : "pillar",
            "ㅎ" : "hat",
            "ㄲ" : "",
            "ㄸ" : "",
            "ㅃ" : "",
            "ㅆ" : "",
            "ㅉ" : "",
        ]
        
        static let consonantCombination : [String: String] = [
            "ㄲ" : "Pronounce two ㄱ[g] sounds simultaneously",
            "ㄸ" : "Pronounce two ㄷ[d] sounds simultaneously",
            "ㅃ" : "Pronounce two ㅂ[b] sounds simultaneously",
            "ㅆ" : "Pronounce two ㅅ[s] sounds simultaneously",
            "ㅉ" : "Pronounce two ㅈ[j] sounds simultaneously",
        ]
        
        static let vowels: [String] = [
            "ㅡ",
            "ㅣ",
            "ㅏ",
            "ㅓ",
            "ㅗ",
            "ㅜ",
            "ㅐ",
            "ㅔ",
            "ㅑ",
            "ㅕ",
            "ㅛ",
            "ㅠ",
            "ㅒ",
            "ㅖ",
            "ㅢ",
            "ㅟ",
            "ㅚ",
            "ㅘ",
            "ㅝ",
            "ㅙ",
            "ㅞ",
        ]
        
        static let vowelSound : [String : String] = [
            "ㅡ" : "eu",
            "ㅣ" : "i",
            "ㅏ" : "a",
            "ㅓ" : "eo",
            "ㅗ" : "o",
            "ㅜ" : "u",
            "ㅐ" : "ae",
            "ㅔ" : "ae",
            "ㅑ" : "ya",
            "ㅕ" : "yeo",
            "ㅛ" : "yo",
            "ㅠ" : "yu",
            "ㅒ" : "yae",
            "ㅖ" : "yae",
            "ㅢ" : "eui",
            "ㅟ" : "wui",
            "ㅚ" : "wea",
            "ㅘ" : "wa",
            "ㅝ" : "wue",
            "ㅙ" : "wea",
            "ㅞ" : "wea",
        ]
        
        static let vowelSimilarSound : [String : String] = [
            "ㅡ" : "Neutral",
            "ㅣ" : "Tree",
            "ㅏ" : "Analog",
            "ㅓ" : "Seoul",
            "ㅗ" : "Orange",
            "ㅜ" : "Uber",
            "ㅐ" : "Aesthetic",
            "ㅔ" : "Aesthetic",
            "ㅑ" : "",
            "ㅕ" : "",
            "ㅛ" : "",
            "ㅠ" : "",
            "ㅒ" : "",
            "ㅖ" : "",
            "ㅢ" : "",
            "ㅟ" : "",
            "ㅚ" : "",
            "ㅘ" : "",
            "ㅝ" : "",
            "ㅙ" : "",
            "ㅞ" : "",
        ]
        
        static let vowelCombination : [String : String] = [
            "ㅡ" : "",
            "ㅣ" : "",
            "ㅏ" : "",
            "ㅓ" : "",
            "ㅗ" : "",
            "ㅜ" : "",
            "ㅐ" : "",
            "ㅔ" : "",
            "ㅑ" : "ㅣ[ee] + ㅏ[a]",
            "ㅕ" : "ㅣ[ee] + ㅓ[eo]",
            "ㅛ" : "ㅣ[ee] + ㅗ[o]",
            "ㅠ" : "ㅣ[ee] + ㅜ[u]",
            "ㅒ" : "ㅣ[ee] + ㅐ[ae]",
            "ㅖ" : "ㅣ[ee] + ㅔ[ae]",
            "ㅢ" : "ㅡ[eu] + ㅣ[ee]",
            "ㅟ" : "ㅗ[o] + ㅣ[ee]",
            "ㅚ" : "ㅗ[o] + ㅏ[a]",
            "ㅘ" : "ㅗ[o] + ㅐ[ae]",
            "ㅝ" : "ㅜ[u] + ㅣ[ee]",
            "ㅙ" : "ㅜ[u] + ㅓ[eo]",
            "ㅞ" : "ㅜ[u] + ㅔ[ae]",
        ]
        
        static let vowelQuiz: [String : [String]] = [
            "ㅡ" : ["셀프","버스"],
            "ㅣ" : ["이태원","갈비"],
            "ㅏ" : ["타는 곳","교통카드"],
            "ㅓ" : ["서울","붕어빵"],
            "ㅗ" : ["노래방","소주"],
            "ㅜ" : ["금연구역","맥주"],
            "ㅐ" : ["대한민국","홍대입구"],
            "ㅔ" : ["인생네컷","당기세요"],
            "ㅑ" : ["야구","뭐하냐"],
            "ㅕ" : ["여기어때","겨울"],
            "ㅛ" : ["비요뜨","안녕하세요"],
            "ㅠ" : ["씨유","뉴진스"],
            "ㅒ" : ["얘들아","쟤"],
            "ㅖ" : ["예쁜","예 "],
            "ㅢ" : ["배달의 민족","여의도"],
            "ㅟ" : ["다람쥐","뷔"],
            "ㅚ" : ["외국인","육회"],
            "ㅘ" : ["화장실","와"],
            "ㅝ" : ["귀여워","뭐"],
            "ㅙ" : ["쉐이크","웨하스"],
            "ㅞ" : ["왜 ","돼지고기"],
        ]
    }
    
    struct HangulQuiz{
        
        static let options: [String : [String]] = [
            "가로수길" : ["가0", "가1", "가2"],
            "강남구" : ["구0", "구1", "구2"],
            "바나나맛 우유" : ["나0", "나1", "나2"],
            "누나" : ["누0", "누1", "누2"],
            "다크나이트" : ["다1", "다2", "다3"],
            "두부" : ["두0","두1","두2"],
            "배스킨 라빈스" : ["라0","라1","라2"],
            "후루트링" : ["루0","루1","루2"],
            "마요네즈" : ["마0","마1","마2"],
            "무지개" : ["무0","무1","무2"],
            "보석바" : ["보0","보1","보2"],
            "부산행" : ["부0","부1","부2"],
            "사랑해" : ["사0","사1","사2"],
            "수퍼마켙" : ["수0","수1","수2"],
            "아이스크림" : ["아0","아1","아2"],
            "새우깡" : ["우0","우1","우2"],
            "자유시간" : ["자0","자1","자2"],
            "제주도" : ["주0","주1","주2"],
            "녹차" : ["차0","차1","차2"],
            "추억" : ["추0","추1","추2"],
            "카페" : ["카0","카1","카2"],
            "초코칩쿠키" : ["쿠0","쿠1","쿠2"],
            "스타벅스" : ["타0","타1","타2"],
            "투게더" : ["투0","투1","투2"],
            "초코파이" : ["파0","파1","파2"],
            "콘푸로스트" : ["푸0","푸1","푸2"],
            "하트" : ["하0","하1","하2"],
            "후참잘" : ["후0","후1","후2"],
            "돈까스" : ["까1","까2","까3"],
            "꿈꾸는" : ["꾸0","꾸1","꾸2"],
            "아리따움" : ["따0","따1","따2"],
            "뚜레쥬르" : ["뚜0","뚜1","뚜2"],
            "아빠" : ["빠0","빠1","빠2"],
            "뿌링클" : ["뿌0","뿌1","뿌2"],
            "싸이" : ["싸0","싸1","싸2"],
            "싸움의 고수" : ["쑤0","쑤1","쑤2"],
            "짜파게티" : ["짜0","짜1","짜2"],
            "쭈꾸미" : ["쭈0","쭈1","쭈2"],
            "셀프" : ["ㅡ0","ㅡ1","ㅡ2"],
            "버스" : ["ㅡ3","ㅡ4","ㅡ5"],
            "이태원" : ["ㅣ0","ㅣ1","ㅣ2"],
            "갈비" : ["ㅣ3","ㅣ4","ㅣ5"],
            "타는 곳" : ["ㅏ0","ㅏ1","ㅏ2"],
            "교통카드" : ["ㅏ3","ㅏ4","ㅏ5"],
            "서울" : ["ㅓ0","ㅓ1","ㅓ2"],
            "붕어빵" : ["ㅓ3","ㅓ4","ㅓ5"],
            "노래방" : ["ㅗ0","ㅗ1","ㅗ2"],
            "소주" : ["ㅗ3","ㅗ4","ㅗ5"],
            "금연구역" : ["ㅜ0","ㅜ1","ㅜ2"],
            "맥주" : ["ㅜ3","ㅜ4","ㅜ5"],
            "대한민국" : ["ㅐ0","ㅐ1","ㅐ2"],
            "홍대입구" : ["ㅐ3","ㅐ4","ㅐ5"],
            "인생네컷" : ["ㅔ0","ㅔ1","ㅔ2"],
            "당기세요" : ["ㅔ3","ㅔ4","ㅔ5"],
            "야구" : ["ㅑ0","ㅑ1","ㅑ2"],
            "뭐하냐" : ["ㅑ3","ㅑ4","ㅑ5"],
            "여기어때" : ["ㅕ0","ㅕ1","ㅕ2"],
            "겨울" : ["ㅕ3","ㅕ4","ㅕ5"],
            "비요뜨" : ["ㅛ0","ㅛ1","ㅛ2"],
            "안녕하세요" : ["ㅛ3","ㅛ4","ㅛ5"],
            "씨유" : ["ㅠ0","ㅠ1","ㅠ2"],
            "뉴진스" : ["ㅠ3","ㅠ4","ㅍ5"],
            "얘들아" : ["ㅒ0","ㅒ1","ㅒ2"],
            "쟤" : ["ㅒ3","ㅒ4","ㅒ5"],
            "예쁜" : ["ㅖ0","ㅖ1","ㅖ2"],
            "예" : ["ㅖ3","ㅖ4","ㅖ5"],
            "배달의 민족" : ["ㅢ0","ㅢ1","ㅢ2"],
            "여의도" : ["ㅢ3","ㅢ4","ㅢ5"],
            "다람쥐" : ["ㅟ0","ㅟ1","ㅟ2"],
            "뷔" : ["ㅟ3","ㅟ4","ㅟ5"],
            "외국인" : ["ㅚ0","ㅚ1","ㅚ2"],
            "육회" : ["ㅚ3","ㅚ4","ㅚ5"],
            "화장실" : ["ㅘ0","ㅘ1","ㅘ2"],
            "와" : ["ㅘ3","ㅘ4","ㅘ5"],
            "귀여워" : ["ㅝ0","ㅝ1","ㅝ2"],
            "뭐" : ["ㅝ3","ㅝ4","ㅝ5"],
            "쉐이크" : ["ㅞ0","ㅞ1","ㅞ2"],
            "웨하스" : ["ㅞ3","ㅞ4","ㅞ5"],
            "왜" : ["ㅙ0","ㅙ1","ㅙ2"],
            "돼지고기" : ["ㅙ3","ㅙ4","ㅙ5"]
        ]
        
        static let meaning: [String : String] =  [
            "가로수길" : "Garosu-gil",
            "강남구":"Gangnam-district",
            "바나나맛 우유":"Banana flavor milk",
            "누나":"Sister",
            "다크나이트":"Dark Knight(Film)",
            "두부":"Tofu",
            "배스킨 라빈스":"Baskin Robbins",
            "후루트링":"Fruit Ring",
            "마요네즈":"Mayonnaise",
            "무지개":"Rainbow",
            "보석바":"Jewelry bar(Ice cream)",
            "부산행":"Train to busan",
            "사랑해":"Love you",
            "수퍼마켙":"Supermarket",
            "아이스크림":"Ice cream",
            "새우깡":"Shrimp snack",
            "자유시간":"Free time(Chocolate bar)",
            "제주도":"Jeju island",
            "녹차":"Green tea",
            "추억":"Memory",
            "카페":"Cafe",
            "초코칩쿠키":"Chocolate chip cookie",
            "스타벅스":"Starbucks",
            "투게더":"Together(Ice cream)",
            "초코파이":"Chocolate pie",
            "콘푸로스트":"Corn frost(Frosted Flakes)",
            "하트":"Heart",
            "후참잘":"Fuchamjal(Fried chicken restaurant)",
            "돈까스":"Pork cutlet",
            "꿈꾸는":"Dreaming",
            "아리따움":"ARITAUM(Cosmetic shop)",
            "뚜레쥬르":"Tous les Jours(Bakery)",
            "아빠":"Father",
            "뿌링클":"Bburinkle(Menu of Fried chicken restaurant)",
            "싸이":"Psy",
            "싸움의 고수":"Fighting",
            "짜파게티":"Jjapagetti(Instant Chajangmyun Noodles)",
            "쭈꾸미":"Small octopus",
            "셀프":"Self",
            "버스":"Bus",
            "이태원":"Itaewon",
            "갈비":"Galbi",
            "타는 곳":"Place to ride",
            "교통카드":"Transportaton Card",
            "서울":"Seoul",
            "붕어빵":"Fish-shaped bun(Street food)",
            "노래방":"Karaoke",
            "소주":"Soju",
            "금연구역":"Non-smoking area",
            "맥주":"Beer",
            "대한민국":"Korea",
            "홍대입구":"Hongik University(Subway station)",
            "인생네컷":"Life's four cuts(Instant photo booth)",
            "당기세요":"Pull",
            "야구":"Baseball",
            "뭐하냐":"What are you doing?",
            "여기어때":"How about here?(Korean Airbnb)",
            "겨울":"Winter",
            "비요뜨":"Viyott",
            "안녕하세요":"Hello",
            "씨유":"CU(Convenience store)",
            "뉴진스":"NewJeans",
            "얘들아":"You guys",
            "쟤":"He or She(That person)",
            "에쁜":"Pretty",
            "예":"Yes",
            "배달의 민족":"Nation of delivery(Korean Uber)",
            "여의도":"Yeouido(Large island on the Han River)",
            "다람쥐":"Chipmunk",
            "뷔":"V(BTS)",
            "외국인":"Foreigner",
            "육회":"Beef Tartare",
            "화장실":"Toilet",
            "와":"Wow(ice cream)",
            "귀여워":"Cute",
            "뭐":"What",
            "쉐이크":"Shake",
            "웨하스":"Wafers",
            "왜":"Why",
            "돼지고기":"Pork"
        ]
        
        static let tmi : [String : String] = [
            "가로수길" : "used to be the hottest street in Korea, but not anymore",
            "강남구":"",
            "바나나맛 우유":"",
            "누나":"",
            "다크나이트":"",
            "두부":"",
            "배스킨 라빈스":"",
            "후루트링":"",
            "마요네즈":"",
            "무지개":"",
            "보석바":"",
            "부산행":"",
            "사랑해":"",
            "수퍼마켙":"",
            "아이스크림":"",
            "새우깡":"",
            "자유시간":"",
            "제주도":"",
            "녹차":"",
            "추억":"",
            "카페":"",
            "초코칩쿠키":"",
            "스타벅스":"",
            "투게더":"",
            "초코파이":"",
            "콘푸로스트":"",
            "하트":"",
            "후참잘":"",
            "돈까스":"",
            "꿈꾸는":"",
            "아리따움":"",
            "뚜레쥬르":"",
            "아빠":"",
            "뿌링클":"",
            "싸이":"",
            "싸움의 고수":"",
            "짜파게티":"",
            "쭈꾸미":"",
            "셀프":"",
            "버스":"",
            "이태원":"",
            "갈비":"",
            "타는 곳":"",
            "교통카드":"",
            "서울":"",
            "붕어빵":"",
            "노래방":"",
            "소주":"",
            "금연구역":"",
            "맥주":"",
            "대한민국":"",
            "홍대입구":"",
            "인생네컷":"",
            "당기세요":"",
            "야구":"",
            "뭐하냐":"",
            "여기어때":"",
            "겨울":"",
            "비요뜨":"",
            "안녕하세요":"",
            "씨유":"",
            "뉴진스":"",
            "얘들아":"",
            "쟤":"",
            "에쁜":"",
            "예":"",
            "배달의 민족":"",
            "여의도":"",
            "다람쥐":"",
            "뷔":"",
            "외국인":"",
            "육회":"",
            "화장실":"",
            "와":"",
            "귀여워":"",
            "뭐":"",
            "쉐이크":"",
            "웨하스":"",
            "왜":"",
            "돼지고기":""
        ]
    }
    
    struct Practice{
        
        static let chapter : [String] = [
            "음식",
            "여행",
            "일상회화"
        ]
        
        static let lesson : [String : [String]] = [
            "음식" : ["국밥", "치맥", "삼겹살", "불고기", "삼계탕", "칼국수", "닭한마리", "라면", "불닭볶음면", "삼각김밥", "김치", "육회", "떡볶이", "소주", "빈대떡", "냉면", "비빔밥", "토스트", "붕어빵"],
            "여행" : ["홍대", "성수", "서울", "강남", "인천", "부산", "한강", "익선동", "이태원", "동대문", "혜화", "종로", "광장시장", "지하철", "버스", "가로수길", "공항", "경복궁", "남산", "명동"],
            "일상회화" : ["안녕하세요", "감사합니다", "죄송합니다", "맛있어요", "주세요", "어디에요", "얼마에요", "도와주세요", "편의점", "병원", "화장실", "좋아요", "싫어요", "네", "아니요"]
        ]
    }
    
    struct Prologue {
        static let title : [String : String] = [
        
            "system0" : "Consonants and Vowels",
            "system1" : "Letter in English and Hangul",
            "system2" : "Hangul Letter",
            "system3" : "Word",
            
        ]
        
        static let text : [String : String] = [
        
            "system0" : "Hangul is a character that can be written **phonetically**. It consists of **consonants** and **vowels!**",
            "system1" : "A letter in English is one alphabet. But a **letter in Hangul** is a **combination of consonants and vowels!**",
            "system2" : "A **Hangul letter** is a combination of consonants and vowels, so basically the form is **'C+V'** or **'C+V+C'**!",
            "system3" : "A **Hangul word** is a combination of letters. Is it hard? \n\n Learning Hangul won't be difficult, **so give it a try!**",
        ]
        
        static let image : [String : [String] ] = [
        
            "system0" : ["ㄱ"],
            "system1" : ["ㄴ"],
            "system2" : ["ㄷ", "ㄹ"],
            "system3" : ["ㅁ"],
            
        ]
    }
}
