//
//  ViewController.swift
//  MovieJsonCollectionRPCiOS
//
//  Created by Shweta Murthy on 3/9/16.
//  Copyright © 2016 Shweta Murthy. The instuctor and the University are provided the right to build and evaluate the software package for the purpose of determining grade and program assessment.
//  Created by Shweta Murthy on 3/9/16.mailto:smurthy3@asu.edu.


import UIKit

class ViewController: UIViewController{
    var movie: String = ""
    let urlString:String = "http://localhost:8080"

    @IBOutlet weak var name: UITextView!
    @IBOutlet weak var actor: UITextView!
    @IBOutlet weak var plot: UITextView!
    @IBOutlet weak var genre: UITextField!
    @IBOutlet weak var rated: UITextField!
    @IBOutlet weak var released: UITextField!
    @IBOutlet weak var year: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("reached viewcontroller from segue")
        let aConnect:MovieCollectionStub = MovieCollectionStub(urlString: urlString)
        let resGet:Bool = aConnect.get(movie, callback: { (res: String, err: String?) -> Void in
            if err != nil {
                NSLog(err!)
            }else{
                NSLog(res)
                print("Result for populating")
                if let data: NSData = res.dataUsingEncoding(NSUTF8StringEncoding){
                    do{
                        let dict = try NSJSONSerialization.JSONObjectWithData(data,options:.MutableContainers) as?[String:AnyObject]
                        let aDict:[String:AnyObject] = (dict!["result"] as? [String:AnyObject])!
                        let aStud:Movie = Movie(dict: aDict)
                        self.name.text = aStud.name
                        self.actor.text = aStud.actors
                        self.plot.text = aStud.plot
                        self.genre.text = aStud.genre
                        self.released.text = aStud.released
                        self.rated.text = aStud.rated
                        self.year.text = aStud.year
                    } catch {
                        NSLog("unable to convert to dictionary")
                    }
                }
            }
        })
        print("you")
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

