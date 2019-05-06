//
//  ItemTwoViewController.swift
//  testMultiView
//
//  Created by user153545 on 5/5/19.
//  Copyright © 2019 ItsOnlyCole. All rights reserved.
//

import UIKit

class ItemTwoViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    var counterAmt: Int!
    var counter: Counter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        counterAmt = counter.getCount()
        counterLabel.text = String(counterAmt)
    }

    @IBAction func resetCounter(_ sender: UIButton) {
        counter.resetCount()
        counterLabel.text = String(counter.getCount())
    }
}
