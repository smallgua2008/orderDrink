//
//  ViewController.swift
//  homework6
//
//  Created by 王君傑 on 2017/5/15.
//  Copyright © 2017年 王君傑. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func loadView() {
        super.loadView()
    }
 
    @IBAction func showMovie3(_ sender: Any) {
        let controller =
            self.storyboard?.instantiateViewController(withIdentifier: "showMovieView") as? movieViewController
        controller?.name = "hahaha"
        self.present(controller!, animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

