//
//  SMSTDiscountsViewController.swift
//  SmartStudent
//
//  Created by Somlea Felix-Bogdan on 9/26/17.
//  Copyright © 2017 Somlea Felix-Bogdan. All rights reserved.
//

import UIKit

class SMSTDiscountsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "SMSTDiscountsTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        self.dataSource = self.loadDataSource()!
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 70
    }

    private func loadDataSource()-> [Any]? {
        if let filePath = Bundle.main.path(forResource: "discounts", ofType: "json"),
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

extension SMSTDiscountsViewController: UITableViewDelegate {

}

extension SMSTDiscountsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! SMSTDiscountsTableViewCell
        let obj = self.dataSource[indexPath.section] as? [String: Any]
        tableViewCell.lblBodyText.text = obj?["body"] as? String
        return tableViewCell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView")
        if headerView == nil {
            headerView = UITableViewHeaderFooterView(reuseIdentifier: "headerView")
        }

        headerView!.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44)
        headerView?.contentView.backgroundColor = UIColor.colorWith(red: 8, green: 140, blue: 156)
        for subView in (headerView?.subviews)!  {
            if subView is UILabel {
                subView.removeFromSuperview()
            }
        }
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        let obj = self.dataSource[section] as? [String: Any]
        lbl.text = obj?["title"] as? String
        headerView?.addSubview(lbl)



        //Setup Constraints for label
        let views = ["lbl": lbl, "headerView": headerView!] as [String : Any]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[lbl]|", options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[lbl]|", options: [], metrics: nil, views: views)

        headerView?.addConstraints(horizontalConstraints)
        headerView?.addConstraints(verticalConstraints)
        
        return headerView
    }
}
