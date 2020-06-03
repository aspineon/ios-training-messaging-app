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
    let messageCellIdentifier = "messageCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(LeftMessageTableViewCell.self, forCellReuseIdentifier: messageCellIdentifier)
        title = "Messages"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: messageCellIdentifier) as! LeftMessageTableViewCell
        cell.update(message: messages[indexPath.row])
        return cell
    }

}
