//
//  SMSTApplySmartCardViewController.swift
//  SmartStudent
//
//  Created by Somlea Felix-Bogdan on 9/26/17.
//  Copyright © 2017 Somlea Felix-Bogdan. All rights reserved.
//

import UIKit
//Nume, prenume, cnp, data nasterii, telefon, email, universitate, facultate, tara, judet, localitate, strada, nr, apartament, imagine
class SMSTApplySmartCardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: [Any] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "SMSTFormTextfieldTableViewCell", bundle: nil), forCellReuseIdentifier: "textFieldCell")
        self.tableView.rowHeight = 44
    }

    public func createCellAt(index: IndexPath) -> UITableViewCell? {
        let obj = self.dataSource[index.row] as! [String: Any]
        let type = obj["type"] as! String
        if type == "text" || type == "numeric" || type == "date" || type == "email" || type == "dropdown" || type == "phone" {
            //create text cell
            let tableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: index) as! SMSTFormTextfieldTableViewCell
            tableViewCell.tfValue.placeholder = obj["title"] as? String
            if type == "numeric" {
                tableViewCell.tfValue.keyboardType = .numberPad
            } else if type == "email" {
                tableViewCell.tfValue.keyboardType = .emailAddress
            } else if type == "phone" {
                tableViewCell.tfValue.keyboardType = .phonePad
            }
            return tableViewCell
        }
        return UITableViewCell()
    }
}

extension SMSTApplySmartCardViewController: UITableViewDelegate {

}

extension SMSTApplySmartCardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.createCellAt(index: indexPath)!
    }
}
