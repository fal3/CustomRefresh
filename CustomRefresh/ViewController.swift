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


    var refreshControl: UIRefreshControl!

    @IBOutlet weak var tableView: UITableView!
    var dataArray: Array<String> = ["One", "Two", "Three", "Four", "Five"]

    var customView: UIView!

    var labelsArray: Array<UILabel> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self

        refreshControl = UIRefreshControl()

        refreshControl.backgroundColor = UIColor.clearColor()
        refreshControl.tintColor = UIColor.clearColor()


        self.tableView.addSubview(refreshControl)

         loadCustomRefreshContents()
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel!.text = dataArray[indexPath.row]

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }


    func loadCustomRefreshContents() {
        let refreshContents = NSBundle.mainBundle().loadNibNamed("RefreshContents", owner: self, options: nil)


        customView = refreshContents[0] as! UIView
        customView.frame = refreshControl.bounds

        for var i=0; i<customView.subviews.count; ++i {
            labelsArray.append(customView.viewWithTag(i + 1) as! UILabel)
        }

        refreshControl.addSubview(customView)

    }




}

