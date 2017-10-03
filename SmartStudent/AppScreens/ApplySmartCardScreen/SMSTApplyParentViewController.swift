//
//  SMSTApplyParentViewController.swift
//  SmartStudent
//
//  Created by Somlea Felix-Bogdan on 10/3/17.
//  Copyright © 2017 Somlea Felix-Bogdan. All rights reserved.
//

import UIKit

class SMSTApplyParentViewController: UIViewController {

    @IBOutlet weak var formContentView: UIView!
    @IBOutlet weak var btnNext: UIButton!
    private var rootDataSource: [Any]? = nil
    private var currentIndex: Int = 0
    private var registerDataSource: [Any]? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnNext.imageView?.contentMode = .scaleAspectFit
        self.btnNext.layer.cornerRadius = 20

        self.registerDataSource = [
            [
                ["id":"nume", "title":"Nume *", "value":"", "type":"text"],
                ["id":"prenume", "title":"Prenume *", "value":"", "type":"text"],
                ["id":"cnp", "title":"CNP *", "value":"", "type":"numeric"],
                ["id":"birthdate", "title":"Data Nasterii *", "value":"", "type":"date"]
            ],
            [
                ["id":"telefon", "title":"Telefon *", "value":"", "type":"phone"],
                ["id":"email", "title":"Email *", "value":"", "type":"email"],
                ["id":"university", "title":"Universitate *", "value":"", "type":"dropdown"],
                ["id":"faculty", "title":"Facultate *", "value":"", "type":"dropdown"]
            ],
            [
                ["id":"country", "title":"Tara *", "value":"", "type":"dropdown"],
                ["id":"county", "title":"Judet *", "value":"", "type":"dropdown"],
                ["id":"localitatea", "title":"Localitate *", "value":"", "type":"text"],
                ["id":"strada", "title":"Strada *", "value":"", "type":"text"],
                ["id":"nr", "title":"Nr. *", "value":"", "type":"text"],
                ["id":"apartment", "title":"Apartament", "value":"", "type":"text"]
            ]
        ]
    }

    @IBAction func btnNext_Tapped(_ sender: Any) {

    }
}
