//
//  drinkTableViewCell.swift
//  orderDrink
//
//  Created by 王君傑 on 2017/6/4.
//  Copyright © 2017年 王君傑. All rights reserved.
//

import UIKit

class drinkTableViewCell: UITableViewCell {
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var drinkPriceLabel: UILabel!
    @IBOutlet weak var addDrinkBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
