//
//  RightMessageTableViewCell.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 03/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import UIKit

class RightMessageTableViewCell: MessageTableViewCell {
    
    private let bubbleImageName = "green-bubble"
    
    override func configureLayout() {
        super.configureLayout()
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: bubbleImage.topAnchor, constant: -10),
            contentView.trailingAnchor.constraint(equalTo: bubbleImage.trailingAnchor, constant: 20),
            contentView.bottomAnchor.constraint(equalTo: bubbleImage.bottomAnchor, constant: 10),
            contentView.leadingAnchor.constraint(equalTo: bubbleImage.leadingAnchor, constant: -100),
            
            bubbleImage.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -5),
            bubbleImage.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 20),
            bubbleImage.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 5),
            bubbleImage.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -10)
        ])
        
        let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        let image = UIImage(named: bubbleImageName)!
        image.imageFlippedForRightToLeftLayoutDirection()
        bubbleImage.image = image.resizableImage(withCapInsets: insets, resizingMode: .stretch)
    }

}
