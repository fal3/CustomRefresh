//
//  ViewController.swift
//  CustomRefresh
//
//  Created by alex fallah on 6/28/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
  {

    @IBOutlet weak var tableView: UITableView!
    var dataArray: Array<String> = ["One", "Two", "Three", "Four", "Five"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCell", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel!.text = dataArray[indexPath.row]

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }




}

