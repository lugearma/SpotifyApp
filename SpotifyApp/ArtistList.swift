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
    let cellIdentifier = "CustomCell"

    
}

extension ArtistList: UITableViewDataSource{
    
    //Return number of items
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //Set content for each item
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ArtistCell
        setNameArtist(cell, index: indexPath)
//        let item = indexPath.row
//        cell.textLabel!.text = items[item].name
        return cell
    }
    
    func setNameArtist(cell: ArtistCell, index indexPath: NSIndexPath){
        let item = items[indexPath.row]
        cell.nameLabel.text = item.name
    }

}