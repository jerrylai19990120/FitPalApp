//
//  MainViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-21.
//

import UIKit
import Masonry

class MainViewController: UIViewController {
    
    var collectionView: UICollectionView?
    var pageView: UIPageControl?
    var imageArr = [
        UIImage(named: "Login_Cardio"),
        UIImage(named: "Login_Gym"),
        UIImage(named: "Login_Swimming"),
        UIImage(named: "Login_Biking"),
    ]
    
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = DefaultWhite
        self.setUpSlidingPictures()
        
    }
    
    func setUpSlidingPictures() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView!.register(BackgroundCell.self, forCellWithReuseIdentifier: "BackgroundCell")
        collectionView!.backgroundColor = DefaultWhite
        collectionView!.delegate = self
        collectionView!.dataSource = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        self.view.addSubview(collectionView!)
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
        collectionView!.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.view)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(self.view.frame.height / 2)
        }
        
    }
    
    @objc func changeImage() {
        
        if counter < imageArr.count {
            self.collectionView?.scrollToItem(at: IndexPath(item: counter, section: self.collectionView!.numberOfSections - 1), at: .centeredHorizontally, animated: true)
            counter += 1
        } else {
            counter = 0
            self.collectionView?.scrollToItem(at: IndexPath(item: counter, section: self.collectionView!.numberOfSections - 1), at: .centeredHorizontally, animated: true)
            counter += 1
        }
    }
    
}

