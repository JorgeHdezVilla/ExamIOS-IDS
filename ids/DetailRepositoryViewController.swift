//
//  DetailRepositoryViewController.swift
//  ids
//
//  Created by Lennken Group on 11/23/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class DetailRepositoryViewController: UIViewController {
    
    var repository : Repository!
    @IBOutlet weak var mTitleLabel: UILabel!
    @IBOutlet weak var mUsernameLabel: UILabel!
    @IBOutlet weak var mDescriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        mTitleLabel.text = repository.name
        mUsernameLabel.text = repository.username
        mDescriptionLabel.text = repository.descrip
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
