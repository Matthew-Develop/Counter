//
//  ViewController.swift
//  Counter
//
//  Created by Матвей Сюзев on 2024-11-03.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var plusButton: UIButton!
    
    @IBOutlet private weak var minusButton: UIButton!
    
    @IBOutlet private weak var resetButton: UIButton!
    
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "Значение счетчика: 0"
        historyTextView.isEditable = false
        historyTextView.isSecureTextEntry = false
        historyTextView.isSelectable = false
        historyTextView.isScrollEnabled = true
        historyTextView.text = "История изменений:\n".uppercased()
    }
    
    
    
    private func dateTime()->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let date = dateFormatter.string(from: Date())
        return date
    }
    
    @IBAction private func plusDidTouched(_ sender: Any) {
        
        counter += 1
        counterLabel.text = "Значение счетчика: \(counter)"
        historyTextView.text += "\(dateTime()): значение изменено на +1\n"
    }
    
    @IBAction private func minusDidTouched(_ sender: Any) {
        
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счетчика: \(counter)"
            historyTextView.text += "\(dateTime()): значение изменено на -1\n"
        } else {
            historyTextView.text += "\(dateTime()): попытка уменьшить значение счётчика ниже 0\n"
        }
    }
    
    
    @IBAction private func resetDidTouched(_ sender: Any) {
        
        counter = 0
        counterLabel.text = "Значение счетчика: \(counter)"
        historyTextView.text += "\(dateTime()): значение cброшено\n"
    }
}

