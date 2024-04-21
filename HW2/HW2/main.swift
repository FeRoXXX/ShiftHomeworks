//
//  main.swift
//  HW2
//
//  Created by Александр Федоткин on 19.04.2024.
//

import Foundation

func runApplication() {
    var array : ThreadSafetyArray<Int> = ThreadSafetyArray(arrayElements: [])
    let queue = DispatchQueue(label: "com.alexandrfedotkin.concurrentQueue", attributes: .concurrent)
    let group = DispatchGroup()
    
    
    let task1 =  DispatchWorkItem {
        for i in 0...100 {
            array.append(i)
        }
        
        group.leave()
    }
    
    let task2 =  DispatchWorkItem {
        for i in 0...100 {
            array.append(i)
        }
        
        group.leave()
    }
    
    group.enter()
    queue.async(execute: task1)
    
    group.enter()
    queue.async(execute: task2)
    
    group.wait()
    
    print(array.count)
    print(array)
    for _ in 0...100 {
        array.remove(at: -1)
    }
    array.remove(at: 0)
    array.remove(at: -1)
    
    print(array)
    
}

runApplication()
