<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table>
  <tr>
    <td><span id="qqLoginBtn"></span></td>
    <td style="padding-left: 20px;"><span id="wb_connect_btn"></span></td>
  </tr>
</table>
<script type="text/javascript">
    QC.Login({
       btnId:"qqLoginBtn"    //插入按钮的节点id
});
</script>

<script type="text/javascript">
	WB2.anyWhere(function (W) {
	    W.widget.connectButton({
	        id: "wb_connect_btn",
	        type: '3,2',
	        callback: {
	            login: function (o) { //登录后的回调函数
	                weiboLogin(o);
	            },
	            logout: function () { //退出后的回调函数
	                
	            }
	        }
	    });
	});
</script>
