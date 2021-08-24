//
//  ViewController.swift
//  ProjectD
//
//  Created by 장선영 on 2021/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelA: UILabel!
    
    var labelB: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(runTapG(sender:)))
        self.view.addGestureRecognizer(tapG)
        
        let longG = UILongPressGestureRecognizer(target: self, action: #selector(runLongG(sender:)))
        self.view.addGestureRecognizer(longG)
        
        let panG = UIPanGestureRecognizer(target: self, action: #selector(runPanG(sender:)))
        self.view.addGestureRecognizer(panG)
        
        let swipeG = UISwipeGestureRecognizer(target: self, action: #selector(runSwipeG(sender:)))
        self.view.addGestureRecognizer(swipeG)
        
        let pinchG = UIPinchGestureRecognizer(target: self, action: #selector(runPinchG(sender:)))
        self.view.addGestureRecognizer(pinchG)
        
        let rotateG = UIRotationGestureRecognizer(target: self, action: #selector(runRotateG(sender:)))
        self.view.addGestureRecognizer(rotateG)
        

        
        self.labelA.backgroundColor = .blue
        self.labelA.textAlignment = .center
        
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesCancelled")
    }
    
    @objc func runTapG(sender: UITapGestureRecognizer) {
//        print("tap")
        self.labelA.backgroundColor = .red
        self.labelA.text = "Tap"
    }
    
    @objc func runLongG(sender: UILongPressGestureRecognizer) {
//        print("long")
        self.labelA.backgroundColor = .green
        self.labelA.text = "Long"
    }
    
    @objc func runPanG(sender: UIPanGestureRecognizer) {
//        print("pan")
//        print(sender.location(in: self.view))
        self.labelA.backgroundColor = .brown
        self.labelA.text = "Pan"
    }
    
    @objc func runSwipeG(sender: UISwipeGestureRecognizer) {
//        print("swipe")
        
    }
    
    @objc func runPinchG(sender: UIPinchGestureRecognizer) {
//        print("pinch")
    }
    
    @objc func runRotateG(sender: UIRotationGestureRecognizer) {
        print("rotate")
        self.labelA.backgroundColor = .gray
        self.labelA.text = "Rotate"
    }
}

