//
//  ArtistList.swift
//  SpotifyApp
//
//  Created by Luis Arias on 11/05/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ArtistList: NSObject{
    
    var items: [Artist] = [Artist(name: "Luis")]
    
    
    
}

extension ArtistList: UITableViewDataSource{
    
    //Return number of items
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //Set content for each item
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let item = indexPath.row
        cell.textLabel!.text = items[item].name
        return cell
    }

}