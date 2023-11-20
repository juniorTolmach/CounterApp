//
//  ViewController.swift
//  CounterApp
//
//  Created by Daniil Oreshenkov on 18.11.2023.
//

import UIKit

enum Description: String {
    case numberPlusOne = "значение изменено на +1\n"
    case numberMinusOne = "значение изменено на -1\n"
    case numbermenoDizero = "попытка уменьшить значение счётчика ниже 0\n"
    case numberRestart = "значение сброшено"
}

class MainViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
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

    @IBAction func addNumberByOne(_ sender: Any) {
        counterLabel.text = String(counter + 1)
        textView.text += "\(dateString)\n" + Description.numberPlusOne.rawValue
    }
    
    @IBAction func subtractNumberByOne(_ sender: Any) {
        if counter > 0 {
            counterLabel.text = String(counter - 1)
            textView.text += "\(dateString)\n" + Description.numberMinusOne.rawValue
        } else {
            textView.text += "\(dateString)\n" + Description.numbermenoDizero.rawValue
        }
    }
    
    @IBAction func restartCounter(_ sender: Any) {
        counterLabel.text = "0"
        textView.text += "\(dateString)\n" + Description.numberRestart.rawValue
    }
    
    private func configure() {
        plusButton.layer.cornerRadius = 10
        minusButton.layer.cornerRadius = 10
        restartButton.layer.cornerRadius = 10
        textView.layer.cornerRadius = 10
        
        textView.isEditable = false
    }
}
