//
//  ViewController.swift
//  ProjectH
//
//  Created by 장선영 on 2021/08/25.
//

import UIKit
import AZSClient

class ViewController: UIViewController {
    
    var imgV: UIImageView!
    var btnA: UIButton!
    var btnB: UIButton!
    
    var imagArr = [UIImage]()
    var imagName = [String]()
    var imageCount = 0
//    {
//        didSet {
//            DispatchQueue.main.async {
//                self.imgV.image = self.imagArr[self.imageCount]
//            }
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagName = ["03750020.JPG","03750026.JPG","03750027.JPG","03750028.JPG","03750037.JPG"]
        
        imagName.forEach {
            imagArr.append(UIImage(named: $0)!)
        }
        
        self.imgV = UIImageView(frame: CGRect(x: 50, y: 50, width: (self.view.bounds.width)-100, height: (self.view.bounds.height)-500))
//        self.imgV.image = UIImage(named: "03750020")
        self.imgV.image = imagArr[imageCount]
        self.imgV.layer.cornerRadius = 10 // > 이미지 테두리 둥글게
        self.imgV.clipsToBounds = true  // > 이걸 해야 테두리 둥글게가 보임
        self.imgV.layer.borderWidth = 2.0
        self.imgV.layer.borderColor = UIColor.red.cgColor
        self.view.addSubview(self.imgV)
        
        self.btnA = UIButton(frame: CGRect(x: 50, y: 500, width: (self.view.bounds.width)-100, height: 50))
        self.btnA.addTarget(self, action: #selector(self.uploadIMG), for: UIControl.Event.touchUpInside)
        self.btnA.backgroundColor = .brown
        self.btnA.setTitle("Upload", for: UIControl.State.normal)
        self.view.addSubview(self.btnA)
        
        self.btnB = UIButton(frame: CGRect(x: 50, y: 600, width: (self.view.bounds.width)-100, height: 50))
        self.btnB.addTarget(self, action: #selector(self.downloadIMG), for: UIControl.Event.touchUpInside)
        self.btnB.backgroundColor = .gray
        self.btnB.setTitle("Dwonload", for: UIControl.State.normal)
        self.view.addSubview(self.btnB)
        
        
    
//        imagArr.append(UIImage(named: "03750020.JPG")!)
//        imagArr.append(UIImage(named: "03750026.JPG")!)
//        imagArr.append(UIImage(named: "03750027.JPG")!)
//        imagArr.append(UIImage(named: "03750028.JPG")!)
//        imagArr.append(UIImage(named: "03750037.JPG")!)

    }
    
    @objc func uploadIMG() {
        let account: AZSCloudStorageAccount = try! AZSCloudStorageAccount(fromConnectionString: "DefaultEndpointsProtocol=https;AccountName=seonyoungsto;AccountKey=16F0hD392SntRjUUJsZPw479bKNeQ7ibZg/YGj7WSe9f97D/9ja6qKjGuIzPmKJb9KKaaOchoo5hTDe3GubYzw==;EndpointSuffix=core.windows.net")
    
        
//        let cred: AZSStorageCredentials = AZSStorageCredentials(accountName: "seonyoungsto", accountKey: <#T##String#>)
        
        let blobClient: AZSCloudBlobClient = account.getBlobClient()
        let blobContainer: AZSCloudBlobContainer = blobClient.containerReference(fromName: "imgcon")
        let blockBlob: AZSCloudBlockBlob = blobContainer.blockBlobReference(fromName: imagName[imageCount])
//        let blockBlob: AZSCloudBlob = blobContainer.blockBlobReference(fromName: self.imgV.image)
        
        let imgData = self.imgV.image!.pngData()
        
        blockBlob.upload(from: imgData!) { errorA in
            DispatchQueue.main.async {
                self.imageCount += 1
                self.imgV.image = self.imagArr[self.imageCount]
            }
            print("OK")
//            self.imageCount += 1
        }
    }
    
    
    @objc func downloadIMG() {
        let account: AZSCloudStorageAccount = try! AZSCloudStorageAccount(fromConnectionString: "DefaultEndpointsProtocol=https;AccountName=seonyoungsto;AccountKey=16F0hD392SntRjUUJsZPw479bKNeQ7ibZg/YGj7WSe9f97D/9ja6qKjGuIzPmKJb9KKaaOchoo5hTDe3GubYzw==;EndpointSuffix=core.windows.net")
        
//        let cred: AZSStorageCredentials = AZSStorageCredentials(accountName: "seonyoungsto", accountKey: <#T##String#>)
        
        let blobClient: AZSCloudBlobClient = account.getBlobClient()
        let blobContainer: AZSCloudBlobContainer = blobClient.containerReference(fromName: "imgcon")
        let blockBlob: AZSCloudBlockBlob = blobContainer.blockBlobReference(fromName: "03750033.JPG")
                
        blockBlob.downloadToData { err, dataA in
            let imgB: UIImage = UIImage(data: dataA!)!
            DispatchQueue.main.async() {
                self.imgV.image = imgB
//                self.imagArr.append(imgB)
            }
        }
    }
}

