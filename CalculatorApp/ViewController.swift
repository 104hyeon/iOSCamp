/*
파일분리, 언래핑 수정
 */


import UIKit
import SnapKit


class ViewController: UIViewController {
    var number: Int = 0
    var resultLabel = UILabel()
    let vStackView = UIStackView()
    
    var sevenButton = UIButton()
    var eightButton = UIButton()
    var nineButton = UIButton()
    var plusButton = UIButton()
    var firstStack = UIStackView()
    
    var sixButton = UIButton()
    var fiveButton = UIButton()
    var fourButton = UIButton()
    var minusButton = UIButton()
    var secondStack = UIStackView()
    
    var threeButton = UIButton()
    var twoButton = UIButton()
    var oneButton = UIButton()
    var multiplyButton = UIButton()
    var thirdStack = UIStackView()
    
    var acButton = UIButton()
    var zeroButton = UIButton()
    var equalsButton = UIButton()
    var divideButton = UIButton()
    var forthStack = UIStackView()
}

extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
        setConstraints()
    }
}

extension ViewController {
    
    // 반복 사용하는 버튼 디자인 함수로 만들기
    // Lv4에서 버튼 컬러 변경으로 함수 수정
    // enum 사용으로 매개변수 변경
    func makeButtons(_ type: Buttons) -> UIButton {
        let button = UIButton()
        button.backgroundColor = type.backgroundColor
        button.setTitle(type.title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)  //옵셔널체이닝
        button.layer.cornerRadius = 40
        button.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        button.addTarget(self, action: type.action, for: .touchUpInside)
        return button
    }
    
    // 반복 사용하는 스택뷰 함수로 만들기
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        firstStack.snp.makeConstraints {
            $0.height.equalTo(80)
        }
        return stackView
    }
    
    
    // 버튼 클릭시 레이블에 추가하기
    @objc
    func didTapButton(_ sender: UIButton) {
        guard var resultText = resultLabel.text else { return }
        
        guard let newText = sender.currentTitle else { return }
        
        let resultLastChar = resultText.last
        
        let operators = ["+", "-", "*", "/"]
        // 전체 레이블이 "0"이면 지우고 시작
        if resultText == "0" {
            resultText = ""
        }
        // 연산 기호 중복 방지
        switch resultLastChar {
        case let oper?:
            if operators.contains(String(oper)) && operators.contains(newText) {
                return
            }
            resultText += newText
            resultLabel.text = resultText
        default:
            resultText += newText
            resultLabel.text = resultText
        }
    }
    
    // "AC"버튼 클릭 시 "0"으로 리셋
    @objc
    func didTabReset() {
        resultLabel.text = "0"
    }
    
    // "="버튼 클릭 시 연산 후 결과 값 레이블에 반영
    @objc
    func didTabEqul() {
        if let result = calculate(expression: resultLabel.text ?? "") {
            resultLabel.text = "\(result)"
        } else {
            resultLabel.text = nil
        }
    }
    
}



