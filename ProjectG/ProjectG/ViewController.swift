//
//  ViewController.swift
//  ProjectG
//
//  Created by 장선영 on 2021/08/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let myDic = ["aaa":["a000","a111","a222","a333","a444"], "bbb":["b000","b111"], "ccc":["c000","c111","c222"] ]
    
    var keys : Array<String>!
    var pickerV: UIPickerView!
    var key: String = "aaa"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.keys = self.myDic.keys.sorted()
        
        self.pickerV = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height/3))
        self.pickerV.dataSource = self
        self.pickerV.delegate = self
        self.view.addSubview(self.pickerV)
        
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return self.keys.count
        } else {
            return self.myDic[key]!.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            self.key = self.keys[row]
            self.pickerV.reloadComponent(1)
            return self.key
        } else {
            return self.myDic[key]![row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            print(self.key)
        } else {
            print(self.myDic[key]![row])
        }
    }
}

