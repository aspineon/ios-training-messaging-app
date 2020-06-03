//
//  MessagesViewController.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 03/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import UIKit

class MessagesViewController: UITableViewController {
    
    let messages = [
        Message(text: "Xcode is great!kajdskf hsdjkhfsdkjfhsd kjhfkjsdhfkjsdh sdklfklsdjflksdj sldkflskdjflkj sdlkfsldkfjldsk", sentByMe: false),
        Message(text: "No way!", sentByMe: true),
        Message(text: "Yes it is", sentByMe: false),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Messages"
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(LeftMessageTableViewCell.self, forCellReuseIdentifier: MessageCellType.left.rawValue)
        tableView.register(RightMessageTableViewCell.self, forCellReuseIdentifier: MessageCellType.right.rawValue)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        var cell: MessageTableViewCell
        if message.sentByMe {
            cell = tableView.dequeueReusableCell(withIdentifier: MessageCellType.left.rawValue) as! LeftMessageTableViewCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: MessageCellType.right.rawValue) as! RightMessageTableViewCell
        }
        cell.update(message: message)
        return cell
    }

}
