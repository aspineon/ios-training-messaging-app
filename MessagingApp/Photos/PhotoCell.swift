//
//  PhotoCell.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 04/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    
    func update(image: UIImage) {
        photoImage.image = image
    }
    
}
