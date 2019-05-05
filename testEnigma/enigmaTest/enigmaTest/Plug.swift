//
//  Plug.swift
//  enigmaTest
//
//  Created by user153545 on 5/5/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

import Foundation

class Plug {
    private var connectedChar = [Int]()
    
    init(charOne: Int, charTwo: Int) {
        updatePlugConnections(index: 0, char: charOne)
        updatePlugConnections(index: 0, char: charTwo)
    }
    
    func updatePlugConnections(index: Int, char: Int) {
        if(index < 0 || index > 1)
        {
            print("Index is out of range")
            return
        }
        else if (index == 0 && connectedChar[1] == char)
        {
            print("Plug can't be connected to itself")
            return
        }
        else if (index == 1 && connectedChar[0] == char)
        {
            print("Plug can't be connected to itself")
            return
        }
        else if (char < 0 || char > 25)
        {
            print("Not a valide char")
            return
        }
        
        if(connectedChar.indices.contains(index) == true)
        {
            connectedChar[index] = char;
        }
        else
        {
            connectedChar.append(char)
        }
    }
    
    func getChar(index: Int) -> Int {
        return connectedChar[index]
    }
}
