//
//  Global.swift
//  MessagingApp
//
//  Created by Łukasz Andrzejewski on 04/06/2020.
//  Copyright © 2020 Inbright Łukasz Andrzejewski. All rights reserved.
//

import UIKit

func loadImage(from url: String,  callback: @escaping (UIImage) -> Void) {
    DispatchQueue.global(qos: .utility).async {
        guard let url = URL(string: url), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
            return
        }
        DispatchQueue.main.async {
            callback(image)
        }
    }
}
