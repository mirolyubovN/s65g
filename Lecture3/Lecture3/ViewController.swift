//
//  ViewController.swift
//  Lecture3
//
//  Created by Nikita Mirolyubov on 27.06.16.
//  Copyright © 2016 MacBookPro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonClick(sender: AnyObject) {
        textView.text = "We were clicked"
    
        
    }
    
    @IBOutlet weak var textView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

