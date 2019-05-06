//
//  EnigmaModelController.swift
//  Enigma
//
//  Created by user153545 on 5/6/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

import Foundation

class EnigmaModelController {
    private var rotors = Rotors(rotorOneNumber: 1, rotorTwoNumber: 2, rotorThreeNumber: 3)
    private var plugboard = Plugboard()
    private var message: String!
    private var encodedMessage: String = ""
    private var charValues = [Int] ()
    private var encodedCharValues = [Int] ()
    private let intToCharDict: [Int:Character] = [0:"a", 1:"b", 2:"c", 3:"d", 4:"e", 5:"f", 6:"g", 7:"h", 8:"i", 9:"j", 10:"k", 11:"l", 12:"m", 13:"n", 14:"o", 15:"p", 16:"q", 17:"r", 18:"s", 19:"t", 20:"u", 21:"v", 22:"w", 23:"x", 24:"y", 25:"z"]
    private let charToIntDict: [Character:Int] = ["a":0, "b":1, "c":2, "d":3, "e":4, "f":5, "g":6, "h":7, "i":8, "j":9, "k":10, "l":11, "m":12, "n":13, "o":14, "p":15, "q":16, "r":17, "s":18, "t":19, "u":20, "v":21, "w":22, "x":23, "y":24, "z":25]
    
    
    
    init() {
    }
    
    func prepMessage(message: String) {
        for character in message
        {
            if (character.isLetter == true)
            {
                let preppedChar = Character(character.lowercased())
                charValues.append(convertToInt(char: preppedChar))
            }
        }
    }
    
    func encodeMessage() -> String {
        encodedMessage = ""
        for i in 0...charValues.count - 1
        {
            encodedCharValues.append(plugboard.passCharThroughPlugboard(char: charValues[i]))
            encodedCharValues[i] = rotors.encodeValue(newCharIndex: encodedCharValues[i])
            encodedCharValues[i] = plugboard.passCharThroughPlugboard(char: encodedCharValues[i])
            encodedMessage += String(convertToChar(charIndex: encodedCharValues[i]))
        }
        resetEnigmaMessage()
        return encodedMessage
    }
    
    func resetEnigmaMessage() {
        message = ""
        //encodedMessage = ""
        charValues.removeAll()
        encodedCharValues.removeAll()
    }
    
    func convertToChar (charIndex: Int) -> Character {
        return intToCharDict[charIndex]!
    }
    
    func convertToInt (char: Character) -> Int {
        return charToIntDict[char]!
    }
    
    func getRotorNumber(rotorLocation: Int) -> Int {
        return rotors.getRotorNumber(rotorLocation: rotorLocation)
    }
    
    func getRotorConnections(rotorLocation: Int) -> Array<Int> {
        return rotors.getRotorConnections(rotorLocation: rotorLocation)
    }
    
    func getRotorPosition(rotorLocation: Int) -> Int {
        return rotors.getRotorPosition(rotorLocation: rotorLocation)
    }
    
    func setRotorPosition(rotorLocation: Int, increment: Bool) {
        var position = rotors.getRotorPosition(rotorLocation: rotorLocation)
        //Increases/Decreases position
        if (increment == true)
        {
            position += 1
        }
        else
        {
            position -= 1
        }
        //Keeps position in the bounds of the rotorConnections Array
        if (position == -1)
        {
            position = 25
        }
        else if (position == 26)
        {
            position = 0
        }
        rotors.setRotorPosition(rotor: rotorLocation, position: position)
    }
}
