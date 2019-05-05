//
//  main.swift
//  enigmaTest
//
//  Created by user153545 on 5/4/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

//import Foundation

/*
var testRotor = Rotor(rotorNumber: 1)

var value = testRotor.getRotorValue(position: 5)

print(value)
*/
var testRotors = Rotors(rotorOneNumber: 1, rotorTwoNumber: 2, rotorThreeNumber: 3)
/*
var charValue: Int = 2 //Value for C
print(charValue)
charValue = testRotors.encodeValue(newCharIndex: charValue)
print(charValue)
charValue = testRotors.encodeValue(newCharIndex: charValue)
print(charValue)

//testRotors.updateRotorsPositions()
for i in 0...2 {print(testRotors.getRotorPosition(rotorNumber: i))}

print("\n\n\n")
 */
var charValues: [Int] = [2,0,19] //Value for Cat
for i in 0...2
{
    charValues[i] = testRotors.encodeValue(newCharIndex: charValues[i])
    //testRotors.updateRotorsPositions()
    print("\n")
}
