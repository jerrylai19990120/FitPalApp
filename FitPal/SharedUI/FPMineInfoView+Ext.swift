//
//  FPMineInfoView+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-30.
//

import Foundation
import UIKit

extension FPMineInfoView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 18, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: (self.collectionView?.frame.width)!, height: (self.collectionView?.frame.height)! * 0.2)
        } else if indexPath.section == 1 {
            return CGSize(width: (self.collectionView?.frame.width)!, height: (self.collectionView?.frame.height)! * 0.36)
        } else if indexPath.section == 2 {
            return CGSize(width: (self.collectionView?.frame.width)!, height: 150)
        }
        return CGSize(width: (self.collectionView?.frame.width)!, height: (self.collectionView?.frame.height)! * 0.5)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as? FPProfileCell {
                cell.contentView.isUserInteractionEnabled = false
                return cell
            } else {
                return UICollectionViewCell()
            }
        } else if indexPath.section == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeeklyStatusCell", for: indexPath) as? FPWeeklyStatusCell {
                return cell
            } else {
                return UICollectionViewCell()
            }
        } else if indexPath.section == 2 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatusCell", for: indexPath) as? FPStatusCell {
                cell.contentView.isUserInteractionEnabled = false
                return cell
            } else {
                return UICollectionViewCell()
            }
        }
        return UICollectionViewCell()
    }
    
}
