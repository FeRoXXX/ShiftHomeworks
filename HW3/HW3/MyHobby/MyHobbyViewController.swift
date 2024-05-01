//
//  MyHobby.swift
//  HW3
//
//  Created by Александр Федоткин on 26.04.2024.
//

import UIKit

class MyHobbyViewController: UIViewController, IUsingDatas {
    @IBOutlet weak var changeHobby: UIPickerView!
    @IBOutlet weak var hobbyNameTextField: UITextField!
    @IBOutlet weak var hobbyInformation: UILabel!
    
    var dataManager : IDataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPicker()
        setupFirstValue()
    }

}

private extension MyHobbyViewController {
    
    func setupFirstValue() {
        guard let dataManager = dataManager,
              let hobby = dataManager.getMyHobbyInfo(id: 0) else {
            return
        }
        hobbyNameTextField.text = hobby.rawValue
        updateInformation(hobbyText: hobby)
    }
    
}

extension MyHobbyViewController: UIPickerViewDelegate {
    
    private func setupPicker() {
        changeHobby.delegate = self
        changeHobby.dataSource = self
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let dataManager = dataManager,
              let hobby = dataManager.getMyHobbyInfo(id: row) else {
            return ""
        }
        return hobby.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let dataManager = dataManager,
              let hobby = dataManager.getMyHobbyInfo(id: row) else {
            return
        }
        hobbyNameTextField.text = hobby.rawValue
        updateInformation(hobbyText: hobby)
    }
    
    private func updateInformation(hobbyText: MyHobbyModel.Hobby) {
        guard let dataManager = dataManager else {
            return
        }
        hobbyInformation.text = dataManager.getMyHobby(hobby: hobbyText)
    }
    
}

extension MyHobbyViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
}
