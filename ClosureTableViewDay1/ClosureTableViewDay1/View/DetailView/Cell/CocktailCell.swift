//
//  CocktailCell.swift
//  ClosureTableViewDay1
//
//  Created by Boss on 9/5/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class CocktailCell: UITableViewCell {
    @IBOutlet weak var strCategoryLabel: UILabel!
    @IBOutlet weak var strDrinkThumbLabel: UILabel!
    @IBOutlet weak var strInstructionsLabel: UILabel!
    
    var infoCocktail = CocktailModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func fillData() {
        strCategoryLabel.text = infoCocktail.strCategory
        strDrinkThumbLabel.text = infoCocktail.strDrinkThumb
        strInstructionsLabel.text = infoCocktail.strInstructions
    }
    static func identifier() -> String {
          return "CocktailCell"
      }
}
