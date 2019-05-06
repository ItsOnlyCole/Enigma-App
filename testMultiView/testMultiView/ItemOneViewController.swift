//
//  ItemOneViewController.swift
//  testMultiView
//
//  Created by user153545 on 5/5/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

import UIKit

class ItemOneViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    var counter: Counter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = Counter()
        let itemTwoViewController = self.tabBarController?.viewControllers?[1] as! ItemTwoViewController
        itemTwoViewController.counter = counter
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        counterLabel.text = String(counter.getCount())
    }
    
    
    @IBAction func updateCounter(_ sender: UIButton) {
        counter.updateCount()
        counterLabel.text = String(counter.getCount())
    }
    
    
    
    
    
    

    

}
