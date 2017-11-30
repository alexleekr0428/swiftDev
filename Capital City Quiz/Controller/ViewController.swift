//
//  ViewController.swift
//  Capital City Quiz
//
//  Created by Jae Guk Lee on 11/25/17.
//  Copyright © 2017 Jae Guk Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Making the button shape rounder
        startButton.layer.cornerRadius = 20
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

}

