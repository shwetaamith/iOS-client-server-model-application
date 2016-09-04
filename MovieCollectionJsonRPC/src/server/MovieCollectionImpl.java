package ser423.movie.server;
import java.util.Hashtable;
import java.util.Iterator;
import java.io.File;
import java.io.FileInputStream;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;
import java.util.Vector;
import java.util.Enumeration;

import org.json.JSONObject;
import org.json.JSONTokener;

/**
 * Copyright (c) 2016 Shweta Murthy,
 * You may not use this file except for self-evaluation and practice
 * This file is allowed to be used for grading puroposes
 * through the spring semester 2016, ASU, by  the grader, TA and the instructor
 * Unless agreed to in writing, this material can is to be
 * distributed on an "AS IS" BASIS
 *
 * @author Shweta Murthy mailTo: smurthy3@asu.edu
 * @version 2/29/16
 */

class MovieCollectionImpl extends Object implements MovieCollection {
	public Hashtable<String,Movie> movies;
	private static final boolean debugOn = false;
	private static final String movieJsonFileName = "movies.json";
	   
	public MovieCollectionImpl(){
		debug("creating a new movie collection");
	      movies = new Hashtable<String,Movie>();
	      this.resetFromJsonFile();
	}   
	private void debug(String message) {
		if (debugOn)
	         System.out.println("debug: "+message);
	}
	
	@Override
	public boolean saveToJsonFile() {
		boolean ret = true;
	      try {
	         String jsonStr;
	         JSONObject obj = new JSONObject();
	         for (Enumeration<String> e = movies.keys(); e.hasMoreElements();){
	            Movie aStud = movies.get((String)e.nextElement());
	            obj.put(aStud.name,aStud.toJson());
	         }
	         PrintWriter out = new PrintWriter(movieJsonFileName);
	         out.println(obj.toString(2));
	         out.close();
	      }catch(Exception ex){
	         ret = false;
	      }
	      return ret;
	}

	@Override
	public boolean resetFromJsonFile() {
		boolean ret = true;
	      try{
	         movies.clear();
	         String fileName = movieJsonFileName;
	         File f = new File(fileName);
	         FileInputStream is = new FileInputStream(f);
	         JSONObject movieMap = new JSONObject(new JSONTokener(is));
	         Iterator<String> it = movieMap.keys();
	         while (it.hasNext()){
	            String mType = it.next();
	            JSONObject movieJson = movieMap.optJSONObject(mType);
	            Movie movie = new Movie(movieJson);
                 System.out.println("Movie is"+movie.name);
	            movies.put(movie.name, movie);
	            debug("added "+movie.name+" : "+movie.toJsonString()+
	                  "\nmovies.size() is: " + movies.size());
	         }
	      }catch (Exception ex){
	         System.out.println("Exception reading json file: "+ex.getMessage());
	         ret = false;
	      }
	      return ret;
	}
	

	@Override
	public boolean add(Movie movie) {
		
		boolean ret = true;
	      debug("adding movie named: "+((movie==null)?"unknown":movie.name));
	      try{
	         movies.put(movie.name,movie);
	        System.out.println("Done adding:"+movie.name);
	      }catch(Exception ex){
	         ret = false;
	      }
	      return ret;
	}

	@Override
	public boolean remove(String aName) {
		debug("removing movie named: "+aName);
	      return ((movies.remove(aName)==null)?false:true);		
	}

	@Override
	public Movie get(String aName) {
		Movie ret = new Movie("unknown","unknown","unknown","unknown","unknown","unknown","unknown");
	      Movie aMovie = movies.get(aName);
	      if (aMovie != null) {
	         ret = aMovie;
	      }
	      return ret;
	}

	@Override
	public String[] getNames() {
		String[] ret = {};
	      debug("getting "+movies.size()+" movie names.");
	      if(movies.size()>0){
	         ret = (String[])(movies.keySet()).toArray(new String[0]);
	      }
	      return ret;
	}

}
