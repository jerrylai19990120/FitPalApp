//
//  FPEditProfileViewController+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-06.
//

import Foundation
import UIKit

extension FPEditProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FPBioCell.identifier, for: indexPath) as? FPBioCell {
            cell.contentView.isUserInteractionEnabled = false
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FPHeaderCollectionView.identifier, for: indexPath) as? FPHeaderCollectionView {
                if indexPath.section == 0 {
                    header.configureTitle(title: "")
                } else {
                    header.configureTitle(title: "Used to calculate calories, power and more.")
                }
                return header
            }
            return UICollectionReusableView()
        } else if kind == UICollectionView.elementKindSectionHeader {
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FPHeaderCollectionView.identifier, for: indexPath) as? FPHeaderCollectionView {
                if indexPath.section == 0 {
                    header.configureTitle(title: "")
                } else {
                    header.configureTitle(title: "ATHLETE INFORMATION")
                }
                return header
            }
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
}
