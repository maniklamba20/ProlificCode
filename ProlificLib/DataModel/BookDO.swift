//
//  BookDO.swift
//  ProlificLib
//
//  Created by manik lamba on 02/03/18.
//  Copyright © 2018 manik lamba. All rights reserved.
//

import UIKit

struct BookDO :Decodable {
    var author:String?
    var title: String?
    var publisher: String?
    var categories: String?
    var lastCheckout: String?
    var lastCheckoutBy: String?
}
