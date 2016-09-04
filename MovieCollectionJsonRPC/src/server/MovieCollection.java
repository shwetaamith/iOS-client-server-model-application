package ser423.movie.server;

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

public interface MovieCollection {
	public boolean saveToJsonFile();
	   public boolean resetFromJsonFile();
	   public boolean add(Movie stud);
	   public boolean remove(String aName);
	   public Movie get(String aName);
	   public String[] getNames();
}
