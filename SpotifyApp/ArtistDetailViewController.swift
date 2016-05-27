//
//  ArtistDetailViewController.swift
//  SpotifyApp
//
//  Created by Luis Arias on 27/05/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class ArtisDetailViewController: UIViewController{
    
    var titleText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextNavbar(titleText)
    }
    
    func setTextNavbar(text: String){
        self.title = text
    }
}
