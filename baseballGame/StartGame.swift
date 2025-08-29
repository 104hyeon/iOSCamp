//
//  StartGame.swift
//  baseballGame
//
//  Created by bakae on 8/29/25.
//

import Foundation


/*
 시작 시 나오는 안내문구
 사용자 선택으로 아래 3가지 진행
 1. 게임 시작
 2. 기록 보기
 3. 게임 종료
*/

class StartGame {
    func startGame() {
        let baseballGame = BaseballGame()
        
        let guideStart = true
        
        while guideStart {
            print(" ")
            print("환영합니다!🎉 원하시는 번호를 입력해주세요🔢")
            print("1. 게임 시작하기⚾️  2. 게임 기록보기📋  3. 게임 종료하기🔚")
            
            guard let userInput = readLine() else { continue }
            
            let inputNums = userInput.compactMap { Int(String($0)) }
            
            // 1.숫자가 아닌 다른 값을 입력했을 때
            if inputNums.count != userInput.count {
                print("올바르지 않은 입력 값입니다.")
                continue
            }
   
            // 2. 숫자가 1개가 아닐 때
            if inputNums.count != 1 {
                print("숫자를 1개만 입력하세요")
                continue
            } else {
            }
            
            // 3. 숫자가 1, 2, 3이 아닐 때
            if inputNums != [1, 2, 3] {
                print("<1, 2, 3> 중 하나를 입력하세요")
                continue
            } else {
            }
            
            
            switch inputNums {
            case [1]:
                baseballGame.start()       // "1" 누르면 게임 시작 (Class BaseballGame 실행)
            case [2]:
                print("게임 기록 보기")       // 아직 구현 안해서 문자열 출력으로 처리
            case [3]:
                print("게임을 종료합니다")     // 게임 종료하고 시작 안내문구로 돌아감
                break
            default:
                break                     // 그 외 게임 종료하고 시작 안내문구로 돌아감
                
            }
            
        }
    }
}
