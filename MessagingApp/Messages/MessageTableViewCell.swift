//
//  MessageTableViewCell.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 03/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    private func configure() {
        contentView.addSubview(bubbleImage())
        contentView.addSubview(messageLabel())
    }
    
    private func bubbleImage() -> UIImageView {
        let bubbleImage = UIImageView(frame: .zero)
        bubbleImage.contentMode = .scaleToFill
        bubbleImage.translatesAutoresizingMaskIntoConstraints = false
        return bubbleImage
    }
    
    private func messageLabel() -> UILabel {
        let messageLabel = UILabel(frame: .zero)
        messageLabel.textColor = .white
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }

}
