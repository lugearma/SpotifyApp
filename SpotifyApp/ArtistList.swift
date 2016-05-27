//
//  ArtistList.swift
//  SpotifyApp
//
//  Created by Luis Arias on 11/05/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit
import SDWebImage

class ArtistList: NSObject{
    var items: [Artist] = []
    var filteredData: [Artist] = []
    let cellIdentifier = "CustomCell"
}

extension ArtistList: UITableViewDataSource{
    
    //Return number of items
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return items.count
        return filteredData.count
    }
    
    //Set content for each item
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ArtistCell
        setNameArtist(cell, index: indexPath)
        
        return cell
    }
    
    func setNameArtist(cell: ArtistCell, index indexPath: NSIndexPath){
//        let item = items[indexPath.row]
        let item = filteredData[indexPath.row]
        cell.nameLabel.text = item.name
        cell.imageArtist.sd_setImageWithURL(NSURL(string: item.urlImage!), placeholderImage: UIImage(named: "placeholder.jpg"))
    }
}