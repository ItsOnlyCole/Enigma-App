//
//  PlugboardViewController.swift
//  Enigma
//
//  Created by user153545 on 5/6/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

import UIKit

class PlugboardViewController: UIViewController {
    //Plug #1
    @IBOutlet weak var textFieldA1: UITextField!
    @IBOutlet weak var textFieldB1: UITextField!
    //Plug #2
    @IBOutlet weak var textFieldA2: UITextField!
    @IBOutlet weak var textFieldB2: UITextField!
    //Plug #3
    @IBOutlet weak var textFieldA3: UITextField!
    @IBOutlet weak var textFieldB3: UITextField!
    //Plug #4
    @IBOutlet weak var textFieldA4: UITextField!
    @IBOutlet weak var textFieldB4: UITextField!
    //Plug #5
    @IBOutlet weak var textFieldA5: UITextField!
    @IBOutlet weak var textFieldB5: UITextField!
    //Plug #6
    @IBOutlet weak var textFieldA6: UITextField!
    @IBOutlet weak var textFieldB6: UITextField!
    //Plug #7
    @IBOutlet weak var textFieldA7: UITextField!
    @IBOutlet weak var textFieldB7: UITextField!
    //Plug #8
    @IBOutlet weak var textFieldA8: UITextField!
    @IBOutlet weak var textFieldB8: UITextField!
    //Plug #9
    @IBOutlet weak var textFieldA9: UITextField!
    @IBOutlet weak var textFieldB9: UITextField!
    //Plug #10
    @IBOutlet weak var textFieldA10: UITextField!
    @IBOutlet weak var textFieldB10: UITextField!
    
    
    var enigmaModelController: EnigmaModelController!
    var aPlugs = [String] ()
    var bPlugs = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Was short on time, instead of checking which plugs were active and which weren't
        //All plugs are cleared when you come to PlugBoardViewController.
        //enigmaModelController.clearPlugs()
        //clearPlugArrays()
    }

    @IBAction func setPlugsButtonClick(_ sender: UIButton) {
        setPlugArrays()
        for i in 0...aPlugs.count - 1
        {
            enigmaModelController.addPlug(charOne: enigmaModelController.convertToInt(char: Character(aPlugs[i])), charTwo: enigmaModelController.convertToInt(char: Character(bPlugs[i])))
        }
    }
    
    func setPlugArrays() {
        aPlugs.append(textFieldA1.text!)
        aPlugs.append(textFieldA2.text!)
        aPlugs.append(textFieldA3.text!)
        aPlugs.append(textFieldA4.text!)
        aPlugs.append(textFieldA5.text!)
        aPlugs.append(textFieldA6.text!)
        aPlugs.append(textFieldA7.text!)
        aPlugs.append(textFieldA8.text!)
        aPlugs.append(textFieldA9.text!)
        aPlugs.append(textFieldA10.text!)
        bPlugs.append(textFieldB1.text!)
        bPlugs.append(textFieldB2.text!)
        bPlugs.append(textFieldB3.text!)
        bPlugs.append(textFieldB4.text!)
        bPlugs.append(textFieldB5.text!)
        bPlugs.append(textFieldB6.text!)
        bPlugs.append(textFieldB7.text!)
        bPlugs.append(textFieldB8.text!)
        bPlugs.append(textFieldB9.text!)
        bPlugs.append(textFieldB10.text!)
    }
    func clearPlugArrays() {
        aPlugs.removeAll()
        bPlugs.removeAll()
    }
} 
