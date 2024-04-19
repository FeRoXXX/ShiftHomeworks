//
//  main.swift
//  HW2
//
//  Created by Александр Федоткин on 19.04.2024.
//

import Foundation

import Foundation

func runApplication() {
    var array : ThreadSafetyArray<Int> = ThreadSafetyArray(arrayElements: [])
    let queue = DispatchQueue(label: "com.alexandrfedotkin.concurrentQueue", attributes: .concurrent)
    let group = DispatchGroup()
    
    
    let task1 =  DispatchWorkItem {
        for i in 0...1000 {
            array.append(i)
        }
        
        group.leave()
    }
    
    let task2 =  DispatchWorkItem {
        for i in 0...1000 {
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
}

runApplication()

