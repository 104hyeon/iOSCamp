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
    let resultlabel = UILabel()
    let stackView = UIStackView()
    let sevenButton = UIButton()
    let eightButton = UIButton()
    let nineButton = UIButton()
    let plusButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
        setConstraints()
        
    }
    // Label 구성 함수
    func cofigureUI() {
        
        [resultlabel, stackView]
            .forEach { view.addSubview($0) }
        
        resultlabel.backgroundColor = .black
        resultlabel.textColor = .white
        resultlabel.text = "12345"
        resultlabel.font = .boldSystemFont(ofSize: 60)
        resultlabel.textAlignment = .right
        
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        
        // 버튼 스택뷰에
        [sevenButton, eightButton, nineButton, plusButton]
            .forEach { stackView.addArrangedSubview($0)
                $0.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                $0.layer.cornerRadius = 40
                $0.titleLabel?.font = .boldSystemFont(ofSize: 30)
                sevenButton.snp.makeConstraints {
                    $0.width.equalTo(80)
                    $0.height.equalTo(80)
                }
            }
        // 버튼에 타이틀 넣기
        sevenButton.setTitle("7", for: .normal)
        eightButton.setTitle("8", for: .normal)
        nineButton.setTitle("9", for: .normal)
        plusButton.setTitle("+", for: .normal)
    }
    // 레이아웃
    func setConstraints() {
        resultlabel.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.top.equalToSuperview().inset(200)
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(30)
        }
        stackView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.top.equalTo(resultlabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(30)
        }
    }
    
    
}

