//
//  ArtistsViewController.swift
//  SpotifyApp
//
//  Created by Luis Arias on 07/05/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ArtistsViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate {
    
    var artistList: ArtistList = ArtistList()
    @IBOutlet var artistTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        customizeNavbar()
        searchBar.delegate = self
        API.getTopArtists(artistList, responseBlock: {err -> Void in
            if let _ = err{
                self.showError()
            }else{
                self.artistTableView.reloadData()
                self.navigationController?.popViewControllerAnimated(true)
            }
        })
    }
    
    func customizeNavbar(){
        let attributes = [ NSForegroundColorAttributeName: UIColor.orangeColor()]
        let navbar = self.navigationController?.navigationBar
        navbar?.tintColor = UIColor.orangeColor()
        navbar?.barStyle = UIBarStyle.BlackTranslucent
       
        navbar!.titleTextAttributes = attributes
    }
    
    func setupTableView(){
        self.artistTableView.dataSource = artistList
        self.artistTableView.delegate = self
        self.artistTableView.rowHeight = 150
    }
    
    func showError(){
        let alert = UIAlertController(title: "Error", message: "A problem has ocurred", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: {_ in self.navigationController?.popViewControllerAnimated(true)
        })
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: Delegate TableView methods
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        artistList.filteredData = artistList.items
        self.artistTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ArtistDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.identifier)
        if segue.identifier == "ArtistDetail"{
            let indexPath = self.artistTableView.indexPathForSelectedRow
            let artistDetailView = segue.destinationViewController as! ArtisDetailViewController
            artistDetailView.navBarText = artistList.items[(indexPath?.row)!].name!
        }
    }
    
    //MARK: Delegate SearchBar methos
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            artistList.filteredData = artistList.items
        }else{
            artistList.filteredData = artistList.items.filter({ (data: Artist) -> Bool in
                let name = data.name
                return name?.rangeOfString(searchText) != nil
            })
        }
        artistTableView.reloadData()
    }
}
