//
//  CocktailModel.swift
//  ClosureTableViewDay1
//
//  Created by Boss on 9/5/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

struct BaseDataModel: Codable {
    var drinks: [CocktailModel]?
}
struct CocktailModel: Codable {
    var strCategory: String?
    var strInstructions: String?
    var strDrinkThumb: String?
}
