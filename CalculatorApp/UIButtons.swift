//
//  UIButtons.swift
//  CalculatorApp
//
//  Created by bakae on 9/15/25.
//
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

