//
//  Plugboard.swift
//  enigmaTest
//
//  Created by user153545 on 5/5/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

import Foundation

class Plugboard {
    private var plugs = [Plug]()
    
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
    
    func removePlug(index: Int) {
        plugs.remove(at: index)
    }
    
    func isCharInUse(char: Int) -> Bool {
        if (plugs.isEmpty == true)
        {
            return false
        }
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
    
    func passCharThroughPlugboard(char: Int) -> Int {
        if (plugs.isEmpty == true)
        {
            return char
        }
        for i in 0...plugs.count-1
        {
            for j in 0...1
            {
                if (char == plugs[i].getChar(index: j))
                {
                    //Returns the connected char in plug
                    if(j == 0)
                    {
                        return plugs[i].getChar(index: 1)
                    }
                    else if (j == 1)
                    {
                        return plugs[i].getChar(index: 0)
                    }
                }
            }
        }
        //returns original char if not connected to plugboard
        return char
    }
    
    func getPlugInfo(index: Int) -> String {
        let infoString = ("Plug #\(index): \(plugs[index].getChar(index: 0)) - \(plugs[index].getChar(index: 1))")
        return infoString
    }
    func getAllPlugsInfo() -> String {
        var infoString: String = ""
        for index in 0 ... plugs.count-1
        {
            infoString = ("Plug #\(index): \(plugs[index].getChar(index: 0)) - \(plugs[index].getChar(index: 1))\n")
        }
        return infoString
    }
}
