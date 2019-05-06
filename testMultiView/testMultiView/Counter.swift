//
//  Counter.swift
//  testMultiView
//
//  Created by user153545 on 5/5/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

class Counter {
    private var count: Int = 0
    
    init () {
        
    }
    
    func getCount() -> Int {
        return count
    }
    func updateCount() {
        count += 1
    }
    func resetCount() {
        count = 0
    }
}
