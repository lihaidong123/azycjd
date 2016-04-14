<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <script type="text/javascript">
 	function showfileupload(domid){
 		$.jBox("iframe:"+path+"/uploadFile.jsp?domid="+domid, {
 			title: "文件上传",
 			width: 700,
 			height: 400,
 			id:'uploadfilewin',
 			top:150,
 			buttons: { '关闭': true },
 			submit:function(v, h, f){
 				
 				return true;
 			},
 			closed:function(){
 				$("#xetbody").css("padding","0px").css("margin","0px").css("min-width","1300px");
 			}
 		});
 	}
 	
 	$(function(){
 		$(".uploadfilecss").each(function(){
 			$(this)[0].readonly=true;
 		});
 		$(".uploadfilecss").dblclick(function(){
 			showfileupload($(this)[0].id);
 		});
 		
 		$("#needDisableDiv .txt").each(function(){
			$(this)[0].disabled=true;
		});
 	});
 </script>

