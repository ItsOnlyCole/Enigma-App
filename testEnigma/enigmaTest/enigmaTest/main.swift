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

var myString:String = "Montana"
myString = myString.lowercased()
var charValues = [Int]()
var encodedCharValues = [Int]()
var decodedCharValues = [Int]()
var myPlugBoard = Plugboard()
myPlugBoard.addPlug(charOne: 8, charTwo: 24)
myPlugBoard.addPlug(charOne: 14, charTwo: 16)
myPlugBoard.addPlug(charOne: 2, charTwo: 1)
myPlugBoard.addPlug(charOne: 19, charTwo: 12)
myPlugBoard.addPlug(charOne: 17, charTwo: 3)
myPlugBoard.addPlug(charOne: 20, charTwo: 9)
myPlugBoard.addPlug(charOne: 5, charTwo: 21)
myPlugBoard.addPlug(charOne: 11, charTwo: 13)
myPlugBoard.addPlug(charOne: 22, charTwo: 4)
myPlugBoard.addPlug(charOne: 23, charTwo: 6)

for i in myString
{
    charValues.append(testRotors.convertToInt(char: i))
}
print(myString)

//Clears myString
myString = ""
for i in 0...charValues.count-1
{
    encodedCharValues.append(myPlugBoard.passCharThroughPlugboard(char: charValues[i]))
    //print(encodedCharValues[i])
    encodedCharValues[i] = testRotors.encodeValue(newCharIndex: encodedCharValues[i])
    //print(encodedCharValues[i])
    encodedCharValues[i] = myPlugBoard.passCharThroughPlugboard(char: encodedCharValues[i])
    //print(encodedCharValues[i])
    //print("\n")
    //encodedCharValues.append(testRotors.encodeValue(newCharIndex: charValues[i]))
    //print(endcodedCharValues[i])
    myString += String(testRotors.convertToChar(charIndex: encodedCharValues[i]))
}
print(myString)

//Converts back to cat
myString = ""
testRotors.resetRotorPositions()
for i in 0...encodedCharValues.count-1
{
    decodedCharValues.append(myPlugBoard.passCharThroughPlugboard(char: encodedCharValues[i]))
    //print(decodedCharValues[i])
    decodedCharValues[i] = testRotors.encodeValue(newCharIndex: decodedCharValues[i])
    //print(decodedCharValues[i])
    decodedCharValues[i] = myPlugBoard.passCharThroughPlugboard(char: decodedCharValues[i])
    //print(decodedCharValues[i])
    //print("\n")
    //decodedCharValues.append(testRotors.encodeValue(newCharIndex: encodedCharValues[i]))
    myString += String(testRotors.convertToChar(charIndex: decodedCharValues[i]))
}
print(myString)


