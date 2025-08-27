

// 프로토콜에 연산에서 반복 적용되는 함수 넣기
protocol AdstractOperation {
    func calculate(firstNumber: Double, secondNumber: Double) -> Double
}


// Calculator 클래스로 분리
class Calculator {
    let addOperator = AddOperation()
    let subtractOperator = SubtractOperation()
    let multiplyOperator = MultiplyOperation()
    let divideOperator = DivideOperation()
    let reminderOperator = ReminderOperation()
    
     }


// 각 연산에 대한 클래스
class AddOperation {
    func calculate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

    class SubtractOperation {
        func calculate(firstNumber: Double, secondNumber: Double) -> Double {
            return firstNumber - secondNumber
        }
    }


class MultiplyOperation {
    func calcurate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}


class DivideOperation {
    func calcurate(firstNumber: Double, secondNumber: Double) -> Double {
        guard secondNumber != 0 else {
            return 0
        }
        return Double(firstNumber) / Double(secondNumber)
    }
}

class ReminderOperation {
    func calcurate(firstNumber: Double, secondNumber: Double) -> Double {
        guard secondNumber != 0 else {
            return 0
        }
        return firstNumber.truncatingRemainder(dividingBy: secondNumber)
    }
}

// 각 연산의 인스턴스
let addOperation = AddOperation()
let subtractOperation = SubtractOperation()
let multiplyOperation = MultiplyOperation()
let divideOperation = DivideOperation()
let reminderOperation = ReminderOperation()

// Calculator의 인스턴스
let calculator = Calculator()


// 출력해보기

let addResult = calculator.addOperator.calculate(firstNumber: 10, secondNumber: 5)
print(addResult)

let subtractResult = calculator.subtractOperator.calculate(firstNumber: 27, secondNumber: 6)
print(subtractResult)

let multiplyResult = calculator.multiplyOperator.calcurate(firstNumber: 8, secondNumber: 4)
print(multiplyResult)

let divideResult = calculator.divideOperator.calcurate(firstNumber: 21, secondNumber: 5)
print(divideResult)

let reminderResult = calculator.reminderOperator.calcurate(firstNumber: 16, secondNumber: 3)
print(reminderResult)






