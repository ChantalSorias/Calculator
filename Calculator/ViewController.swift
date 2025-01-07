//
//  ViewController.swift
//  Calculator
//
//  Created by Chantal on 2025-01-06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calulatorWorkings: UILabel!
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll() {
        workings = ""
        calulatorWorkings.text = ""
        calculatorResults.text = ""
    }

    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func equalTap(_ sender: Any) {
        if(!workings.isEmpty && validInput()) {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    func validInput() -> Bool {
        if (specialCharacter(char: workings.last!)) {
            workings.removeLast()
            calulatorWorkings.text = workings
        }
        
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings {
            if(specialCharacter(char: char)) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if(index == 0) {
                return false
            }
            
            if (index == workings.count - 1) {
                return false
            }
            
            if(previous != -1) {
                if(index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool {
        return char == "*" || char == "/" || char == "+" || char == "%"
    }
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func backspaceTap(_ sender: Any) {
        if(!workings.isEmpty) {
            workings.removeLast()
            calulatorWorkings.text = workings
        }
    }
    
    func addToWorking(value: String) {
        workings += value
        calulatorWorkings.text = workings
    }
    
    @IBAction func percentTap(_ sender: Any) {
        if (!workings.isEmpty && validInput()) {
            addToWorking(value: "%")
        }
        
    }
    
    @IBAction func divideTap(_ sender: Any) {
        if (!workings.isEmpty && validInput()) {
            addToWorking(value: "/")
        }
    }
    
    @IBAction func multiplyTap(_ sender: Any) {
        if (!workings.isEmpty && validInput()) {
            addToWorking(value: "*")
        }
    }
    
    @IBAction func subtractTap(_ sender: Any) {
        if (!workings.isEmpty && validInput()) {
            addToWorking(value: "-")
        }
    }
    
    @IBAction func additionTap(_ sender: Any) {
        if (!workings.isEmpty && validInput()) {
            addToWorking(value: "+")
        }
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        if (!workings.isEmpty && validInput()) {
            addToWorking(value: ".")
        }
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorking(value: "0")
    }
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorking(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorking(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorking(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorking(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorking(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorking(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorking(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorking(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorking(value: "9")
    }
}

