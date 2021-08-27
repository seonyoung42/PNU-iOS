//
//  ViewController.swift
//  Project0826
//
//  Created by 장선영 on 2021/08/26.
//

import UIKit

class ViewController: UIViewController {
    
    var btnA : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.btnA = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
//        self.btnA.addTarget(self, action: #selector(uploadJSON), for: UIControl.Event.touchUpInside)
        self.btnA.addTarget(self, action: #selector(pushVC), for: UIControl.Event.touchUpInside)
        self.btnA.backgroundColor = .blue
        self.btnA.setTitle("Upload", for: UIControl.State.normal)
        self.view.addSubview(self.btnA)
    }
    
    @objc func pushVC() {
        let vc = SecondViewC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func uploadJSON() {
        
        let jsonOBJ: [String: Any] = [
            "temp": Int.random(in:0...100),
            "humi": Double.random(in: 0.0...100.0)
        ] as Dictionary
        
        let jsonData = try! JSONSerialization.data(withJSONObject: jsonOBJ, options: .prettyPrinted)
        
        let urlA = URL(string: "https://centum.azurewebsites.net/api/UploadJSON?code=JVJpMmQmlsWrWz/ggPvL7VbDSAv9WerV513xv7xWdfSKx2sLI3Jyfg==")
        
        var reqA = URLRequest(url: urlA!)
        reqA.httpMethod = "POST"
        reqA.httpBody = jsonData
        reqA.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: reqA) { (dataA, respA, errA) in
            
        }
        task.resume()
    }
    
    

}

