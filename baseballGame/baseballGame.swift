//
//  baseballGame.swift
//  baseballGame
//
//  Created by bakae on 8/27/25.
//

import Foundation



class BaseballGame {
    func start() {
        let answer = makeAnswer()  //게임이 시작할 때 생성되고 생성된 후 변하면 안됨
        var strike = 0
        var ball = 0
        
        print("게임을 시작합니다")
        
        let isGameOver = true
        
        // 값을 받는 것부터 정답이 될 때까지 반복
        while isGameOver {
            print("숫자를 입력하세요")
            let userInput = readLine() // 임시로 값 지정함, readLine으로 수정필요. 유저한테 입력받고
                        
            let inputNums = Array(userInput!).map { Int(String($0))! }
            
            
            for i in 0..<inputNums.count {
                if inputNums[i] == answer[i] {
                    strike += 1
                } else if answer.contains(inputNums[i]) {
                    ball += 1
                }
            }
            if strike > 0 || ball > 0 {    // 둘 중 하나만 값이 있어도 출력
                print("\(strike)스트라이크 \(ball)볼")
            } else {
                print("Nothing")
            }
            
        }
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



