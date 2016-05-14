//
//  ArtistsViewController.swift
//  SpotifyApp
//
//  Created by Luis Arias on 07/05/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ArtistsViewController: UIViewController, UITableViewDelegate {
    
    var artistList: ArtistList = ArtistList()
    @IBOutlet var artistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        API.getTopArtists(artistList, responseBlock: {err -> Void in
            if let _ = err{
                self.showError()
            }else{
                self.navigationController?.popViewControllerAnimated(true)
            }
        })
    }
    
    func setupTableView(){
//        self.artistTableView.registerClass(ArtistCell.self, forCellReuseIdentifier: artistList.cellIdentifier)
        self.artistTableView.dataSource = artistList
        self.artistTableView.delegate = self
        self.artistTableView.rowHeight = UITableViewAutomaticDimension
        self.artistTableView.estimatedRowHeight = 160.0
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
        self.artistTableView.reloadData()
    }
    
    
    
}
