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
    var imagArr: [UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgV = UIImageView(frame: CGRect(x: 50, y: 50, width: (self.view.bounds.width)-100, height: (self.view.bounds.height)-500))
        self.imgV.image = UIImage(named: "Group 37")
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
        
        
    }
    
    @objc func uploadIMG() {
        let account: AZSCloudStorageAccount = try! AZSCloudStorageAccount(fromConnectionString: "DefaultEndpointsProtocol=https;AccountName=seonyoungsto;AccountKey=Nof9gevDCnpOdQSdqB3jiddfOuRWMzlgsXid3uJP9SZZZJAlfpKKaUgpOMzBkvk9MpU8BpvZ7xlFqr159e3N7A==;EndpointSuffix=core.windows.net")
        
//        let cred: AZSStorageCredentials = AZSStorageCredentials(accountName: "seonyoungsto", accountKey: <#T##String#>)
        
        let blobClient: AZSCloudBlobClient = account.getBlobClient()
        let blobContainer: AZSCloudBlobContainer = blobClient.containerReference(fromName: "imgcon")
        let blockBlob: AZSCloudBlockBlob = blobContainer.blockBlobReference(fromName: "Group 37.png")
        
        let imgData = self.imgV.image!.pngData()
        blockBlob.upload(from: imgData!) { errorA in
            print("OK")
        }
    }
    
    @objc func downloadIMG() {
        let account: AZSCloudStorageAccount = try! AZSCloudStorageAccount(fromConnectionString: "DefaultEndpointsProtocol=https;AccountName=seonyoungsto;AccountKey=Nof9gevDCnpOdQSdqB3jiddfOuRWMzlgsXid3uJP9SZZZJAlfpKKaUgpOMzBkvk9MpU8BpvZ7xlFqr159e3N7A==;EndpointSuffix=core.windows.net")
        
//        let cred: AZSStorageCredentials = AZSStorageCredentials(accountName: "seonyoungsto", accountKey: <#T##String#>)
        
        let blobClient: AZSCloudBlobClient = account.getBlobClient()
        let blobContainer: AZSCloudBlobContainer = blobClient.containerReference(fromName: "imgcon")
        let blockBlob: AZSCloudBlockBlob = blobContainer.blockBlobReference(fromName: "bts.jpg")
                
        blockBlob.downloadToData { err, dataA in
            let imgB: UIImage = UIImage(data: dataA!)!
            DispatchQueue.main.async() {
                self.imgV.image = imgB
                self.imagArr.append(imgB)
            }
        }
    }
}

