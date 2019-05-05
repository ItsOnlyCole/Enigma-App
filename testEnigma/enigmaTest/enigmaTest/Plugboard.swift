//
//  Plugboard.swift
//  enigmaTest
//
//  Created by user153545 on 5/5/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

import Foundation

class Plugboard {
    private var plugs: [Plug]!
    
    init () {
        
    }
    
    func addPlug(charOne: Int, charTwo: Int) {
        if (plugs.count == 10)
        {
            print("Max number of plugs in use\nPlease remove one to add one")
            return
        }
        if (isCharInUse(char: charOne)==false && isCharInUse(char: charTwo) == false)
        {
            plugs.append(Plug(charOne: charOne, charTwo: charTwo))
        }
        else
        {
            if isCharInUse(char: charOne) == true
            {
                print("\(charOne) is already in use.")
            }
            else if (isCharInUse(char: charTwo) == true)
            {
                print("\(charTwo) is already in use.")
            }
            else
            {
                print("error")
            }
            return
        }
    }
    func isCharInUse(char: Int) -> Bool {
        for i in 0...plugs.count-1
        {
            for j in 0...1
            {
                if (char == plugs[i].getChar(index: j))
                {
                    return true
                }
            }
        }
        return false
    }
}
