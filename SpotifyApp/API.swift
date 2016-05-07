//
//  API.swift
//  SpotifyApp
//
//  Created by Luis Arias on 07/05/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import Foundation

class API{
    
    class func getTopArtists(resposeBlock: (NSError?) -> Void){
        let session = NSURLSession.sharedSession();
        let url = NSURL(string: Constants.topArtist)
    }
}
