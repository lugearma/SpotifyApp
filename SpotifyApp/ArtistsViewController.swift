//
//  ArtistsViewController.swift
//  SpotifyApp
//
//  Created by Luis Arias on 07/05/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ArtistsViewController: UITableViewController {
    
    var items: [Artist]? = [Artist(name: "Luis")]
    
    override func viewDidLoad() {
        API.getTopArtists({err -> Void in
            if let _ = err{
                self.showError()
            }else{
                self.navigationController?.popViewControllerAnimated(true)
            }
        })
    }
    
    func showError(){
        let alert = UIAlertController(title: "Error", message: "A problem has ocurred", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: {_ in self.navigationController?.popViewControllerAnimated(true)})
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let item = indexPath.row
        cell.textLabel!.text = items![item].name
        return cell
    }
}
