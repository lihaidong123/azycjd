<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script language="javascript">
	$(function(){
		
		$("#mainContent tr:even").each(function(){
			$(this).css("background-color","#eaf1f5");
		});
		loadHandleResult();
	});
</script>