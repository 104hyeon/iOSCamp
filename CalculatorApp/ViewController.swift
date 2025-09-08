/*
 Lv8.
 등호 (=) 버튼을 클릭하면 연산이 수행되도록 구현합니다.
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
        sevenButton = makeButtons(title: "7", action: #selector(didTapButton), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        eightButton = makeButtons(title: "8", action: #selector(didTapButton), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        nineButton = makeButtons(title: "9", action: #selector(didTapButton), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        plusButton = makeButtons(title: "+", action: #selector(didTapButton), backgroundColor: .orange)
        firstStack = makeHorizontalStackView([sevenButton, eightButton, nineButton, plusButton])
        
        sixButton = makeButtons(title: "6", action: #selector(didTapButton), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        fiveButton = makeButtons(title: "5", action: #selector(didTapButton), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        fourButton = makeButtons(title: "4", action: #selector(didTapButton), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        minusButton = makeButtons(title: "-", action: #selector(didTapButton), backgroundColor: .orange)
        secondStack = makeHorizontalStackView([sixButton, fiveButton, fourButton, minusButton])
        
        threeButton = makeButtons(title: "3", action: #selector(didTapButton), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        twoButton = makeButtons(title: "2", action: #selector(didTapButton), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        oneButton = makeButtons(title: "1", action: #selector(didTapButton), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        multiplyButton = makeButtons(title: "*", action: #selector(didTapButton), backgroundColor: .orange)
        thirdStack = makeHorizontalStackView([threeButton, twoButton, oneButton, multiplyButton])
        
        acButton = makeButtons(title: "AC", action: #selector(didTabReset), backgroundColor: .orange)
        zeroButton = makeButtons(title: "0", action: #selector(didTapButton), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        equalsButton = makeButtons(title: "=", action: #selector(didTabEqul), backgroundColor: .orange)
        divideButton = makeButtons(title: "/", action: #selector(didTapButton), backgroundColor: .orange)
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
    func makeButtons(title: String, action: Selector, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)  //옵셔널체이닝
        button.layer.cornerRadius = 40
        button.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        button.addTarget(self, action: action, for: .touchUpInside)
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
        if resultLabel.text == "0" {
            resultLabel.text = " "
        }
        resultLabel.text! += sender.currentTitle ?? ""
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



