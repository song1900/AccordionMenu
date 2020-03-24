//
//  ViewController.swift
//  ExpandedView
//
//  Created by SungHo Han on 2020/03/23.
//  Copyright © 2020 viewmotion. All rights reserved.
//

import UIKit
import MobileCoreServices

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class TableViewController: UITableViewController {
    
    

    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewData = [
            cellData(opened: false, title: "Title1", sectionData: ["Cell1", "Cell2", "Cell3"]),
            cellData(opened: false, title: "Title2", sectionData: ["Cell1", "Cell2", "Cell3"]),
            cellData(opened: false, title: "Title3", sectionData: ["Cell1", "Cell2", "Cell3"]),
            cellData(opened: false, title: "Title4", sectionData: ["Cell1", "Cell2", "Cell3"]),
            cellData(opened: false, title: "Title5", sectionData: ["Cell1"])
        ]
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].title
            cell.backgroundColor = .darkGray
            return cell
        } else {
            //Use different cell idenrifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            cell.backgroundColor = .yellow
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none) //play around with this
        } else {
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none) //play around with this
        }
    }
    
    
   
    
    
    


}

