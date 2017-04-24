//
//  ViewController.swift
//  alextest
//
//  Created by 王君傑 on 2017/4/1.
//  Copyright © 2017年 王君傑. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var str: String? = nil
    @IBOutlet weak var label_test1: UILabel!
   
    @IBAction func myButton(_ sender: Any) {
        
    }
  
    @IBOutlet weak var myName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print ("abc")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

