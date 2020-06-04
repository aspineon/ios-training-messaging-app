//
//  PhotosViewController.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 04/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import UIKit

class PhotosViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellSpacing: CGFloat = 2
    let columns: CGFloat = 4
    
    var cellSize: CGFloat = .zero
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.update(image: UIImage(named: "profile")!)
        getImage(at: indexPath)
        return cell
    }
    
    func getImage(at indexPath: IndexPath) {
        loadImage(from: "https://picsum.photos/200") { image in
            if let cell = self.collectionView.cellForItem(at: indexPath) as? PhotoCell {
                cell.update(image: image)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if cellSize == .zero {
            let layout = collectionViewLayout as! UICollectionViewFlowLayout
            let emptySpace = layout.sectionInset.left + layout.sectionInset.right + (columns * cellSpacing - 1)
            cellSize = (view.frame.size.width - emptySpace) / columns
        }
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        cellSpacing
    }
    
}
