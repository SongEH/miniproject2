package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.LocationVo;

	@Service
	public class LocationService {

		
		public LocationService() {
			// TODO Auto-generated constructor stub
			System.out.println("==placeService==");
		}

		 @Autowired
		    HttpServletRequest request;

		    public List<LocationVo> searchLocation( String sido,
		                                           String cate) {

		        List<LocationVo> list = new ArrayList<LocationVo>();

		        try {
		        			        
		            String str_url ="https://api.odcloud.kr/api/15111389/v1/uddi:41944402-8249-4e45-9e9d-a52d0a7db1cc?page=1&perPage=2300&returnType=JSON&serviceKey=l6%2BGwn%2F2gBKrIhyCjPzg0YculDtnU8GMR2Ksd%2BuMTaIiiBCpb9miCrTjfugwbrSgSe9giUa%2BWw1ad5qfbZequA%3D%3D";
		        	
		        	
		            URL url = new URL(str_url);
		            HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
		            urlConn.setRequestProperty("content-Type", "application/json");
		            urlConn.connect();

		            InputStreamReader isr = new InputStreamReader(urlConn.getInputStream(), "utf-8");
		            BufferedReader br = new BufferedReader(isr);

		            StringBuilder sb = new StringBuilder();

		            while (true) {
		                String data = br.readLine();
		                if (data == null) break;
		                sb.append(data);
		            }

		            JSONObject json = new JSONObject(sb.toString());
		            JSONArray itemsArray = json.getJSONArray("data");

		            for (int i = 0; i < itemsArray.length(); i++) {
		                JSONObject locations = itemsArray.getJSONObject(i);

		                String l_cate = locations.getString("카테고리3");
		                String l_name = locations.getString("시설명");
		                
		                String l_addr = "";
		                if(locations.get("도로명주소").getClass() == String.class) {
		                	
		                	l_addr = locations.getString("도로명주소");
		                }
		                String l_opentime = locations.getString("운영시간");
		                String l_price = locations.getString("입장(이용료)가격 정보");
		                String l_sido = locations.getString("시도 명칭");
		                String l_URL = locations.getString("홈페이지");
		                
			           if (l_sido.equals(sido) || sido.equals("all")) { 			                   
			                   if(l_cate.equals(cate) || cate.equals("all")) {
			                    LocationVo vo = new LocationVo();
				                vo.setL_cate(l_cate);
				                vo.setL_name(l_name);
				                vo.setL_addr(l_addr);
				                vo.setL_opentime(l_opentime);
				                vo.setL_price(l_price);
				                vo.setL_cate(l_sido);
				                vo.setL_URL(l_URL);
				                
				                list.add(vo);
				                //System.out.println(sido);
				                //System.out.println(cate);
			                   }
			                }  //end if(시도 검색)
			           	      
		                }    //end for
		        } catch (Exception e) {
		            e.printStackTrace();
		        }

		        return list;
		    } //end searchLocation
		
		}

