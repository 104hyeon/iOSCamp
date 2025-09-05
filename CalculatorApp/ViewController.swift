/*
 Lv4.
연산버튼 orange로 색상변경
버튼 관련해서 함수 수정
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
        sevenButton = makeButtons(title: "7", action: nil, backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        eightButton = makeButtons(title: "8", action: nil, backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        nineButton = makeButtons(title: "9", action: nil, backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        plusButton = makeButtons(title: "+", action: nil, backgroundColor: .orange)
        firstStack = makeHorizontalStackView([sevenButton, eightButton, nineButton, plusButton])
        
        sixButton = makeButtons(title: "6", action: nil, backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        fiveButton = makeButtons(title: "5", action: nil, backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        fourButton = makeButtons(title: "4", action: nil, backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        minusButton = makeButtons(title: "-", action: nil, backgroundColor: .orange)
        secondStack = makeHorizontalStackView([sixButton, fiveButton, fourButton, minusButton])
        
        threeButton = makeButtons(title: "3", action: nil, backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        twoButton = makeButtons(title: "2", action: nil, backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        oneButton = makeButtons(title: "1", action: nil, backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        multiplyButton = makeButtons(title: "*", action: nil, backgroundColor: .orange)
        thirdStack = makeHorizontalStackView([threeButton, twoButton, oneButton, multiplyButton])
        
        acButton = makeButtons(title: "AC", action: nil, backgroundColor: .orange)
        zeroButton = makeButtons(title: "0", action: nil, backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        equalsButton = makeButtons(title: "=", action: nil, backgroundColor: .orange)
        divideButton = makeButtons(title: "/", action: nil, backgroundColor: .orange)
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
    
    // 반복 사용하는 버튼 디자인 함수로 만들기
    // Lv4에서 버튼 컬러 변경으로 함수 수정
    func makeButtons(title: String, action: Selector?, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
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


