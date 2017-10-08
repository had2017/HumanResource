import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import entity.Product;


public class servlets extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		  doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/x-www-form-urlencode; charset=UTF-8"); 
		List<Product> list = new ArrayList<Product>();
		
	      list.add(new Product("cunyi", 10));
	        list.add(new Product("¶ÌÐä", 20));
	        list.add(new Product("´óÒÂ", 30));
	        String jsonString = JSON.toJSONString(list);
	        String jsonString1 = JSON.toJSONString(list,true);
	        System.out.println("1"+jsonString);
	        System.out.println("2"+jsonString1);
	        out.print(jsonString);
	
		out.flush();
		out.close();
	}

}
