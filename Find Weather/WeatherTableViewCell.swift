//
//  WeatherTableViewCell.swift
//  Find Weather
//
//  Created by Digi Developer on 07/04/2020.
//  Copyright © 2020 Jassim. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var maxTemprature: UILabel!
    @IBOutlet weak var minTemprature: UILabel!
    
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
