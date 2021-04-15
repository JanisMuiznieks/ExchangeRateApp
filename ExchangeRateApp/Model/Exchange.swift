//
//  Exchange.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 13/04/2021.
//

import UIKit
import Gloss

class ExchangeItem: JSONDecodable{
    var image: UIImage?
    var type: String
    var desciption: String
    
    required init?(json: JSON) {
        self.type = "type" <~~ json ?? ""
        self.desciption = "description" <~~ json ?? ""
    }
}
