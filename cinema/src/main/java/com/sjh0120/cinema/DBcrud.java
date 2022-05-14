package com.sjh0120.cinema;

import java.sql.*;
import java.util.ArrayList;

import org.apache.log4j.Logger;


public class DBcrud {
	Logger log=Logger.getLogger(this.getClass());
	
	public ArrayList<MovieDto> getList() throws ClassNotFoundException,SQLException{
		ArrayList<MovieDto> list=new ArrayList<>();
		
		String sql="select * from movie_board";
		
		
		try (
				Connection conn=DBServer.getConnection();
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery(sql);
				){
			while(rs.next()){
				MovieDto movies=new MovieDto();
				movies.setNum(rs.getInt("num"));
				movies.setMovie_name(rs.getString("movie_name"));
				movies.setMovie_image(rs.getString("movie_image"));
				movies.setMovie_genre(rs.getString("movie_genre"));
				movies.setMovie_detail(rs.getString("movie_detail"));
				list.add(movies);
				log.debug(movies.toString());
			}
		}
		
		return list;
	}
	
	public boolean insertOne(MovieDto movies) throws ClassNotFoundException,SQLException{
		String sql="insert into emp (movie_name,movie_image,movie_genre,movie_detail) values ('"
							+movies.getMovie_name()+"','"
							+movies.getMovie_image()+"','"
							+movies.getMovie_genre()+"','"
							+movies.getMovie_detail()+"')";
		try(
				Connection conn=DBServer.getConnection();
				Statement stmt=conn.createStatement();
				){
			return stmt.executeUpdate(sql)>0;
		}
	}
	
	public MovieDto detailOne(Number num) throws ClassNotFoundException,SQLException{
		MovieDto movie = new MovieDto();
		String sql="select * from movie_board where="+num;
		try(
				Connection conn=DBServer.getConnection();
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery(sql);
				){
			if(rs.next()) {
				movie.setMovie_name(rs.getString("movie_name"));
				movie.setMovie_image(rs.getString("movie_image"));
				movie.setMovie_genre(rs.getString("movie_genre"));
				movie.setMovie_detail(rs.getString("movie_detail"));
			}
			
		}
		return movie;
	}
	
}
