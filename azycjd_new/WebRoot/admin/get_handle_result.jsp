<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<tr>
	<td colspan="${param.colspanNum }" valign="top">
		<div class="look_result_hand" style="margin: 10px;text-align: right;padding-right: 30px;">
			<a href="javascript:;" onclick="$('#handle_result${param.tableId }').slideToggle()">查看处理结果</a>
			<%-- <input class="saveBtnCss" type="button" value="查看处理结果" style="width:150px;" onClick="$('#handle_result${param.tableId }').slideToggle()"/> --%>
		</div>
		<div id="handle_result${param.tableId }" class="handle_result_css" style="display: none;">
			
		</div>
	</td>
</tr>
<script language="javascript">
	addHandeResultLoadTableId('${param.tableId}','${param.handleType}');
</script>