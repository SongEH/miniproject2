package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import util.MyOpenAPIKey;
import vo.NewsItem;

@Service
public class LocationService {

	
	public LocationService() {
		// TODO Auto-generated constructor stub
		System.out.println("==placeService==");
	}

}
