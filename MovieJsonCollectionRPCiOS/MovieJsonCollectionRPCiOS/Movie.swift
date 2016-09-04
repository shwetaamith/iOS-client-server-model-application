//
//  Movie.swift
//  MovieJsonCollectionRPCiOS
//
//  Created by Shweta Murthy on 3/9/16.
//  Copyright © 2016 Shweta Murthy. The instuctor and the University are provided the right to build and evaluate the software package for the purpose of determining grade and program assessment.
//  Created by Shweta Murthy on 3/9/16.mailto:smurthy3@asu.edu.

import Foundation

public class Movie {
    var name: String
    var year: String
    var plot: String
    var rated: String
    var released: String
    var actors: String
    var genre: String
    init(){
        self.name = ""
        self.plot = ""
        self.rated = ""
        self.released = ""
        self.year = ""
        self.actors =  ""
        self.genre = ""
    
    }
    init (jsonStr: String){
        self.name = ""
        self.plot = ""
        self.rated = ""
        self.released = ""
        self.year = ""
        self.actors =  ""
        self.genre = ""
        if let data: NSData = jsonStr.dataUsingEncoding(NSUTF8StringEncoding){
            do{
                let dict = try NSJSONSerialization.JSONObjectWithData(data,options:.MutableContainers) as?[String:AnyObject]
                self.name = (dict!["Title"] as? String)!
                self.rated = (dict!["Rated"] as? String)!
                self.released = (dict!["Released"] as? String)!
                self.plot = (dict!["Plot"] as? String)!
                self.year = (dict!["Year"] as? String)!
                self.actors = (dict!["Actors"] as? String)!
                self.genre = (dict!["Genre"] as? String)!
            } catch {
                print("unable to convert to dictionary")
                
            }
        }}

    
    init(dict: [String:AnyObject]){
        self.name = dict["Title"] as! String
        self.plot = dict["Plot"] as! String
        self.released = dict["Released"] as! String
        self.rated = dict["Rated"] as! String
        self.year = dict["Year"] as! String
        self.genre = dict["Genre"] as! String
        self.actors = dict["Actors"] as! String
    }
    
    func toJsonString() -> String {
        var jsonStr = "";
        let dict = ["Title": name, "Plot": plot, "Released": released, "Rated": rated, "Actors": actors, "Year": year, "Genre": genre]
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.PrettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            jsonStr = NSString(data: jsonData, encoding: NSUTF8StringEncoding)! as String
        } catch let error as NSError {
            print(error)
        }
        return jsonStr
    }
    
    func toJson() -> AnyObject{
    
        var j: AnyObject = [
        "Title": self.name,
        "Plot": self.plot,
        "Actors": self.actors,
        "Genre": self.genre,
        "Rated": self.rated,
        "Released": self.released,
            "Year": self.year]
        print("toJson result: [",j,"]")
       return j
    }
}
