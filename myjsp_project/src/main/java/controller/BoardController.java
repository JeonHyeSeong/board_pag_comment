package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import handler.FileHandler;
import handler.PagingHandler;
import net.coobird.thumbnailator.Thumbnails;
import service.BoardService;
import service.BoardServiceImpl;

@WebServlet("/brd/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	private RequestDispatcher rdp;
	private BoardService bsv;
	private String destPage;
	private int isOk;
	private String savePath;
       
    public BoardController() {
        bsv = new BoardServiceImpl();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1);
		log.info("path >> "+path);
		
		switch(path) {
		case "register" :
			destPage = "/board/register.jsp";
			break;
		case "insert" :
			try {
				savePath = getServletContext().getRealPath("/_fileUpload");
				File fDir = new File(savePath);
				log.info("파일저장경로 : "+savePath);
				
				DiskFileItemFactory dfiFactory = new DiskFileItemFactory();
				dfiFactory.setRepository(fDir);
				dfiFactory.setSizeThreshold(2*1024*1024);
				
				BoardVO bvo = new BoardVO();
				ServletFileUpload fileUpload = new ServletFileUpload(dfiFactory);
				
				List<FileItem> itemList = fileUpload.parseRequest(request);
				
				for(FileItem item : itemList) {
					switch(item.getFieldName()) {
					case "title" :
						bvo.setTitle(item.getString("utf-8"));
						break;
					case "writer" :
						bvo.setWriter(item.getString("utf-8"));
						break;
					case "content" :
						bvo.setContent(item.getString("utf-8"));
						break;
					case "image_file" :
						if(item.getSize() > 0) {
							String fileName = item.getName()
									.substring(item.getName().lastIndexOf("/")+1);
							fileName = System.currentTimeMillis()+"_"+fileName;
							
							File uploadPath = new File(fDir+File.separator+fileName);
							log.info("파일경로+이름 : "+uploadPath);
							
							try {
								item.write(uploadPath);
								bvo.setImage_File(fileName);
								Thumbnails.of(uploadPath).size(60, 60)
								.toFile(new File(fDir+File.separator+"_th_"+fileName));
							} catch (Exception e) {
								e.printStackTrace();
								log.info("file error");
							}
						}
						break;
					}
				}
				isOk = bsv.insert(bvo);
				log.info((isOk > 0)? "OK" : "Fail");
				destPage = "pageList";
				
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
				log.info("pageList 체크");
				PagingVO pgvo = new PagingVO();
				if(request.getParameter("pageNo") != null) {
					int pageNo = Integer.parseInt(request.getParameter("pageNo"));
					int qty = Integer.parseInt(request.getParameter("qty"));
					pgvo = new PagingVO(pageNo, qty);
				}
				
				pgvo.setType(request.getParameter("type"));
				pgvo.setKeyword(request.getParameter("keyword"));
				log.info("type >> "+pgvo.getType()+", keyword >> "+pgvo.getKeyword());
				
				int totalCount = bsv.getTotalCount(pgvo);
				log.info("전체게시글 수 >> "+totalCount);
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
		case "countx" :
			try {
				int bno = Integer.parseInt(request.getParameter("bno"));
				BoardVO bvo = bsv.countx(bno);
				request.setAttribute("bvo", bvo);
				destPage = "/board/detail.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "modify" :
			try {
				int bno = Integer.parseInt(request.getParameter("bno"));
				BoardVO bvo = bsv.countx(bno);
				request.setAttribute("bvo", bvo);
				destPage = "/board/modify.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				log.info("modify error");
			}
			break;
		case "edit" :
			try {
				savePath = getServletContext().getRealPath("/_fileUpload");
				File fDir = new File(savePath);
				DiskFileItemFactory dfiFactory = new DiskFileItemFactory();
				dfiFactory.setRepository(fDir);
				dfiFactory.setSizeThreshold(2*1024*1024);
				
				BoardVO bvo = new BoardVO();
				ServletFileUpload fileUpload = new ServletFileUpload(dfiFactory);
				List<FileItem> itemList = fileUpload.parseRequest(request);
				String old_File = null;
				
				for(FileItem item : itemList) {
					switch(item.getFieldName()) {
					case "bno" :
						bvo.setBno(Integer.parseInt(item.getString("utf-8")));
						break;
					case "title" :
						bvo.setTitle(item.getString("utf-8"));
						break;
					case "content" :
						bvo.setContent(item.getString("utf-8"));
						break;
					case "image_file" :
						old_File = item.getString("utf-8");
						break;
					case "new_file" :
						if(item.getSize() > 0) {
							if(old_File != null) {
								FileHandler fHandler = new FileHandler();
								isOk = fHandler.deleteFile(old_File, savePath);
							}
							String fileName = item.getName()
									.substring(item.getName().lastIndexOf(File.separator)+1);
							
							log.info("new_file : "+fileName);
							
							fileName = System.currentTimeMillis()+"_"+fileName;
							File uploadPath = new File(fDir+File.separator+fileName);
							
							try {
								item.write(uploadPath);
								bvo.setImage_File(fileName);
								
								Thumbnails.of(uploadPath).size(60, 60)
								.toFile(new File(fDir+File.separator+"_th_"+fileName));
							} catch (Exception e) {
								e.printStackTrace();
								log.info("new_file error");
							}
						}else {
							bvo.setImage_File(old_File);
						}
						break;
					}
				}
				isOk = bsv.edit(bvo);
				log.info((isOk > 0)? "OK" : "Fail");
				destPage = "pageList";
			} catch (Exception e) {
				e.printStackTrace();
				log.info("edit error");
			}
			break;
		case "remove" :
			try {
				int bno = Integer.parseInt(request.getParameter("bno"));
				String fileName = bsv.getFileName(bno);
				savePath = getServletContext().getRealPath("/_fileUpload");
				FileHandler fHandler = new FileHandler();
				isOk = fHandler.deleteFile(fileName, savePath);
				log.info("file remove check "+((isOk > 0)? "OK" : "Fail"));
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
