//
//  AddMe.swift
//  MovieJsonCollectionRPCiOS
//
//  Created by Shweta Murthy on 3/9/16.
//  Copyright © 2016 Shweta Murthy. The instuctor and the University are provided the right to build and evaluate the software package for the purpose of determining grade and program assessment.
//  Created by Shweta Murthy on 3/9/16.mailto:smurthy3@asu.edu.


import UIKit

public class AddMe: UIViewController, UITextFieldDelegate, UIPickerViewDelegate {
    var parent: MovieTableViewController = MovieTableViewController()
    //var movies: [String] = [String]()
    let type:[String] = ["Mystery","Thriller","Drama","Comedy","Action"]
    
    @IBOutlet weak var myName: UITextView!
    
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var myActors: UITextView!
    
    @IBOutlet weak var myPlot: UITextView!
    
    @IBOutlet weak var myYear: UITextField!
    @IBOutlet weak var myReleased: UIDatePicker!
    @IBOutlet weak var myRated: UITextField!
    @IBOutlet weak var myGenre: UITextField!
    public var n: String = String()
    public var p: String = String()
    public var re: String = String()
    public var ra: String = String()
    public var g: String = String()
    public var y: String = String()
    public var s: String = String()
    let urlString:String = "http://localhost:8080"
    
    
    
    @IBAction func onClick(sender: AnyObject) {
        /*s.append("Title"+myName.text)
        s.append("Actors"+myActors.text)
        s.append("Genre"+myGenre.text!)
        s.append("Plot"+myPlot.text)
        s.append("Released"+myReleased.date.description)
        s.append("Rated"+myRated.text!)
        s.append("Year"+myYear.text!)*/
        
        n = "{\"Title\":\""+myName.text+"\","
        p = "\"Plot\":\""+myPlot.text+"\","
        re = "\"Released\":\""+myReleased.date.description+"\","
        let myRange = Range<String.Index>(start: re.startIndex.advancedBy(12), end: re.startIndex.advancedBy(22))
        print(re)
        print(re.substringWithRange(myRange))
        let newRe: String = "\"Released\":\""+re.substringWithRange(myRange)+"\","
        print(newRe)
        ra = "\"Rated\":\""+myRated.text!+"\","
        g = "\"Genre\":\""+myGenre.text!+"\","
        y = "\"Year\":\""+myYear.text!+"\"}"
        s = "\"Actors\":\""+myActors.text+"\","
        let movie: String = n+p+newRe+ra+g+s+y
        print(movie)
        
        let m: Movie = Movie(jsonStr: movie)
        print(m.toJsonString())
        parent.m1 = m
        parent.newMovie = m.toJsonString()
        
        //var new: [String:MovieDescription] = [String: MovieDescription]()
        //new = movies.add(m)
        //parent.l = movies
        //NSLog("Movie added", new.first.debugDescription)
        //var m1: String = "{\"Title\":\"Full Metal Jacket\",\"Year\":\"1987\",\"Rated\":\"R\",\"Released\":\"10 Jul 1987\",\"Runtime\":\"116 min\",\"Genre\":\"Drama, War\",\"Actors\":[\"Matthew Modine, Adam Baldwin, Vincent D'Onofrio, R. Lee Ermey\"],\"Plot\":\"A pragmatic U.S. Marine observes the dehumanizing effects the Vietnam War has on his fellow recruits from their brutal boot camp training to the bloody street fighting in Hue.\"}"
        //print(m1)
        /*if let data: NSData = movie.dataUsingEncoding(NSUTF8StringEncoding){
        do{
        let dict = try NSJSONSerialization.JSONObjectWithData(data,options:.MutableContainers) as?[String:AnyObject]
        print( (dict!["Title"] as? String)!)
        /*self.genre = (dict!["Genre"] as? String)!
        self.rated = (dict!["Rated"] as? String)!
        self.released = (dict!["Released"] as? String)!
        self.plot = (dict!["Plot"] as? String)!
        self.year = (dict!["Year"] as? String)!
        self.actors = (dict!["Actors"] as? Array<String>)!
        print("Name:"+self.name)*/
        }
        catch {
        print("unable to convert to dictionary")}}*/
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("In view didload for AddMe.swift")
        
        myYear.placeholder = "Enter Year"
        myRated.placeholder = "Enter Rated"
        self.typePicker.delegate = self
        self.myGenre.delegate = self
        myGenre.text = (type[0])
        typePicker?.removeFromSuperview()
        self.myGenre.inputView = typePicker
        
        
    }
    
    
    
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.myGenre.text = type[row]
        self.myGenre.resignFirstResponder()
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    public
    func pickerView (pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type[row]
    }
    
    
    
    
    
}



