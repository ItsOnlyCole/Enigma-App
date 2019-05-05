//
//  Rotors.swift
//  enigmaTest
//
//  Created by user153545 on 5/4/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

import Foundation

class Rotors {
    private var rotors = [Rotor]()
    private var reflector: [[Int]] = [[6,7],[5,0],[8,4],[13,24],[11,23],[15,20],[12,21],[9,18],[14,25],[1,3],[22,17],[16,19],[10,2]]
    private var reflected: Bool = false
    private var charIndex: Int = 0

    init(rotorOneNumber: Int, rotorTwoNumber: Int, rotorThreeNumber: Int) {
        rotors.append(Rotor(rotorNumber: rotorOneNumber))
        rotors.append(Rotor(rotorNumber: rotorTwoNumber))
        rotors.append(Rotor(rotorNumber: rotorThreeNumber))
    }
    
    func setRotorPosition(rotor: Int, position: Int) {
        rotors[rotor].setRotorPosition(position: position)
    }
    
    func getValue(rotor: Int, charIndex: Int) -> Int {
        return rotors[rotor].getRotorValue(charIndex: charIndex)
    }
    func getReflectedValue(rotor: Int, charIndex: Int) -> Int {
        return rotors[rotor].getRotorReflectedValue(charIndex: charIndex)
    }
    func reflectValue(charIndex: Int) -> Int {
        for i in 0 ... 13
        {
            for j in 0 ... 1
            {
                if (reflector[i][j] == charIndex)
                {
                    if (j == 0)
                    {
                        return reflector[i][1]
                    }
                    else
                    {
                        return reflector[i][0]
                    }
                }
            }
        }
        return -1
    }
    func encodeValue(newCharIndex: Int) -> Int {
        charIndex = newCharIndex
        for i in 0...2
        {
            charIndex = getValue(rotor: i, charIndex: charIndex)
        }
        charIndex = reflectValue(charIndex: charIndex)
        for i in (0...2).reversed()
        {
            charIndex = getReflectedValue(rotor: i, charIndex: charIndex)
        }
        return charIndex
    }
    func updateRotorsPositions () {
        //Updates Rotor 0's rotor position then checks if triggers rotor 1 to rotate
        if (rotors[0].updateRotorPosition() == true)
        {
            if(rotors[1].updateRotorPosition() == true)
            {
                var _: Bool = rotors[2].updateRotorPosition();
            }
        }
    }
    func getRotorPosition(rotorNumber: Int) -> Int {
        return rotors[rotorNumber].getRotorPosition()
    }
}
