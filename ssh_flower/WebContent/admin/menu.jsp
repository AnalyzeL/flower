<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<head>
	<meta http-equiv=content-type content="text/html; charset=gb2312">
	<link href="css/admin.css" type="text/css" rel="stylesheet">

	<!-- 开合左侧菜单栏 -->
	<script language=javascript>
		function expand(el){
			childObj = document.getElementById("child" + el);
			if (childObj.style.display == 'none')
			{childObj.style.display = 'block';}
			else
			{childObj.style.display = 'none';}
			return;
		}
	</script>
</head>
<body>
	<table height="100%" cellspacing=0 cellpadding=0 width=170 background="images/menu_bg.jpg" border=0>
		<tr>
		<td valign=top align="center">
			<!--菜单栏上部-->
			<table cellspacing=0 cellpadding=0 width="100%" border=0>
				<tr><td height=20></td></tr>
			</table>
			
			<!--菜单栏1-->
			<table cellspacing=0 cellpadding=0 width=150 border=0>
				<tr height=22>
					<td style="padding-left: 30px" background="images/menu_bt.jpg">
						<a class=menuparent onclick=expand(1) href="javascript:void(0);">订单管理</a>
					</td>
				</tr>
				<tr height=4><td></td></tr>
			</table>
				<!--菜单子项1-->
				<table id=child1 cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="orderList.action" target=main>未处理订单</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="orderLists.action" target=main>已处理订单</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
				</table>
			
			<!--菜单栏2-->
			<table cellspacing=0 cellpadding=0 width=150 border=0>
				<tr height=22>
					<td style="padding-left: 30px" background="images/menu_bt.jpg">
						<a class=menuparent onclick=expand(2) href="javascript:void(0);">鲜花管理</a>
					</td>
				</tr>
				<tr height=4><td></td></tr>
			</table>
				<!--菜单子项2-->
				<table id=child2 cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="flowerList.action" target=main>鲜花列表</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="flowerAddpage.action" target=main>添加鲜花</a></td>
					</tr>  
					<tr height=4><td colspan=2></td></tr>
				</table>

			<!--菜单栏3-->
			<table cellspacing=0 cellpadding=0 width=150 border=0>
				<tr height=22>
					<td style="padding-left: 30px" background="images/menu_bt.jpg">
						<a class=menuparent onclick=expand(3) href="javascript:void(0);">顾客管理</a>
					</td>
				</tr>
				<tr height=4><td></td></tr>
			</table>
				<!--菜单子项3-->
				<table id=child3 cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="customerList.action" target=main>顾客列表</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="customerAddpage.action" target=main>添加顾客</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="customerClass.action" target=main>顾客分类</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="customerclassAddpage.action" target=main>添加顾客分类</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
				</table>
				
			<!--菜单栏4-->
			<table cellspacing=0 cellpadding=0 width=150 border=0>
				<tr height=22>
					<td style="padding-left: 30px" background="images/menu_bt.jpg">
						<a class=menuparent onclick=expand(4) href="javascript:void(0);">掌柜管理</a>
					</td>
				</tr>
				<tr height=4><td></td></tr>
			</table>
				<!--菜单子项4-->
				<table id=child4 cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="managerList.action" target=main>掌柜列表</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="managerAddpage.action" target=main>添加掌柜</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
				</table>
				<table cellspacing=0 cellpadding=0 width=150 border=0>
				<tr height=22>
					<td style="padding-left: 30px" background="images/menu_bt.jpg">
						<a class=menuparent onclick=expand(4) href="javascript:void(0);">物流管理</a>
					</td>
				</tr>
				<tr height=4><td></td></tr>
			</table>
				<!--菜单子项4-->
				<table id=child4 cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="LogisticsList.action" target=main>物流列表</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="LogisticsAddpage.action" target=main>添加物流</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
				</table>
		<table cellspacing=0 cellpadding=0 width=150 border=0>
				<tr height=22>
					<td style="padding-left: 30px" background="images/menu_bt.jpg">
						<a class=menuparent onclick=expand(4) href="javascript:void(0);">线下商店管理</a>
					</td>
				</tr>
				<tr height=4><td></td></tr>
			</table>
				<!--菜单子项4-->
				<table id=child4 cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="offlinestoreList.action" target=main>商店列表</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="offlinestoreAddpage.action" target=main>添加商店</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
				</table>
				<table cellspacing=0 cellpadding=0 width=150 border=0>
				<tr height=22>
					<td style="padding-left: 30px" background="images/menu_bt.jpg">
						<a class=menuparent onclick=expand(4) href="javascript:void(0);">虚拟库存</a>
					</td>
				</tr>
				<tr height=4><td></td></tr>
			</table>
				<!--菜单子项4-->
				<table id=child4 cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="RepertoryList.action" target=main>库存列表</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
					<tr height=20>
						<td align="center" width=30><img height=9 src="images/menu_icon.jpg" width=9></td>
						<td><a class=menuchild href="RepertoryAddpage.action" target=main>添加库存</a></td>
					</tr>
					<tr height=4><td colspan=2></td></tr>
				</table>
</body>



