package com.sjh0120.cinema;

public class MovieDto {
	private String movie_name;
	private String movie_image;
	private String movie_genre;
	private String movie_detail;
	private boolean result;
	
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	private int num;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_image() {
		return movie_image;
	}
	public void setMovie_image(String movie_image) {
		this.movie_image = movie_image;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_detail() {
		return movie_detail;
	}
	public void setMovie_detail(String movie_detail) {
		this.movie_detail = movie_detail;
	}
	@Override
	public String toString() {
		return "MovieDto [movie_name=" + movie_name + ", movie_image=" + movie_image + ", movie_genre=" + movie_genre
				+ ", movie_detail=" + movie_detail + ", result=" + result + ", num=" + num + "]";
	}
	
	
}
