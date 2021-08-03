//
//  FPSettingsViewController+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-30.
//

import Foundation
import UIKit

extension FPSettingsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FPHeaderCollectionView.identifier, for: indexPath) as? FPHeaderCollectionView {
            switch indexPath.section {
            case 0:
                headerView.configureTitle(title: "ACCOUNT SETTINGS")
                break
            case 1:
                headerView.configureTitle(title: "")
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
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 45 * 2)
        case 1:
            return CGSize(width: collectionView.frame.width, height: 45)
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.2)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FPSettingsCell.identifier, for: indexPath) as? FPSettingsCell {
                cell.contentView.isUserInteractionEnabled = false
                return cell
            } else {
                return UICollectionViewCell()
            }
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FPLogOutCell.identifier, for: indexPath) as? FPLogOutCell {
                return cell
            } else {
                return UICollectionViewCell()
            }
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            let mainVC = FPMainViewController()
            mainVC.modalPresentationStyle = .fullScreen
            self.present(mainVC, animated: true, completion: nil)
        }
    }
    
}
