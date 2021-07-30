//
//  FPStatisticsViewController+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-29.
//

import Foundation
import UIKit

extension FPStatisticsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FPHeaderCollectionView.identifier, for: indexPath) as? FPHeaderCollectionView {
            switch indexPath.section {
            case 0:
                headerView.configureTitle(title: "ACTIVITY")
                break
            case 1:
                headerView.configureTitle(title: "YEAR-TO-DATE")
                break
            case 2:
                headerView.configureTitle(title: "ALL TIME")
                break
            default:
                fatalError("Error has occurred")
            }
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: 45 * 3)
        } else if indexPath.section == 1 {
            return CGSize(width: collectionView.frame.width, height: 45 * 3)
        } else if indexPath.section == 2 {
            return CGSize(width: collectionView.frame.width, height: 45 * 2)
        }
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.2)
    }
    
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
