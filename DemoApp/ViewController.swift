//
//  ViewController.swift
//  DemoApp
//
//  Created by Steven Thompson on 2018-01-11.
//  Copyright © 2018 airg. All rights reserved.
//

import UIKit
import airUtilities

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    internal override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Log("Hi", as: .error, category: "CoolFlow")
        Log("H2", as: .error, category: "CoolFlow")
        Log("H3", as: .error, category: "BadFlow")
        Log("H4", as: .error, category: "BadFlow")
        Log("H5", as: .error, category: "CoolFlow")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

