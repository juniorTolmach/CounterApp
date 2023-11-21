//
//  ViewController.swift
//  CounterApp
//
//  Created by Daniil Oreshenkov on 18.11.2023.
//

import UIKit

private enum Description: String {
    case numberPlusOne = "значение изменено на +1\n"
    case numberMinusOne = "значение изменено на -1\n"
    case numbermenoDizero = "попытка уменьшить значение счётчика ниже 0\n"
    case numberRestart = "значение сброшено"
}

class MainViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var restartButton: UIButton!
    @IBOutlet private weak var textView: UITextView!
    
    private var counter: Int {
        get {
            Int(counterLabel.text ?? "0") ?? 0
        }
    }
    private let currentDate = Date().fullDate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction private func addNumberByOne(_ sender: Any) {
        
        counterLabel.text = String(counter + 1)
        textView.text += "\(currentDate)\n" + Description.numberPlusOne.rawValue
        let range = NSRange(location: textView.text.count - 1, length: 0)
        textView.scrollRangeToVisible(range)
        scrollAutoTextView()
    }
    
    @IBAction private func subtractNumberByOne(_ sender: Any) {
        if counter > 0 {
            counterLabel.text = String(counter - 1)
            textView.text += "\(currentDate)\n" + Description.numberMinusOne.rawValue
            scrollAutoTextView()
        } else {
            textView.text += "\(currentDate)\n" + Description.numbermenoDizero.rawValue
            scrollAutoTextView()
        }
    }
    
    @IBAction private func restartCounter(_ sender: Any) {
        counterLabel.text = "0"
        textView.text += "\(currentDate)\n" + Description.numberRestart.rawValue
        scrollAutoTextView()
    }
    
    private func scrollAutoTextView() {
        let range = NSRange(location: textView.text.count, length: 0)
        textView.scrollRangeToVisible(range)
    }
    
    private func configure() {
        plusButton.layer.cornerRadius = 10
        minusButton.layer.cornerRadius = 10
        restartButton.layer.cornerRadius = 10
        textView.layer.cornerRadius = 10
        
        textView.isEditable = false
    }
}

extension Date {
    var fullDate:String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "Дата: dd.MM.YY Время: HH:mm"
        return dateFormatter.string(from: Date())
    }
}
