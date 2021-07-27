//
//  FPHomeActivitiesViewController+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-26.
//

import Foundation
import UIKit

extension FPHomeActivitiesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.66)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCell", for: indexPath) as? FPActivityCell else {
            return UICollectionViewCell()
        }
        cell.configureCell()
        return cell
    }
    
}
