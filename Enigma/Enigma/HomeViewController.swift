//
//  HomeViewController.swift
//  Enigma
//
//  Created by user153545 on 5/6/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var encodedMessageLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    
    
    var enigmaModelController: EnigmaModelController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enigmaModelController = EnigmaModelController()
        dependencyInjectEnigmaModelController(enigmaModelController: enigmaModelController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
    }
    
    func dependencyInjectEnigmaModelController (enigmaModelController: EnigmaModelController) {
        //Sets up dependency injections for the enigmaModelController in to the other views.
        //This allows me to use one object to manipulate/display data across multiple views.
        let plugBoardViewController = self.tabBarController?.viewControllers?[1] as! PlugboardViewController
        //plugBoardViewController.enigmaModelController = enigmaModelController
        let navigationController = self.tabBarController?.viewControllers?[2] as! UINavigationController
        let rotorsViewController = navigationController.viewControllers[0] as! RotorsViewController
        rotorsViewController.enigmaModelController = enigmaModelController
        //let rotorSelectionViewController = self.storyboard!.instantiateViewController(withIdentifier: "RotorSelectionViewController") as! RotorSelectionViewController
        //rotorSelectionViewController.enigmaModelController = enigmaModelController
    }
    
    
    @IBAction func encodeMessageButtonPress(_ sender: UIButton) {
        if(messageTextField == nil)
        {
            //Exits the Function if no text in textField
            return
        }
        enigmaModelController.prepMessage(message: messageTextField.text!)
        encodedMessageLabel.text = enigmaModelController.encodeMessage()
        encodedMessageLabel.isHidden = false
    }
    
    
    

}
