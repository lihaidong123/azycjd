<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/js/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/js/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">var domid='${param.domid}';</script>
<script>
	var chooseUploadBtnId;
	KindEditor.ready(function(K) {
	
		var editor = K.editor({
			allowFileManager : true,
			cssPath : '<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/file_manager_json.jsp'
		});
		
		
		editor1 = K.create('textarea[class="htmlEditCss"]', {
			cssPath : '<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/file_manager_json.jsp',
			items : [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link','fullscreen'],
			
			resizeType:0,
			width:820,
			afterBlur : function(ob) {
				var self = this;
				self.sync();
				K.ctrl(document, 13, function() {
					self.sync();
					K('form[title=htmlEditForm')[0].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					K('form[title=htmlEditForm')[0].submit();
				});
			},
			afterChange : function() {
				try{
					K('#chapterCharNum').val(this.count('text'));
				}catch(e){}
			},
			afterUpload:function(url){
				
			}
		});

		
		try{
			prettyPrint();
		}catch(e){
		}
	});
</script>