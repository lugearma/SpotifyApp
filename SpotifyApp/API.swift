//
//  API.swift
//  SpotifyApp
//
//  Created by Luis Arias on 07/05/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import Foundation

class API{
    
    //Get dato from API and parsing of raw way :P
    class func getTopArtists(artistList: ArtistList, responseBlock: (NSError?) -> Void){
        var nameJSON: String = ""
        var urlImageJSON: String = ""
        
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
                                //Get artist name from JSON
                                if let name = item["name"]{
                                    nameJSON = name as! String
                                }
                                //Get url of images from JSON
                                if let images = item["image"] as? [[String: AnyObject]]{
                                    for image in images{
                                        //Get specfic extralarge image
                                        if image["size"] as! String == "extralarge"{
                                            urlImageJSON = image["#text"] as! String
                                        }
                                    }
                                }
                                //Add artist to our list
                                artistList.items.append(Artist(name: nameJSON, url: urlImageJSON))
                            }
                        }
                    }
                }
            }
        }
        task.resume()
    }
}
