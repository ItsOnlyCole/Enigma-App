//
//  Rotor.swift
//  Enigma
//
//  Created by user153545 on 5/6/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

import Foundation

class Rotor {
    private var rotorNumber: Int = 1
    private var rotorConnections: [Int]!
    private var rotorPosition: Int = 0
    
    
    init(rotorNumber: Int) {
        self.rotorNumber = rotorNumber
        setRotorConnections(rotorNumber: rotorNumber)
    }
    
    func setRotorConnections(rotorNumber: Int) {
        switch (rotorNumber)
        {
        case 1:
            rotorConnections = [6,24,20,5,11,9,16,14,19,22,23,4,3,15,25,13,0,12,17,7,1,18,10,8,2,21]
            break
        case 2:
            rotorConnections = [1,7,6,19,16,4,23,5,25,24,17,15,8,12,3,9,10,20,2,13,22,11,18,21,0,14]
            break
        case 3:
            rotorConnections = [3,18,9,19,14,1,16,10,24,7,20,8,6,11,22,4,21,15,0,12,23,2,5,17,25,13]
            break
        case 4:
            rotorConnections = [20,7,24,15,16,19,18,12,4,10,11,8,17,5,22,1,23,25,13,14,6,9,0,21,2,3]
            break
        case 5:
            rotorConnections = [14,24,20,22,23,2,13,12,14,11,3,10,16,4,5,19,25,18,21,1,8,17,7,9,6,0]
            break
        default:
            //Does Nothing. There will never be a case where it's not 1-5, but Swift requires a default regardless.
            break
        }
    }
    
    func setRotorNumber (rotorNumber: Int) {
        self.rotorNumber = rotorNumber
    }
    func getRotorNumber () -> Int {
        return rotorNumber
    }
    
    func setRotorPosition (position: Int) {
        rotorPosition = position
    }
    func getRotorPosition () -> Int {
        return rotorPosition
    }
    
    func updateRotorPosition () -> Bool {
        var updateNextRotor: Bool = false
        if(rotorPosition == 25)
        {
            updateNextRotor = true
            rotorPosition = 0
        }
        else
        {
            updateNextRotor = false
            rotorPosition+=1
        }
        return updateNextRotor
    }
    
    func getRotorValue (charIndex: Int) -> Int {
        if(charIndex + rotorPosition > 25)
        {
            return rotorConnections[(charIndex+rotorPosition) -  26]
        }
        else
        {
            return rotorConnections[charIndex + rotorPosition]
        }
    }
    func getRotorReflectedValue (charIndex: Int) -> Int {
        for i in 0...25
        {
            if (rotorConnections[i] == charIndex)
            {
                if(i - rotorPosition < 0)
                {
                    return i - rotorPosition + 26
                }
                else
                {
                    return i - rotorPosition
                }
            }
        }
        return -1
    }
    
    func getRotorConnections() -> Array<Int> {
        return rotorConnections
    }
}
