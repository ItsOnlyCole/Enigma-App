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

var charValues: [Int] = [2,0,19] //Value for Cat
for i in 0...2
{
    charValues[i] = testRotors.encodeValue(newCharIndex: charValues[i])
    //testRotors.updateRotorsPositions()
    print("\n")
}
*/

var myString:String = "cat"
var charValues = [Int]()
var encodedCharValues = [Int]()
var decodedCharValues = [Int]()

for i in myString
{
    charValues.append(testRotors.convertToInt(char: i))
}
print(myString)

//Clears myString
myString = ""
for i in 0...charValues.count-1
{
    encodedCharValues.append(testRotors.encodeValue(newCharIndex: charValues[i]))
    //print(endcodedCharValues[i])
    myString += String(testRotors.convertToChar(charIndex: encodedCharValues[i]))
}
print(myString)

//Converts back to cat
myString = ""
testRotors.resetRotorPositions()
for i in 0...encodedCharValues.count-1
{
    decodedCharValues.append(testRotors.encodeValue(newCharIndex: encodedCharValues[i]))
    myString += String(testRotors.convertToChar(charIndex: decodedCharValues[i]))
}
print(myString)


