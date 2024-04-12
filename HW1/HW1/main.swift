//
//  main.swift
//  HW1
//
//  Created by Александр Федоткин on 11.04.2024.
//

import Foundation

var listOfCars : [Car]? = []

while true {
    print(Interface.MainInterface.addCar.rawValue)
    print(Interface.MainInterface.listOfCar.rawValue)
    print(Interface.MainInterface.listWithFilter.rawValue)
    let userInteractive = readLine()
    selectMenu(userInteractive: userInteractive)
}

private func selectMenu(userInteractive: String?) {
    guard let userInteractive = userInteractive,
          let userInteractiveInt = Int(userInteractive) else {
        showError(.incorrectValue)
        return
    }
    
    switch userInteractiveInt {
    case 1:
        addNewCar()
        break
    case 2:
        presentListOfCar()
        break
    case 3:
        selectFilter()
        break
    default:
        showError(.incorrectValue)
    }
}

private func selectFilter() {
    var body : Body
    while true {
        print(Interface.AddNewCar.body.rawValue)
        for (index, bodyType) in Body.allCases.enumerated() {
            print("\(index + 1). \(bodyType.rawValue)")
        }
        print("0. Выход")
        let bodyType = readLine() ?? ""
        if Int(bodyType) == 0 {
            break
        }
        if let type = Body[bodyType] {
            body = type
        } else {
            showError(.incorrectValue)
            continue
        }
        presentListOfCar(filter: body)
    }
}

private func presentListOfCar(filter: Body? = nil) {
    guard let listOfCars = listOfCars,
          !listOfCars.isEmpty else {
        showError(.listIsEmpty)
        return
    }
    if let filter = filter {
        for listOfCar in listOfCars {
            if listOfCar.body == filter {
                listOfCar.showCar()
            }
        }
    } else {
        for listOfCar in listOfCars {
            listOfCar.showCar()
        }
    }
}

private func addNewCar() {
    print("* - Обязательные поля\n")
    var manufacturer : String
    var model : String
    var body : Body
    var yearOfIssue : Int?
    var carNumber : String?
    while true {
        print(Interface.AddNewCar.manufacturer.rawValue)
        manufacturer = readLine() ?? ""
        if manufacturer.isEmpty {
            showError(.incorrectValue)
            continue
        }
        print(Interface.AddNewCar.model.rawValue)
        model = readLine() ?? ""
        if model.isEmpty {
            showError(.incorrectValue)
            continue
        }
        print(Interface.AddNewCar.body.rawValue)
        for (index, bodyType) in Body.allCases.enumerated() {
            print("\(index + 1). \(bodyType.rawValue)")
        }
        let bodyType = readLine() ?? ""
        if let type = Body[bodyType] {
            body = type
        } else {
            showError(.incorrectValue)
            continue
        }
        print(Interface.AddNewCar.yearOfIssue.rawValue)
        let printedYearOfIssue = readLine()
        if let printedYearOfIssue = printedYearOfIssue,
           let printedYearOfIssue = Int(printedYearOfIssue) {
            yearOfIssue = printedYearOfIssue
        }
        print(Interface.AddNewCar.carNumber.rawValue)
        if let printedCarNumber = readLine(),
           !printedCarNumber.isEmpty{
            carNumber = printedCarNumber
        }
        listOfCars?.append(Car(manufacturer: manufacturer, model: model, body: body, yearsOfIssue: yearOfIssue, carNumber: carNumber))
        break
    }
}

private func showError(_ alert: Errors) {
    print(alert.rawValue)
}

