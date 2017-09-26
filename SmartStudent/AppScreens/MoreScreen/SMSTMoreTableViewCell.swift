//
//  SMSTMoreTableViewCell.swift
//  SmartStudent
//
//  Created by Somlea Felix-Bogdan on 9/26/17.
//  Copyright © 2017 Somlea Felix-Bogdan. All rights reserved.
//

import UIKit

class SMSTMoreTableViewCell: UITableViewCell {

    @IBOutlet weak var ivOption: UIImageView!
    @IBOutlet weak var lblOptionName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func addToCell(data: [String: Any]) {
        self.lblOptionName.text = data["title"] as? String
        self.ivOption.image = UIImage(named: (data["image_name"] as? String)!)
    }
    
}
