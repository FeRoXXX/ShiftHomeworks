//
//  ThreadSafetyArray.swift
//  HW2
//
//  Created by Александр Федоткин on 19.04.2024.
//
import Foundation

protocol IThreadSafetyArrayProtocol {
    associatedtype Element: Equatable
    var isEmpty : Bool { get }
    var count : Int { get }
    
    mutating func append(_ item: Element)
    mutating func remove(at index: Int)
    subscript(index: Int) -> Element { get }
    func contains(_ element: Element) -> Bool
}

struct ThreadSafetyArray<Element : Equatable> : IThreadSafetyArrayProtocol {
    fileprivate var arrayElements : [Element] = []
    fileprivate var semaphore = DispatchSemaphore(value: 1)
    
    init(arrayElements: [Element]) {
        self.arrayElements = arrayElements
    }
    
    init() {
        self.arrayElements = []
    }
    
    var isEmpty : Bool {
        get {
            safetyAction {
                arrayElements.isEmpty
            }
        }
    }
    
    var count : Int {
        get {
            safetyAction {
                arrayElements.count
            }
        }
    }
    
    mutating func append(_ item: Element) {
        safetyAction {
            arrayElements.append(item)
        }
    }
    
    mutating func remove(at index: Int) {
        _ = safetyAction {
            arrayElements.remove(at: index)
        }
    }
    
    subscript(index: Int) -> Element {
        safetyAction {
            arrayElements[index]
        }
    }
    
    func contains(_ element: Element) -> Bool {
        return safetyAction {
            arrayElements.contains(where: { $0 == element })
        }
    }
}

extension ThreadSafetyArray : CustomStringConvertible {
    var description: String {
        String(describing: arrayElements)
    }
}

fileprivate extension ThreadSafetyArray {
    func safetyAction<T>(action : () -> (T)) -> T {
        semaphore.wait()
        defer {
            semaphore.signal()
        }
        return action()
    }
}
