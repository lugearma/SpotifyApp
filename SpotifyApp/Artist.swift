//
//  Artist.swift
//  SpotifyApp
//
//  Created by Luis Arias on 07/05/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import Foundation

class Artist {
    var name:String?
    var urlImage: String?

    init(name: String, url: String){
        self.name = name
        self.urlImage = url
    }
    
    init(name: String){
        self.name = name
    }
}