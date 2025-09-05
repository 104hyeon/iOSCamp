/*
 Lv3.
 UIStackView을 사용해서 세로 스택 뷰 생성. 왼쪽과 같이 구성해보세요.

 verticalStackView 속성
     - axis = .vertical
     - backgroundColor = .black
     - spacing = 10
     - distribution = .fillEqually
 - verticalStackView AutoLayout
     - width = 350
     - top = label 의 bottom 으로 부터 60 떨어지도록.
     - centerX = superView 와 같도록.

 */


import UIKit
import SnapKit

class ViewController: UIViewController {
    var resultlabel = UILabel()
    
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
        
        // resultlabel
        resultlabel.backgroundColor = .black
        resultlabel.textColor = .white
        resultlabel.text = "12345"
        resultlabel.font = .boldSystemFont(ofSize: 60)
        resultlabel.textAlignment = .right
        
        // verticalStackView
        vStackView.axis = .vertical
        vStackView.backgroundColor = .black
        vStackView.spacing = 10
        vStackView.distribution = .fillEqually
        
        // 서브뷰 추가
        [resultlabel, vStackView]
            .forEach { view.addSubview($0) }
                
        // 버튼에 타이틀 넣기와 스택 구성하기
        sevenButton = buttons(title: "7")
        eightButton = buttons(title: "8")
        nineButton = buttons(title: "9")
        plusButton = buttons(title: "+")
        firstStack = makeHorizontalStackView([sevenButton, eightButton, nineButton, plusButton])
        
        sixButton = buttons(title: "6")
        fiveButton = buttons(title: "5")
        fourButton = buttons(title: "4")
        minusButton = buttons(title: "-")
        secondStack = makeHorizontalStackView([sixButton, fiveButton, fourButton, minusButton])
        
        threeButton = buttons(title: "3")
        twoButton = buttons(title: "2")
        oneButton = buttons(title: "1")
        multiplyButton = buttons(title: "*")
        thirdStack = makeHorizontalStackView([threeButton, twoButton, oneButton, multiplyButton])
        
        acButton = buttons(title: "AC")
        zeroButton = buttons(title: "0")
        equalsButton = buttons(title: "=")
        divideButton = buttons(title: "/")
        forthStack = makeHorizontalStackView([acButton, zeroButton, equalsButton, divideButton])
        
        // 가로 스택뷰 vStackView안에 배치
        [firstStack, secondStack, thirdStack, forthStack]
            .forEach { vStackView.addArrangedSubview($0) }

    }
    
    
    // 전체적 레이아웃
    func setConstraints() {
        resultlabel.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.top.equalToSuperview().inset(200)
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        vStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(resultlabel.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
    }
    
    // 반복사용하는 버튼 디자인 함수로 만들기
    func buttons(title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)  //옵셔널체이닝
        button.layer.cornerRadius = 40
        button.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
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
}


