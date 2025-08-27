//
//  baseballGame.swift
//  baseballGame
//
//  Created by bakae on 8/27/25.
//

import Foundation



class BaseballGame {
    func start() {
        let answer = makeAnswer()
    }
    
    func makeAnswer() -> [Int] {
        var randomNum: [Int] = []

        while randomNum.count < 3 {
            let number = Int.random(in: 1...9)
            if !randomNum.contains(number) {   // 중복되는 숫자 제외하기
                randomNum.append(number)   // 랜덤으로 뽑은 숫자 배열에 추가
            }
        }
        return(randomNum)
    }
}



