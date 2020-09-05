//
//  DetailView.swift
//  ClosureTableViewDay1
//
//  Created by Boss on 9/5/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class DetailView: UIView {
    @IBOutlet weak var strCategoryLabel: UILabel!
    @IBOutlet weak var strInstructionsLabel: UILabel!
    @IBOutlet weak var strDrinkThumbLabel: UILabel!
    
    
    var infoCoktail = CocktailModel()
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillData() {
        strCategoryLabel.text = infoCoktail.strCategory
        strInstructionsLabel.text = infoCoktail.strInstructions
        strDrinkThumbLabel.text = infoCoktail.strDrinkThumb
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
