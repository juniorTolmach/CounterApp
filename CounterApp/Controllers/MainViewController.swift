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
    
    private let date = Date()
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "Дата - dd.MM.yyyy, Время - HH:mm"
        return formatter
    }()
    private var dateString: String {
        dateFormatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction private func addNumberByOne(_ sender: Any) {
        counterLabel.text = String(counter + 1)
        textView.text += "\(dateString)\n" + Description.numberPlusOne.rawValue
        let range = NSRange(location: textView.text.count - 1, length: 0)
        textView.scrollRangeToVisible(range)
        scrollAutoTextView()
    }
    
    @IBAction private func subtractNumberByOne(_ sender: Any) {
        if counter > 0 {
            counterLabel.text = String(counter - 1)
            textView.text += "\(dateString)\n" + Description.numberMinusOne.rawValue
            scrollAutoTextView()
        } else {
            textView.text += "\(dateString)\n" + Description.numbermenoDizero.rawValue
            scrollAutoTextView()
        }
    }
    
    @IBAction private func restartCounter(_ sender: Any) {
        counterLabel.text = "0"
        textView.text += "\(dateString)\n" + Description.numberRestart.rawValue
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
