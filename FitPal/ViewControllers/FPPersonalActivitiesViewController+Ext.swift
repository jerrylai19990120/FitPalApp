//
//  FPPersonalActivitiesViewController+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-29.
//

import Foundation
import UIKit

extension FPPersonalActivitiesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
