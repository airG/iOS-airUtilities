//
//  CollectionView.swift
//  ME Chat
//
//  Created by Steven Thompson on 2017-03-07.
//  Copyright © 2017 airg. All rights reserved.
//

import UIKit

class SizingCollectionView: UICollectionView {
    override var intrinsicContentSize: CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
}
