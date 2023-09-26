package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.CommentVO;
import service.CommentService;
import service.CommentServiceImpl;

@WebServlet("/cmt/*")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(CommentController.class);
	private CommentService csv;
	private int isOk;
	
       
    public CommentController() {
        csv = new CommentServiceImpl();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		
		String pathUri = uri.substring("/cmt/".length());
		String path = pathUri;
		String pathVar = "";
		if(pathUri.contains("/")) {
			path = pathUri.substring(0, pathUri.lastIndexOf("/"));
			pathVar = pathUri.substring(pathUri.lastIndexOf("/")+1);
		}
		
		log.info("uri >> "+uri);
		log.info("pathUri >> "+pathUri);
		log.info("path >> "+path);
		log.info("pathVar >> "+pathVar);
		
		switch(path) {
		case "post" : 
			try {
				StringBuffer sb = new StringBuffer();
				String line = "";
				BufferedReader br = request.getReader();
				while((line = br.readLine()) != null) {
					sb.append(line);
				}
				log.info("sb : "+sb.toString());
				
				JSONParser jp = new JSONParser();
				JSONObject jo = (JSONObject)jp.parse(sb.toString());
				
				int bno = Integer.parseInt(jo.get("bno").toString());
				String writer = jo.get("writer").toString();
				String content = jo.get("content").toString();
				
				CommentVO cvo = new CommentVO(bno, writer, content);
				log.info("cvo >>> "+cvo);
				isOk = csv.post(cvo);
				log.info((isOk > 0)? "OK" : "Fail");
				
				PrintWriter out = response.getWriter();
				out.print(isOk);
				} catch (Exception e) {
				e.printStackTrace();
				log.info("comment post error");
			}
			break;
		case "list" : 
			try {
				int bno = Integer.parseInt(pathVar);
				List<CommentVO> list = csv.getList(bno);
				log.info("comment > List > "+list);
				
				JSONObject[] jArr = new JSONObject[list.size()];
				JSONArray jList = new JSONArray();
				
				for(int i = 0; i < list.size(); i++) {
					jArr[i] = new JSONObject();
					jArr[i].put("cno", list.get(i).getCno());
					jArr[i].put("bno", list.get(i).getBno());
					jArr[i].put("writer", list.get(i).getWriter());
					jArr[i].put("content", list.get(i).getContent());
					jArr[i].put("regdate", list.get(i).getRegdate());
					
					jList.add(jArr[i]);
				}
				String jsonDate = jList.toJSONString();
				
				PrintWriter out = response.getWriter();
				out.print(jsonDate);
			} catch (Exception e) {
				e.printStackTrace();
				log.info("comment list error");
			}
			break;
		case "modify" :
			try {
				StringBuffer sb = new StringBuffer();
				String line = "";
				BufferedReader br = request.getReader();
				while((line=br.readLine()) != null) {
					sb.append(line);
				}
				log.info(">>>> sb : "+sb.toString());
				
				JSONParser parser = new JSONParser();
				JSONObject jsonobj = (JSONObject)parser.parse(sb.toString());
				int cno = Integer.parseInt(jsonobj.get("cno").toString());
				String content = jsonobj.get("content").toString();
				
				CommentVO cvo = new CommentVO(cno, content);
				isOk = csv.modify(cvo);
				log.info((isOk > 0)? "OK" : "Fail");
				
				PrintWriter out = response.getWriter();
				out.print(isOk);
			} catch (Exception e) {
				e.printStackTrace();
				log.info("comment modify error");
			}
			break;
		case "remove" : 
			try {
				int cno = Integer.parseInt(pathVar);
				isOk = csv.remove(cno);
				log.info((isOk > 0)? "OK" : "Fail");
				
				PrintWriter out = response.getWriter();
				out.print(isOk);
			} catch (Exception e) {
				e.printStackTrace();
				log.info("comment remove error");
			}
			break;
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
