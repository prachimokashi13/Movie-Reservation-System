package com.project.model;

import java.util.Date;
import java.util.List;

public class Movie {

	private int movieId;

	private String movieName;

	private String language;
	
	private String genre;
	
	private String description;
	
	private Date releaseDate;

	private int duration;

	private float rating;
	
	private List<String> availableShows ;

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public List<String> getAvailableShows() {
		return availableShows;
	}

	public void setAvailableShows(List<String> availableShows) {
		this.availableShows = availableShows;
	}
	
	

}
