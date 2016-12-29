//
//  BluetoothTableViewCell.swift
//  tooth_test
//
//  Created by Ajinkya Peshave on 12/29/16.
//  Copyright © 2016 Ajinkya Peshave. All rights reserved.
//

import UIKit

class BluetoothTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_deviceName: UILabel!
    @IBOutlet weak var lbl_deviceInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
