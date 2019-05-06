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
    private let reflector: [[Int]] = [[6,7],[5,0],[8,4],[13,24],[11,23],[15,20],[12,21],[9,18],[14,25],[1,3],[22,17],[16,19],[10,2]]
    private var charIndex: Int = 0
    //private let intToCharDict: [Int:Character] = [0:"a", 1:"b", 2:"c", 3:"d", 4:"e", 5:"f", 6:"g", 7:"h", 8:"i", 9:"j", 10:"k", 11:"l", 12:"m", 13:"n", 14:"o", 15:"p", 16:"q", 17:"r", 18:"s", 19:"t", 20:"u", 21:"v", 22:"w", 23:"x", 24:"y", 25:"z"]
    //private let charToIntDict: [Character:Int] = ["a":0, "b":1, "c":2, "d":3, "e":4, "f":5, "g":6, "h":7, "i":8, "j":9, "k":10, "l":11, "m":12, "n":13, "o":14, "p":15, "q":16, "r":17, "s":18, "t":19, "u":20, "v":21, "w":22, "x":23, "y":24, "z":25]

    init(rotorOneNumber: Int, rotorTwoNumber: Int, rotorThreeNumber: Int) {
        rotors.append(Rotor(rotorNumber: rotorOneNumber))
        rotors.append(Rotor(rotorNumber: rotorTwoNumber))
        rotors.append(Rotor(rotorNumber: rotorThreeNumber))
    }
    
    func setRotorPosition(rotor: Int, position: Int) {
        rotors[rotor].setRotorPosition(position: position)
    }
    func getRotorNumber(rotorLocation: Int) -> Int {
        return rotors[rotorLocation].getRotorNumber()
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
        //print(charIndex)
        //print("((")
        for i in 0...2
        {
            charIndex = getValue(rotor: i, charIndex: charIndex)
            //print(charIndex)
        }
        charIndex = reflectValue(charIndex: charIndex)
        //print(charIndex)
        for i in (0...2).reversed()
        {
            charIndex = getReflectedValue(rotor: i, charIndex: charIndex)
            //print(charIndex)
        }
        //print("))")
        updateRotorsPositions()
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
    func getRotorPosition(rotorLocation: Int) -> Int {
        return rotors[rotorLocation].getRotorPosition()
    }
    func resetRotorPositions() {
        for i in 0...2
        {
            rotors[i].setRotorPosition(position: 0)
        }
    }
    
    func getRotorConnections(rotorLocation: Int) -> Array<Int> {
        return rotors[rotorLocation].getRotorConnections()
    }
    /*
    func convertToChar (charIndex: Int) -> Character {
        return intToCharDict[charIndex]!
    }
    func convertToInt (char: Character) -> Int {
        return charToIntDict[char]!
    }
 */
}
