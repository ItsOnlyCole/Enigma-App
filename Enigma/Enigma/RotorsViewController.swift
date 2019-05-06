//
//  RotorsViewController.swift
//  Enigma
//
//  Created by user153545 on 5/6/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

import UIKit

class RotorsViewController: UIViewController {
    @IBOutlet weak var rotorALabel: UILabel!
    @IBOutlet weak var rotorBLabel: UILabel!
    @IBOutlet weak var rotorCLabel: UILabel!
    @IBOutlet weak var rotorAPositionLabel: UILabel!
    @IBOutlet weak var rotorBPositionLabel: UILabel!
    @IBOutlet weak var rotorCPositionLabel: UILabel!
    
        
    var enigmaModelController: EnigmaModelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for i in 0...2
        {
            setRotorLabel(rotorNumber: enigmaModelController.getRotorNumber(rotorLocation: i), labelLocation: i)
            setRotorPositionLabel(rotorNumber: i, labelLocation: i)
        }
    }
    
    func setRotorLabel(rotorNumber: Int, labelLocation: Int) {
        var text: String = ""
        switch (rotorNumber) {
        case 1:
            text = "I"
            break
        case 2:
            text = "II"
            break
        case 3:
            text = "III"
            break
        case 4:
            text = "IV"
            break
        case 5:
            text = "V"
            break
        default:
            text = "ERROR"
            break
        }
        switch (labelLocation) {
        case 0:
            rotorALabel.text = text
            break
        case 1:
            rotorBLabel.text = text
            break
        case 2:
            rotorCLabel.text = text
            break
        default:
            break
        }
    }
    
    func setRotorPositionLabel(rotorNumber: Int, labelLocation: Int) {
        var position: String
        position = String(enigmaModelController.convertToChar(charIndex: enigmaModelController.getRotorPosition(rotorLocation: rotorNumber)))
        switch (labelLocation) {
        case 0:
            rotorAPositionLabel.text = position.uppercased()
            break
        case 1:
            rotorBPositionLabel.text = position.uppercased()
            break
        case 2:
            rotorCPositionLabel.text = position.uppercased()
            break
        default:
            break
        }
    }
    @IBAction func incrementRotorA(_ sender: Any) {
        enigmaModelController.setRotorPosition(rotorLocation: 0, increment: true)
        setRotorPositionLabel(rotorNumber: 0, labelLocation: 0)
    }
    @IBAction func decrementRotorA(_ sender: Any) {
        enigmaModelController.setRotorPosition(rotorLocation: 0, increment: false)
        setRotorPositionLabel(rotorNumber: 0, labelLocation: 0)
    }
    @IBAction func incrementRotorB(_ sender: Any) {
        enigmaModelController.setRotorPosition(rotorLocation: 1, increment: true)
        setRotorPositionLabel(rotorNumber: 1, labelLocation: 1)
    }
    @IBAction func decrementRotorB(_ sender: Any) {
        enigmaModelController.setRotorPosition(rotorLocation: 1, increment: false)
        setRotorPositionLabel(rotorNumber: 1, labelLocation: 1)
    }
    @IBAction func incrementRotorC(_ sender: Any) {
        enigmaModelController.setRotorPosition(rotorLocation: 2, increment: true)
        setRotorPositionLabel(rotorNumber: 2, labelLocation: 2)
    }
    @IBAction func decrementRotorC(_ sender: Any) {
        enigmaModelController.setRotorPosition(rotorLocation: 2, increment: false)
        setRotorPositionLabel(rotorNumber: 2, labelLocation: 2)
    }
    
    
}
