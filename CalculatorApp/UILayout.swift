//
//  UILayout.swift
//  CalculatorApp
//
//  Created by bakae on 9/15/25.
//

import UIKit
import SnapKit

extension ViewController {
    // 구성 함수
    func cofigureUI() {
        
        // resultLabel
        resultLabel.backgroundColor = .black
        resultLabel.textColor = .white
        resultLabel.text = "\(number)"
        resultLabel.font = .boldSystemFont(ofSize: 60)
        resultLabel.textAlignment = .right
        
        // verticalStackView
        vStackView.axis = .vertical
        vStackView.backgroundColor = .black
        vStackView.spacing = 10
        vStackView.distribution = .fillEqually
        
        // 서브뷰 추가
        [resultLabel, vStackView]
            .forEach { view.addSubview($0) }
        
        // 버튼에 타이틀 넣기와 스택 구성하기
        sevenButton = makeButtons(.numbers(7))
        eightButton = makeButtons(.numbers(8))
        nineButton = makeButtons(.numbers(9))
        plusButton = makeButtons(.add)
        firstStack = makeHorizontalStackView([sevenButton, eightButton, nineButton, plusButton])
        
        sixButton = makeButtons(.numbers(6))
        fiveButton = makeButtons(.numbers(5))
        fourButton = makeButtons(.numbers(4))
        minusButton = makeButtons(.subtract)
        secondStack = makeHorizontalStackView([sixButton, fiveButton, fourButton, minusButton])
        
        threeButton = makeButtons(.numbers(3))
        twoButton = makeButtons(.numbers(2))
        oneButton = makeButtons(.numbers(1))
        multiplyButton = makeButtons(.multiply)
        thirdStack = makeHorizontalStackView([threeButton, twoButton, oneButton, multiplyButton])
        
        acButton = makeButtons(.reset)
        zeroButton = makeButtons(.numbers(0))
        equalsButton = makeButtons(.equal)
        divideButton = makeButtons(.divide)
        forthStack = makeHorizontalStackView([acButton, zeroButton, equalsButton, divideButton])
        
        // 가로 스택뷰 vStackView안에 배치
        [firstStack, secondStack, thirdStack, forthStack]
            .forEach { vStackView.addArrangedSubview($0) }
    }
    
    
    // 전체적 레이아웃
    func setConstraints() {
        resultLabel.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.top.equalToSuperview().inset(200)
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        vStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(resultLabel.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
    }
}

