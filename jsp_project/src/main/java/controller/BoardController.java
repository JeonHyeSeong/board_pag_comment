package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import handler.PagingHandler;
import service.BoardServiceImpl;
import service.Service;

@WebServlet("/brd/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	private RequestDispatcher rdp;
	private Service bsv;
	private String destPage;
	private int isOk;
       
    public BoardController() {
        bsv = new BoardServiceImpl();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1);
		log.info("path>>>"+path);
		
		switch(path) {
		case "register" :
			destPage = "/board/register.jsp";
			log.info("register check");
			break;
		case "insert" :
			try {
				String title = request.getParameter("title");
				String writer = request.getParameter("writer");
				String content = request.getParameter("content");
				BoardVO bvo = new BoardVO(title, writer, content);
				isOk = bsv.insert(bvo);
				log.info("insert check "+((isOk > 0)? "OK" : "Fail"));
				destPage = "/index.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				log.info("insert error");
			}
			break;
			
		case "list" :
			try {
				List<BoardVO> list = bsv.getList();
				request.setAttribute("list", list);
				destPage = "/board/list.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				log.info("list error");
			}
			break;
			
		case "pageList" :
			try {
				PagingVO pgvo = new PagingVO();
				if(request.getParameter("pageNo") != null) {
					int pageNo = Integer.parseInt(request.getParameter("pageNo"));
					int qty = Integer.parseInt(request.getParameter("qty"));
					pgvo = new PagingVO(pageNo, qty);
				}
				pgvo.setType(request.getParameter("type"));
				pgvo.setKeyword(request.getParameter("keyword"));
				log.info("type : "+pgvo.getType()+", keyword : "+pgvo.getKeyword());
				
				int totalCount  = bsv.getTotalCount(pgvo);
				log.info("전체게시글 >>"+totalCount);
				List<BoardVO> list = bsv.getPageList(pgvo);
				request.setAttribute("list", list);
				
				PagingHandler ph = new PagingHandler(totalCount, pgvo);
				request.setAttribute("ph", ph);
				destPage = "/board/list.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				log.info("pageList error");
			}
			break;
		case "detail" :
			try {
				int bno = Integer.parseInt(request.getParameter("bno"));
				BoardVO bvo = bsv.getDetail(bno);
				request.setAttribute("bvo", bvo);
				destPage = "/board/detail.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				log.info("detail error");
			}
			break;
		case "modify" :
			try {
				int bno = Integer.parseInt(request.getParameter("bno"));
				BoardVO bvo = bsv.getDetail(bno);
				request.setAttribute("bvo", bvo);
				destPage = "/board/modify.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				log.info("modify error");
			}
			break;
		case "edit" : 
			try {
				int bno = Integer.parseInt(request.getParameter("bno"));
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				BoardVO bvo = new BoardVO(bno, title, content);
				isOk = bsv.modify(bvo);
				log.info("edit check "+((isOk > 0)? "OK" : "Fail"));
				destPage = "detail?bno="+bno;
			} catch (Exception e) {
				e.printStackTrace();
				log.info("edit error");
			}
			break;
		case "remove" :
			try {
				int bno = Integer.parseInt(request.getParameter("bno"));
				isOk = bsv.remove(bno);
				log.info("remove check "+((isOk > 0)? "OK" : "Fail"));
				destPage = "pageList";
			} catch (Exception e) {
				e.printStackTrace();
				log.info("remove error");
			}
			break;
		}
		
		rdp = request.getRequestDispatcher(destPage);
		rdp.forward(request, response);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
