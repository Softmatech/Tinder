//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Joseph Andy Feidje on 11/6/18.
//  Copyright © 2018 Softmatech. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    var imageValue: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = imageValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func BackToCard(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "BackToSegue", sender: self)
    }
    
}
