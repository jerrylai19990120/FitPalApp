//
//  FPStatisticsViewController+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-29.
//

import Foundation
import UIKit

extension FPStatisticsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvgStatCell", for: indexPath) as? FPAvgStatCell {
                return cell
            } else {
                return UICollectionViewCell()
            }
        } else if indexPath.section == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YearlyStatCell", for: indexPath) as? FPYearlyStatCell {
                return cell
            } else {
                return UICollectionViewCell()
            }
        } else if indexPath.section == 2 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllTimeStatCell", for: indexPath) as? FPAllTimeStatCell {
                return cell
            } else {
                return UICollectionViewCell()
            }
        }
        return UICollectionViewCell()
    }
    
    
}
