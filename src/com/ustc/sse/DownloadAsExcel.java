package com.ustc.sse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
public class DownloadAsExcel extends HttpServlet {
	
	//private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException{
		 res.setContentType("application/vnd.ms-excel");
		 PrintWriter out=res.getWriter();
		 out.close();
	    }
}
