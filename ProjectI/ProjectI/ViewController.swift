//
//  ViewController.swift
//  ProjectI
//
//  Created by 장선영 on 2021/08/25.
//

import UIKit
import AZSClient

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollV: UIScrollView!
    var btnA: UIButton!
    var value = 0
    let imgName: [String] = ["bts","bts1","bts2","bts3","bts4"]
    var imgVArr = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollV = UIScrollView(frame: CGRect(x: 50, y: 100, width: 300, height: 150))
        self.scrollV.showsHorizontalScrollIndicator = true
        self.scrollV.showsVerticalScrollIndicator = true
        self.scrollV.isScrollEnabled = true
        self.scrollV.isPagingEnabled = true
        self.scrollV.bounces = true
        self.scrollV.contentSize = CGSize(width: 2000, height: 200)
        self.scrollV.delegate = self
        self.view.addSubview(self.scrollV)
        
        for i in 0..<imgName.count {
            let imgV = UIImageView(frame: CGRect(x: 300*i, y: 0, width: 300, height: 150))
            imgV.image = UIImage(named: imgName[i])
            imgVArr.append(imgV)
            self.scrollV.addSubview(imgV)
        }
        
        self.btnA = UIButton(frame: CGRect(x: 50, y: 500, width: (self.view.bounds.width)-100, height: 50))
        self.btnA.addTarget(self, action: #selector(self.uploadIMG), for: UIControl.Event.touchUpInside)
        self.btnA.backgroundColor = .brown
        self.btnA.setTitle("Upload", for: UIControl.State.normal)
        self.view.addSubview(self.btnA)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        print(scrollView.contentOffset.x/300)
         value = Int(scrollView.contentOffset.x / 300)
    }
    
    
    @objc func uploadIMG() {
        let account: AZSCloudStorageAccount = try! AZSCloudStorageAccount(fromConnectionString: "DefaultEndpointsProtocol=https;AccountName=seonyoungsto;AccountKey=Nof9gevDCnpOdQSdqB3jiddfOuRWMzlgsXid3uJP9SZZZJAlfpKKaUgpOMzBkvk9MpU8BpvZ7xlFqr159e3N7A==;EndpointSuffix=core.windows.net")
        
        let blobClient: AZSCloudBlobClient = account.getBlobClient()
        let blobContainer: AZSCloudBlobContainer = blobClient.containerReference(fromName: "imgcon")
        let blockBlob: AZSCloudBlockBlob = blobContainer.blockBlobReference(fromName: imgName[value] + ".jpg")
        
        let imgData = self.imgVArr[value].image!.jpegData(compressionQuality: 1)
        blockBlob.upload(from: imgData!) { errorA in
            print("OK")
        }
    }

}

