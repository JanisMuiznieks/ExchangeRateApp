//
//  ExchangeTableViewCell.swift
//  ExchangeRateApp
//
//  Created by janis.muiznieks on 13/04/2021.
//

import UIKit

class ExchangeTableViewCell: UITableViewCell {
    @IBOutlet weak var firstCurrencyLabel: UILabel!
    @IBOutlet weak var firstCurrencyNameLabel: UILabel!
    @IBOutlet weak var secondCurrencyLabel: UILabel!
    @IBOutlet weak var secondCurrencyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
