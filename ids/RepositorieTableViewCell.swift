//
//  RepositorieTableViewCell.swift
//  ids
//
//  Created by Lennken Group on 11/23/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class RepositorieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mNameRepositorieLabel: UILabel!
    @IBOutlet weak var mNameAutorLabel: UILabel!
    @IBOutlet weak var mDescriptionLabel: UILabel!
    
    var repository : Repository!
    var repositoryDataSourceDelegate  : RepositoryDataSourceDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
