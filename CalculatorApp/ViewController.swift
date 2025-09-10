/*
 Lv8.
 연산 버튼 두 번 연속 안 눌리도록 수정
 버튼들 enum 사용
 */


import UIKit
import SnapKit

enum Buttons {
    case numbers(Int), add, subtract, multiply, divide, equal, reset
    
    var title: String {
        switch self {
        case .numbers(let value):
            return "\(value)"
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "*"
        case .divide: return "/"
        case .equal: return "="
        case .reset: return "AC"
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal, .reset:
            return .orange
        case .numbers:
            return UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        }
    }
    
    var action: Selector {
        switch self {
        case .equal:
            return #selector(ViewController.didTabEqul)
        case .reset:
            return #selector(ViewController.didTabReset)
        default:
            return #selector(ViewController.didTapButton(_:))
        }
    }
}

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
        setConstraints()
        }
    
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
    
    // 반복 사용하는 버튼 디자인 함수로 만들기
    // Lv4에서 버튼 컬러 변경으로 함수 수정
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
    // 연산 함수
    func calculate(expression: String) -> Int? {
            let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    
    // 버튼 클릭시 레이블에 추가하기
    @objc
    func didTapButton(_ sender: UIButton) {
        let resultText = resultLabel.text?.last
        let newText = sender.currentTitle ?? ""
        let operators = ["+", "-", "*", "/"]
        
        
        switch resultText {
        case "0":
            resultLabel.text = " "
            resultLabel.text! += newText
            
        case let oper?:
            if operators.contains(String(oper)) && operators.contains(newText) {
                return
            }
            resultLabel.text! += newText
            
            
        default :
            resultLabel.text! += newText
            
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



