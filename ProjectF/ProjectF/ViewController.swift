//
//  ViewController.swift
//  ProjectF
//
//  Created by 장선영 on 2021/08/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableV: UITableView!
    let tableArray = ["aaa","bbb","ccc","ddd","eee"]
    let tableDic = ["aaa":["a000","a111","a222","a333","a444"], "bbb":["b000","b111"], "ccc":["c000","c111","c222"] ]
    
    var keys: Array<String>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.keys = tableDic.keys.sorted()
        
        self.tableV = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        self.tableV.register(UITableViewCell.self, forCellReuseIdentifier: "cellA")
        self.tableV.dataSource = self
        self.tableV.delegate = self
        self.view.addSubview(self.tableV)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return self.keys[section]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.tableArray.count
        let sec = self.keys[section]
        
        return self.tableDic[sec]!.count
        //return self.tableDic.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellA")
        
        //cell.textLabel?.text = tableArray[indexPath.row]
        
        let sec = self.keys[indexPath.section]
        cell.textLabel?.text = tableDic[sec]![indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(tableArray[indexPath.row])
//        print(tableDic[indexPath.row])
    }

}

