/*
 Lv1.
 - `backgroundColor = .black`
 - `textColor = .white`
 - 우선, 텍스트는 `12345` 로 고정
 - 텍스트 오른쪽 정렬
 - Font = 시스템 볼드체, 사이즈 60
 - **AutoLayout**
     - leading, trailing = superView 로 부터 30 떨어지도록 세팅
     - top = superView 로 부터 200 떨어지도록 세팅
     - height = 100
 */


import UIKit
import SnapKit

class ViewController: UIViewController {
    var resultlabel = UILabel()

    var sevenButton = UIButton()
    var eightButton = UIButton()
    var nineButton = UIButton()
    var plusButton = UIButton()
    var firstStack = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
        setConstraints()
        
    }
    // 구성 함수
    func cofigureUI() {
                
        resultlabel.backgroundColor = .black
        resultlabel.textColor = .white
        resultlabel.text = "12345"
        resultlabel.font = .boldSystemFont(ofSize: 60)
        resultlabel.textAlignment = .right
        
        // 버튼에 타이틀 넣기
        sevenButton = buttons(title: "7")
        eightButton = buttons(title: "8")
        nineButton = buttons(title: "9")
        plusButton = buttons(title: "+")
        firstStack = makeHorizontalStackView([sevenButton, eightButton, nineButton, plusButton])
               
                
        [resultlabel, firstStack]
            .forEach { view.addSubview($0) }
        
        // firstSatck 레이아웃
        firstStack.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(resultlabel.snp.bottom).offset(20)
        }
    }
    
    
    // label 레이아웃
    func setConstraints() {
        resultlabel.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.top.equalToSuperview().inset(200)
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(30)
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
        return stackView
    }
}


