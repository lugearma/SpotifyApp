//
//  API.swift
//  SpotifyApp
//
//  Created by Luis Arias on 07/05/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import Foundation

class API{
    
//    let artistItem = ArtistList()
    
    class func getTopArtists(artistList: ArtistList, responseBlock: (NSError?) -> Void){
//        let artistItem = ArtistList()
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: Constants.topArtist)!
        let request = NSMutableURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request){ (data, response, error) -> Void in
            if let err = error{
                responseBlock(err)
            } else {
                if let d = data {
                    let result = try! NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions())
                    if let artists = result["artists"] as? [String: AnyObject]{
                        if let artist = artists["artist"] as? [[String: AnyObject]]{
                            for item in artist{
                                if let name = item["name"]{
                                    artistList.items.append(Artist(name: name as! String))
                                }
//                                if let listeners = item["listeners"]{
//                                    print(listeners)
//                                }
                            }
                        }
                    }
                }
                print("Acabo de terminar")
            }
        }
        task.resume()
    }
}
