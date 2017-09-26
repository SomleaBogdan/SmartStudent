//
//  SMSTHomeViewController.swift
//  SmartStudent
//
//  Created by Somlea Felix-Bogdan on 9/26/17.
//  Copyright © 2017 Somlea Felix-Bogdan. All rights reserved.
//

import UIKit

class SMSTHomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var tvcUndeIesim: UITableViewCell!
    @IBOutlet var tvcTeatrulNational: UITableViewCell!
    @IBOutlet var tvcCinemaArta: UITableViewCell!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 150.0
    }
}

extension SMSTHomeViewController: UITableViewDelegate {

}

extension SMSTHomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return self.tvcCinemaArta
        } else if indexPath.row == 1 {
            return self.tvcTeatrulNational
        } else if indexPath.row == 2 {
            return self.tvcUndeIesim
        }
        return UITableViewCell()
    }
}
