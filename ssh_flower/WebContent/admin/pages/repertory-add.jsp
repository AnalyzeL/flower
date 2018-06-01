<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<link type="text/css" href="css/admin.css" rel="stylesheet">
</head>
<body>
	<table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
		<tr height=28><td background="images/title_bg1.jpg">当前位置 &raquo;虚拟库存</td></tr>
		<tr><td bgcolor=#b1ceef height=1></td></tr>
		<tr height=20><td background="images/shadow_bg.jpg"></td></tr>
	</table>


		<form action="RepertoryAdd.action" method="post">
			鲜花种类:<select name="repertory.flowerID" style="width:100px">
				<option value="0">全部</option>
				<s:iterator value="#request.flowers">
					<option value=<s:property value="id"/>>
						<s:property value="name"/>
					</option>
				</s:iterator>
			</select><br>
			线下商店:<select name="repertory.offlinestoreId" style="width:100px">
				<option value="0">全部</option>
				<s:iterator value="#request.offlinestores">
					<option value=<s:property value="id"/>>
						<s:property value="storeName"/>
					</option>
				</s:iterator>
			</select><br>
			入库数量:<input type="text" name="repertory.num" required="required"/><br>
					<input type="submit" value="添加"><font color=red>${msg}</font>
		</form>

</body>
</html>