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
        
        print("< 게임을 시작합니다 >")
        
        let isGameOver = true
        
        // 값을 받는 것부터 정답이 될 때까지 반복
        while isGameOver {
            print("숫자를 입력하세요")
            
            /*
             유저의 입력값을 받음
             유저가 숫자 3개 외 다른 값을 입력했을 때 오류 문구 보여주기
             1. 숫자가 아닌 다른 값을 입력했을 때
             2. 중복된 숫자가 있을 때
             3. 0을 입력했을 때
             4. 숫자가 3개가 아닐 때
            
             */
            
            guard let userInput = readLine() else { continue }
            
            let inputNums = userInput.compactMap { Int(String($0)) }
            

            // 1.숫자가 아닌 다른 값을 입력했을 때
            if inputNums.count != userInput.count {
                print("올바르지 않은 입력 값입니다.")
                continue
            }
            

            // 2. 중복된 숫자가 있을 때
            let inset = Set(inputNums)
            if inset.count != inputNums.count {
                print("중복된 숫자를 포함하고 있습니다")
                continue
            } else {
            }
            
            // 3. 맨 앞자리 0이 올 때
            if inputNums[0] == 0 {
                print("맨 앞자리는 0이 될 수 없습니다")
                continue
            } else {
            }
            
          
            // 4. 숫자가 3개가 아닐 때
            if inputNums.count != 3 {
                print("숫자를 3개 입력하세요")
                continue
            } else {
            }
            
                       
            // 정답과 비교하여 스트라이크와 볼 카운트하기
            for i in 0..<inputNums.count {
                if inputNums[i] == answer[i] {
                    strike += 1
                } else if answer.contains(inputNums[i]) {
                    ball += 1
                }
            }
            
            // 스트라이크 3개 즉 정답이면 "정답입니다" 출력 후 빠져나가기
            if strike == 3 {
                print("정답입니다.")
                break
            } else if strike > 0 || ball > 0 {    // 둘 중 하나만 값이 있어도 출력
                print("\(strike)스트라이크 \(ball)볼")
            } else {
                print("Nothing")
            }
            
            // 힌트 알려준 후 스트라이크, 볼 카운트 리셋
            strike = 0
            ball = 0
            
            
        }
        
        print("게임을 종료합니다")
    }
    
    
    func makeAnswer() -> [Int] {
        var randomNum: [Int] = []

        while randomNum.count < 3 {
            let number = Int.random(in: 0...9)
            if !randomNum.contains(number) {   // 중복되는 숫자 제외하기
                randomNum.append(number)   // 랜덤으로 뽑은 숫자 배열에 추가
            }
            if randomNum[0] == 0 {
                break
                               
            }
        }
        return(randomNum)
    }
}



