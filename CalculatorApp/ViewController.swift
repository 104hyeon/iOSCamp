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

    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
        setConstraints()
        
    }
    // Label 구성 함수
    func cofigureUI() {
        resultlabel.backgroundColor = .black
        resultlabel.textColor = .white
        resultlabel.text = "12345"
        resultlabel.font = .boldSystemFont(ofSize: 60)
        resultlabel.textAlignment = .right
        view.addSubview(resultlabel)
    }
    // Label 레이아웃
    func setConstraints() {
        resultlabel.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.top.equalToSuperview().inset(200)
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(30)
         }
        
    }
    
    


}

