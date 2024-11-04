//
//  ViewController.swift
//  Counter
//
//  Created by Матвей Сюзев on 2024-11-03.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "Значение счетчика: 0"
        historyTextView.isEditable = false
        historyTextView.isSecureTextEntry = false
        historyTextView.isSelectable = false
        historyTextView.isScrollEnabled = true
        historyTextView.text = "История изменений:\n".uppercased()
    }
    
    private var counter: Int = 0
    
    private func dateTime()->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
//        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: Date())
        return date
    }
    
    @IBAction func plusDidTouched(_ sender: Any) {
        
        counter += 1
        counterLabel.text = "Значение счетчика: \(counter)"
        historyTextView.text += "\(dateTime()): значение изменено на +1\n"
        
    }
    
    @IBAction func minusDidTouched(_ sender: Any) {
        
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счетчика: \(counter)"
            historyTextView.text += "\(dateTime()): значение изменено на -1\n"
        } else {
            historyTextView.text += "\(dateTime()): попытка уменьшить значение счётчика ниже 0\n"
        }
    }
    
    
    @IBAction func resetDidTouched(_ sender: Any) {
        
        counter = 0
        counterLabel.text = "Значение счетчика: \(counter)"
        historyTextView.text += "\(dateTime()): значение cброшено\n"
    }
    
}

