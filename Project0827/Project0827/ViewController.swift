//
//  ViewController.swift
//  Project0827
//
//  Created by 장선영 on 2021/08/27.
//

import UIKit

class ViewController: UIViewController {
    
    var btnA: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.btnA = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        self.btnA.backgroundColor = .green
        self.btnA.translatesAutoresizingMaskIntoConstraints = false
        self.btnA.setTitle("Push", for: UIControl.State.normal)
        self.btnA.addTarget(self, action: #selector(pushVC), for: UIControl.Event.touchUpInside)
        self.view.addSubview(self.btnA)
        
        let conA : NSLayoutConstraint = NSLayoutConstraint(item: self.btnA, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: -100)
        
        let conB : NSLayoutConstraint = NSLayoutConstraint(item: self.btnA, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: 200)
        
        self.view.addConstraint(conA)
        self.view.addConstraint(conB)
        
    }
    
    @objc func pushVC() {
        let sv = SecondVC()
        self.navigationController?.pushViewController(sv, animated: true)
    }


}

