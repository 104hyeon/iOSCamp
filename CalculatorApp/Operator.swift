//
//  Operator.swift
//  CalculatorApp
//
//  Created by bakae on 9/15/25.
//

import Foundation

extension ViewController {
    
    
    // 연산 함수
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}

