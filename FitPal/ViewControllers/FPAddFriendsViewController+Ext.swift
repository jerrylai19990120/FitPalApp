//
//  FPAddFriendsViewController+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-30.
//

import Foundation
import UIKit

extension FPAddFriendsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
