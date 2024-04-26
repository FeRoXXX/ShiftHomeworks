//
//  MyHobby.swift
//  HW3
//
//  Created by Александр Федоткин on 26.04.2024.
//

import UIKit

class MyHobby: UIViewController {
    @IBOutlet weak var changeHobby: UIPickerView!
    @IBOutlet weak var hobbyNameTextField: UITextField!
    @IBOutlet weak var hobbyInformation: UILabel!
    
    var dataManager : DataManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPicker()
        setupFirstValue()
    }
    
    private func setupFirstValue() {
        guard let hobby = dataManager.getHobby(from: 0) else {
            return
        }
        hobbyNameTextField.text = hobby.rawValue
        updateInformation(hobbyText: hobby.rawValue)
    }

}

extension MyHobby: UIPickerViewDelegate, UIPickerViewDataSource {
    
    private func setupPicker() {
        changeHobby.delegate = self
        changeHobby.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let hobby = dataManager.getHobby(from: row) else {
            return ""
        }
        return hobby.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let hobby = dataManager.getHobby(from: row) else {
            return
        }
        hobbyNameTextField.text = hobby.rawValue
        updateInformation(hobbyText: hobby.rawValue)
    }
    
    private func updateInformation(hobbyText: String) {
        hobbyInformation.text = dataManager.getHobbyInfo(from: hobbyText).rawValue
    }
    
}
