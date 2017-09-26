//
//  SMSTMoreViewController.swift
//  SmartStudent
//
//  Created by Somlea Felix-Bogdan on 9/26/17.
//  Copyright © 2017 Somlea Felix-Bogdan. All rights reserved.
//

import UIKit



//Reducer, Evenimente, Parteneriate, Despre SmartStudent, FAQ, Contact

class SMSTMoreViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var dataSource: [Any] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName:"SMSTMoreTableViewCell", bundle:nil), forCellReuseIdentifier: "moreCellId")
        self.tableView.rowHeight = 50
        self.title = "Mai Multe"
        self.dataSource = self.loadDataSource()!
    }

    private func loadDataSource()-> [Any]? {
        if let filePath = Bundle.main.path(forResource: "more", ofType: "json"),
            let data = NSData(contentsOfFile: filePath) {
            do {
                let json = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)

                if let arr = json as? [Any] {
                    return arr
                }
            } catch {
                //Handle Error
            }
        }
        return nil
    }
}

extension SMSTMoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arr = self.dataSource[indexPath.section] as? [Any]
        let obj = arr![indexPath.row] as! [String: Any]
        if obj["id"] as? Int == 0 {
            let discountsController = SMSTDiscountsViewController(nibName: "SMSTDiscountsViewController", bundle: nil)
            self.navigationController?.pushViewController(discountsController, animated: true)
        } else if obj["id"] as? Int == 1 {

        } else if obj["id"] as? Int == 2 {
            let partnersViewController = SMSTPartnersViewController(nibName: "SMSTPartnersViewController", bundle: nil)
            self.navigationController?.pushViewController(partnersViewController, animated: true)
        } else if obj["id"] as? Int == 3 {
            let aboutUsViewController = SMSTAboutUsViewController(nibName: "SMSTAboutUsViewController", bundle: nil)
            self.navigationController?.pushViewController(aboutUsViewController, animated: true)

        } else if obj["id"] as? Int == 4 {
            
        } else if obj["id"] as? Int == 4 {

        } else if obj["id"] as? Int == 4 {

        }
    }
}

extension SMSTMoreViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataSource[section] as AnyObject).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "moreCellId", for: indexPath) as! SMSTMoreTableViewCell
        let arr = self.dataSource[indexPath.section] as? [Any]
        let obj = arr![indexPath.row]
        tableViewCell.addToCell(data: obj as! [String: Any])
        return tableViewCell
    }
}
