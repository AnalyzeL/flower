package com.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.entity.Category;
import com.entity.Customer;
import com.entity.Flower;
import com.entity.Navigation;
import com.entity.Orders;
import com.entity.Shopcart;
import com.service.CustomerService;
import com.service.FlowerService;
import com.service.OrderService;
import com.service.ShopcartService;
import com.util.AesUtil;
import com.util.HttpRequest;
import com.util.SessionUtil;

/**
 * 前台请求action
 * 响应前台请求
 * 在打开页面时传送相关数据
 */
@Namespace("/index")
@Results({
	@Result(name="index",location="/index/index.jsp"),
	@Result(name="list",location="/index/list.jsp"),
	@Result(name="my",location="/index/my.jsp"),
	@Result(name="intro",location="/index/intro.jsp"),
	@Result(name="order",location="/index/order.jsp"),
	@Result(name="cart",location="/index/shopcart.jsp"),
	@Result(name="login",location="/index/login.jsp"),
	@Result(name="register",location="/index/register.jsp"),
	@Result(name="reindex",type="redirectAction",location="index.action"),
	@Result(name="reorder",type="redirectAction",location="order.action"),
})	
public class IndexAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private static final String url="http://localhost:8081/ssh_flower/";
	// 定义属性, 用于struts自动封装参数
	private int category;
	private int id;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	private Flower flower;
	private Customer customer;
	private List<Flower> flowers;			// 鲜花列表
	private List<Category> categories;	// 类目列表
	private List<Navigation> navigations;
	private Category categorie;
	private List<Flower> likeFlowers;//猜你喜欢
	
	public List<Flower> getLikeFlowers() {
		return likeFlowers;
	}

	public void setLikeFlowers(List<Flower> likeFlowers) {
		this.likeFlowers = likeFlowers;
	}

	public List<Navigation> getNavigations() {
		return navigations;
	}

	public void setNavigations(List<Navigation> navigations) {
		this.navigations = navigations;
	}
	@Resource // spring注入bean
	private FlowerService flowerService;
	@Resource // spring注入bean
	private ShopcartService shopcartService;
	@Resource
	private OrderService orderService;
	@Resource
	private CustomerService customerService;
	
	
	/**
	 * 响应主页请求
	 * @return
	 */
	@Action("index")
	public String index(){
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			List<Shopcart> orders = shopcartService.getCartList(username);	//获取订单信息
			getRequest().put("orders", orders);//返回订单信息
		}
		flowers = flowerService.getHotFlowers(8);	// 获取首页推荐的鲜花记录(默认取8条)
		navigations = flowerService.navigation();
		getRequest().put("flowers", flowers);
		getRequest().put("navigations", navigations);
		SessionUtil.initShopCard(getSession(), shopcartService);	// 加载购物车
		return "index";
	}
	@Action("list")
	public String list(){
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			List<Shopcart> orders = shopcartService.getCartList(username);	//获取订单信息
			getRequest().put("orders", orders);//返回订单信息
		}
		category = Integer.parseInt(getServletRequest().getParameter("id"));
		flowers = flowerService.getFlowers(category);	
		navigations = flowerService.navigation();
		categorie=flowerService.getCategory(category);
		getRequest().put("flowers", flowers);
		getRequest().put("navigations", navigations);
		getRequest().put("categorie", categorie);
		return "list";
	}

	/**
	 * 我的订单
	 * @return
	 */
	@Action("order")
	public String order(){
		navigations = flowerService.navigation();
		getRequest().put("navigations", navigations);
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			return "login";
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			List<Shopcart> orders = shopcartService.getCartList(username);	//获取订单信息
			List<Orders> orders1=orderService.getOrders(username);
			getRequest().put("orders", orders);//返回订单信息
			getRequest().put("orders1", orders1);//返回订单信息
		}
		return "order";
	}
	
	/**
	 * 提交订单
	 * @return
	 * @throws IOException
	 */
	@Action("orderAdd")
	public String orderAdd() throws IOException{
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			getRequest().put("msg", "(购物前请先登录用户!!)");
			return "login";
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			// 获取购物车
			List<Shopcart> cartList = shopcartService.getCartList(username);
			// 将购物车内容保存到订单
			if (cartList!=null && !cartList.isEmpty()) {
				for(Shopcart cart : cartList){
					orderService.addOrder(username, cart.getFlower().getId(), cart.getTotal());
					shopcartService.delete(cart.getId());
				}
			}
			// 初始化购物车
			SessionUtil.initShopCard(getSession(), shopcartService);
		}
		return "reorder";
	}
	
	
	/**
	 * 我的购物车
	 * @return
	 */
	@Action("cart")
	public String shopcart(){
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			getRequest().put("msg", "(购物前请先登录用户!!)");
			return "login";
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			List<Shopcart> orders = shopcartService.getCartList(username);	//获取订单信息
			getRequest().put("orders", orders);//返回订单信息
		}
		return "cart";
	}
	
	/**
	 * 请求类目列表
	 * @return
	 */
	@Action("category")
	public String category(){
		flowers = flowerService.getFlowers(category);	// 获取某类目下所有鲜花信息
		categories = flowerService.getCategorys();		// 获取所有类目信息
		SessionUtil.initShopCard(getSession(), shopcartService);	// 加载购物车
		return "index";
	}

	/**
	 * 详情
	 * @return
	 */
	@Action("intro")
	public String intro(){
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			List<Shopcart> orders = shopcartService.getCartList(username);	//获取订单信息
			getRequest().put("orders", orders);//返回订单信息
		}
		id= Integer.parseInt(getServletRequest().getParameter("id"));
		flower = flowerService.getFlower(id);
		navigations = flowerService.navigation();
		likeFlowers=flowerService.getLikeFlowers();
		getRequest().put("navigations", navigations);
		getRequest().put("flower", flower);
		getRequest().put("likeFlowers", likeFlowers);
		return "intro";
	}

	/**
	 * 登录页面
	 * @return
	 */
	@Action("loginpage")
	public String loginpage(){
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			List<Shopcart> orders = shopcartService.getCartList(username);	//获取订单信息
			getRequest().put("orders", orders);//返回订单信息
		}
		navigations = flowerService.navigation();
		likeFlowers=flowerService.getLikeFlowers();
		getRequest().put("navigations", navigations);
		return "login";
	}
	
	/**
	 * 顾客登录
	 * @return
	 */
	@Action("login")
	public String login() {
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			List<Shopcart> orders = shopcartService.getCartList(username);	//获取订单信息
			getRequest().put("orders", orders);//返回订单信息
		}
		if(customerService.getCustomer(customer.getUsername(), customer.getPassword())!=null){
			this.getSession().put("username", customer.getUsername());//session中放置用户名, 标志用户已登录
			return "reindex";
		}else {
			this.getRequest().put("msg", "(用户名或密码错误!!)");
			return "login";
		}
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	@Action("logout")
	public String logout(){
		this.getSession().remove("username");
		return "reindex";
	}
	

	/**
	 * 注册页面
	 * @return
	 */
	@Action("registerpage")
	public String registerpage(){
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			List<Shopcart> orders = shopcartService.getCartList(username);	//获取订单信息
			getRequest().put("orders", orders);//返回订单信息
		}
		navigations = flowerService.navigation();
		getRequest().put("navigations", navigations);
		return "register";
	}
	
	/**
	 * 顾客注册
	 * @return
	 */
	@Action("register")
	public String register() {
		// 判断填写信息
		navigations = flowerService.navigation();
		getRequest().put("navigations", navigations);
		if (customer.getUsername()==null || customer.getUsername().trim().isEmpty()
				|| customer.getPassword()==null || customer.getPassword().trim().isEmpty()
				|| customer.getPhone()==null || customer.getPhone().trim().isEmpty()
				|| customer.getAddress()==null || customer.getAddress().trim().isEmpty()) {
			getRequest().put("msg", "(请先填写必要信息!!)");
			return "register";
		}
		// 判断用户名是否已经存在
		if (customerService.isUser(customer)) {
			getRequest().put("msg", "(用户名已存在!!)");
			return "register";
		}
		// 注册用户
		if (customerService.register(customer)) {
			getRequest().put("msg", "(注册成功, 请登录!!)");
			return "login";
		}else {
			getRequest().put("msg", "(系统错误, 注册失败!!)");	//系统原因导致注册失败时,返回注册页面
			return "register";
		}
	}
	
	
	/**
	 * 个人中心
	 * @return
	 */
	@Action("my")
	public String my(){
		if (getSession().get("username")==null) {//如果没有登录  则跳转到登录页面
			
		}else {
			String username = getSession().get("username").toString();//获取用户登录记录
			List<Shopcart> orders = shopcartService.getCartList(username);	//获取订单信息
			getRequest().put("orders", orders);//返回订单信息
		}
		Object username = getSession().get("username");
		//如果没有登录  则跳转到登录页面
		if (username==null || username.toString().trim().isEmpty()) {
			getRequest().put("msg", "(请先登录用户!!)");
			return "login";
		}
		customer = customerService.getCustomer(username.toString());
		navigations = flowerService.navigation();
		likeFlowers=flowerService.getLikeFlowers();
		getRequest().put("navigations", navigations);
		return "my";
	}
	
	
	/**
	 * 更新我的信息
	 * @return
	 */
	@Action("updateMy")
	public String updateMy(){
		
		Customer c = customerService.getCustomer(customer.getUsername());
		c.setPhone(customer.getPhone());
		c.setAddress(customer.getAddress());
		customerService.update(c);
		getRequest().put("msg", "(信息修改成功!)");
		return "my";
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	@Action("updatePassword")
	public String updatePassword(){
		String password1 = getServletRequest().getParameter("password1");
		String password2 = getServletRequest().getParameter("password2");
		if (password1==null || password1.toString().trim().isEmpty()) {
			getRequest().put("msg", "(新密码不能为空!)");
			return "my";
		}
		if(!password1.equals(password2)){
			getRequest().put("msg", "(两次输入新密码不同!)");
			return "my";
		}
		Customer c = customerService.getCustomer(customer.getUsername(), customer.getPassword());
		if (c==null || c.getUsername()==null) {
			getRequest().put("msg", "(原密码错误!)");
			return "my";
		}
		c.setPassword(password1);
		customerService.update(c);
		getRequest().put("msg", "(密码修改成功!)");
		return "my";
	}
	
	
	public Flower getFlower() {
		return flower;
	}

	public void setFlower(Flower flower) {
		this.flower = flower;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public List<Flower> getFlowers() {
		return flowers;
	}

	public void setFlowers(List<Flower> flowers) {
		this.flowers = flowers;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	@Action("flowjson")
	public String test(){
		List<Flower> flowers = flowerService.getHotFlowers(8);
		for(Flower flower:flowers){
			flower.setPhoto(url+flower.getPhoto());
		}
		String cs=JSON.toJSONString(flowers);
		ResponseWrite(cs);
		return null;
	}
	@Action("/decodeUserInfo")
	 public String decodeUserInfo() { 
		String encryptedData=null;
		String iv=null;
		String code=null;
		try {
			encryptedData=new String(getServletRequest().getParameter("encryptedData").getBytes("iso-8859-1"), "utf-8");
			iv=new String(getServletRequest().getParameter("iv").getBytes("utf-8"), "utf-8");
			code=new String(getServletRequest().getParameter("code").getBytes("utf-8"), "utf-8");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	       Map map = new HashMap();  
	  
	       //登录凭证不能为空  
	       if (code == null || code.length() == 0) {  
	           map.put("status", 0);  
	           map.put("msg", "code 不能为空");  
	           String cs=JSON.toJSONString(map);
	   		   ResponseWrite(cs);
	   		   return null;
	       }  
	       //小程序唯一标识   (在微信小程序管理后台获取)  
	       String wxspAppid = "wx66dfc58a3fc37cd5";  
	       //小程序的 app secret (在微信小程序管理后台获取)  
	       String wxspSecret = "75e43195ca6dfebe63a68e77117d4ab5";  
	       //授权（必填）  
	       String grant_type = "authorization_code";  
	       //////////////// 1、向微信服务器 使用登录凭证 code 获取 session_key 和 openid ////////////////  
	       //请求参数  
	       String params = "appid=" + wxspAppid + "&secret=" + wxspSecret + "&js_code=" + code + "&grant_type=" + grant_type;  
	       //发送请求  
	       String sr = HttpRequest.sendGet("https://api.weixin.qq.com/sns/jscode2session", params);  
	       //解析相应内容（转换成json对象）  
	       JSONObject json = JSONObject.parseObject(sr);  
	       //获取会话密钥（session_key）  
	       String session_key = json.get("session_key").toString();  
	       //用户的唯一标识（openid）  
	       String openid = (String) json.get("openid");  
	  
	       //////////////// 2、对encryptedData加密数据进行AES解密 ////////////////  
	       try {  
	           String result = AesUtil.decrypt(encryptedData, session_key, iv, "UTF-8");  
	           if (null != result && result.length() > 0) {  
	               map.put("status", 1);  
	               map.put("msg", "解密成功");  
	  
	               JSONObject userInfoJSON = JSONObject.parseObject(result);  
	               Map userInfo = new HashMap();  
	               userInfo.put("openId", userInfoJSON.get("openId"));
	               
	               customer.setUsername((String)userInfoJSON.get("openId"));
	               if (customerService.isUser(customer)) {
	            	  userInfo.put("isSave", "1");
	            	  customer=customerService.getCustomer(customer.getUsername());
	            	  userInfo.put("address",customer.getAddress());
	            	  userInfo.put("phone",customer.getPhone());
	       		   }else{
	       			 userInfo.put("isSave", "0");
	       		   }
	               userInfo.put("nickName", userInfoJSON.get("nickName"));  
	               userInfo.put("gender", userInfoJSON.get("gender"));  
	               userInfo.put("city", userInfoJSON.get("city"));  
	               userInfo.put("province", userInfoJSON.get("province"));  
	               userInfo.put("country", userInfoJSON.get("country"));  
	               userInfo.put("avatarUrl", userInfoJSON.get("avatarUrl"));  
	               userInfo.put("unionId", userInfoJSON.get("unionId"));  
	               map.put("userInfo", userInfo); 
	               String cs=JSON.toJSONString(map);
		   		   ResponseWrite(cs);
	               return null;  
	           }  
	       } catch (Exception e) {  
	           e.printStackTrace();  
	       }  
	       map.put("status", 0);  
	       map.put("msg", "解密失败");
	       String cs=JSON.toJSONString(map);
  		   ResponseWrite(cs);
	       return null;  
	   }  
	@Action("weixinRegister")
	public String weixinRegister(){
		try {
			customer.setUsername(new String(getServletRequest().getParameter("username").getBytes("utf-8"), "utf-8"));
			customer.setAddress(new String(getServletRequest().getParameter("address").getBytes("utf-8"), "utf-8"));
			customer.setPhone(new String(getServletRequest().getParameter("phone").getBytes("utf-8"), "utf-8"));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		customer.setPassword("weixin");
		if(customerService.isUser(customer)){
			customerService.update(customer);
		}else{
			customerService.add(customer);
		}
		return null;
	}
	@Action("flowlist")
	public String flowlist(){
		String flowerid=null;
		try {
			flowerid=new String(getServletRequest().getParameter("id").getBytes("utf-8"), "utf-8");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		Flower flower = flowerService.getFlower(Integer.parseInt(flowerid));
		flower.setPhoto(url+flower.getPhoto());
		String cs=JSON.toJSONString(flower);
		ResponseWrite(cs);
		return null;
	}
	@Action("categorylist")
	public String categorylist(){
		List<Category> category = flowerService.getCategorys();
		String cs=JSON.toJSONString(category);
		ResponseWrite(cs);
		return null;
	}
	@Action("categoryflows")
	public String categoryflows(){
		String categoryid=null;
		try {
			categoryid=new String(getServletRequest().getParameter("id").getBytes("utf-8"), "utf-8");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		List<Flower> flower = flowerService.getFlowers(Integer.parseInt(categoryid));
		for(Flower flo:flower){
			flo.setPhoto(url+flo.getPhoto());
		}
		String cs=JSON.toJSONString(flower);
		ResponseWrite(cs);
		return null;
	}
	@Action("cartList")
	public String cartList(){
		String username=null;
		try {
			username=new String(getServletRequest().getParameter("username").getBytes("utf-8"), "utf-8");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		List<Shopcart> orders = shopcartService.getCartList(username);	//获取订单信息
		for(Shopcart c:orders){
			c.getFlower().setPhoto(url+c.getFlower().getPhoto());
		}
		String cs=JSON.toJSONString(orders);
		ResponseWrite(cs);
		return null;
	}
	@Action("addToCart")
	public String addToCart(){
		String username=null;
		String numb=null;
		String id=null;
		try {
			username=new String(getServletRequest().getParameter("username").getBytes("utf-8"), "utf-8");
			numb=new String(getServletRequest().getParameter("numb").getBytes("utf-8"), "utf-8");
			id=new String(getServletRequest().getParameter("id").getBytes("utf-8"), "utf-8");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		for(int i=0;i<Integer.parseInt(numb);i++){
			if (shopcartService.get(username, Integer.parseInt(id))==null) {//若没有次订单
				shopcartService.add(username, Integer.parseInt(id));	//添加订单记录
			}else {	//否则更新订单即可
				shopcartService.updateCart(username, Integer.parseInt(id));
			}
		}
		Flower flower = flowerService.getFlower(Integer.parseInt(id));//获取鲜花信息
		flower.setStock(flower.getStock()-Integer.parseInt(numb));//鲜花库存数量-1
		flowerService.update(flower);//更新鲜花信息
		return null;
	}
	@Action("cartListdel")
	public String cartListdel(){
		String id=null;
		try {
			id=new String(getServletRequest().getParameter("id").getBytes("utf-8"), "utf-8");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		shopcartService.delete(Integer.valueOf(id));
		return null;
	}
	@Action("cartdel")
	public String cartdel(){
		String id=null;
		try {
			id=new String(getServletRequest().getParameter("id").getBytes("utf-8"), "utf-8");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		Shopcart s=shopcartService.find(Integer.parseInt(id));
		s.setTotal(s.getTotal()-1);;
		shopcartService.updata(s);;
		return null;
	}
	@Action("cartsubmit")
	public String cartsubmit(){
		String ids=null;
		try {
			ids=new String(getServletRequest().getParameter("cartsids").getBytes("utf-8"), "utf-8");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		List<String> cartsids = JSON.parseArray(ids, String.class);
		List<Shopcart> cartList=new ArrayList<Shopcart>();
		for(String s:cartsids){
			Shopcart sc = shopcartService.find(Integer.parseInt(s));
			cartList.add(sc);
		}
	
		// 将购物车内容保存到订单
		if (cartList!=null && !cartList.isEmpty()) {
			for(Shopcart cart : cartList){
				orderService.addOrder(cart.getCustomer().getUsername(), cart.getFlower().getId(), cart.getTotal());
				shopcartService.delete(cart.getId());
			}
		}
		return null;
	}
	
}
