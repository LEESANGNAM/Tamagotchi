//
//  TalkMessage.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/06.
//

import Foundation

struct Message{
    static var messge:[String] = []
    
    static func setupMessages(nickname: String){
        messge = [
            "\(nickname)님 좋은 하루 보내세요",
            "\(nickname)님 안녕하세요",
            "\(nickname)님 밥주세요",
            "\(nickname)님 물주세요",
            "\(nickname)님 과제는 하셨나요?",
            "\(nickname)님 일어나세요.",
            "고마워요 \(nickname)님",
            "배가 터질거 같아요",
            "프로토콜은 왜 사용 하는 걸까요?",
            "저는 다마고치에요",
            "기분이 좋아요",
            "배고파아아아아아아아아아아아아아아아아아아아아",
            "\(nickname)님 깃허브 잔디는 심으셨나요??",
            "오늘은 너무 날씨가 좋은거같아요",
            "오늘은 너무 더운거 같아요",
            "\(nickname)님 오늘 기분은 어떤가요?",
            "졸리다 zzZ",
            "저는 자러 갈게요 zzZ",
            "피곤한 하루네요",
            "오늘은 뭘 먹을까요?",
            "오늘은 뭘 먹었나요?",
            "기분이 아주 좋아요 ㅎㅎㅎㅎㅎㅎ \(nickname)님은 어떠신가요 :)",
            "기분이 안좋아요.... ㅠ.ㅠ",
            "클래스와 구조체의 차이점은 무엇일까요?",
            "비가 많이온대요 우산 챙기셨나요??"
        ]
            
    }
            
}
