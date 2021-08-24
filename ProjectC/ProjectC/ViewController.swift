//
//  ViewController.swift
//  ProjectC
//
//  Created by 장선영 on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segA: UISegmentedControl!
    @IBOutlet weak var stepA: UIStepper!
    @IBOutlet weak var act: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.stepA.minimumValue = 0
        self.stepA.maximumValue = 30
    }
    
    @IBAction func segFunc(_ sender: UISegmentedControl) {
//        print(sender.selectedSegmentIndex)
        print(self.segA.selectedSegmentIndex)
        if self.segA.selectedSegmentIndex == 0 {
            self.act.isHidden = true
            self.act.stopAnimating()
        } else {
            self.act.isHidden = false
            self.act.startAnimating()
        }
    }
    
    @IBAction func stepFunc(_ sender: UIStepper) {
        print(sender.value)
        
    }
    
    
}

