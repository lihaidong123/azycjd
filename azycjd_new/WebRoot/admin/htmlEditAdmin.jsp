<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/js/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/js/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">var domid='${param.domid}';</script>
<script>
	var chooseUploadBtnId;
	$(function() {
	
		var editor = KindEditor.editor({
			allowFileManager : true,
			cssPath : '<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/file_manager_json.jsp'
		});
		
		
		editor1 = KindEditor.create('textarea[class="htmlEditCss"]', {
			cssPath : '<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/file_manager_json.jsp',
			items : [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link'],
			
			resizeType:0,
			afterBlur : function(ob) {
				var self = this;
				self.sync();
				KindEditor.ctrl(document, 13, function() {
					self.sync();
					KindEditor('form[title=htmlEditForm')[0].submit();
				});
				KindEditor.ctrl(self.edit.doc, 13, function() {
					self.sync();
					KindEditor('form[title=htmlEditForm')[0].submit();
				});
			},
			afterChange : function() {
				try{
					KindEditor('#chapterCharNum').val(this.count('text'));
				}catch(e){}
			},
			afterUpload:function(url){
				
			}
		});
		
		
		KindEditor('.uploadBtnCss').click(function() {
			chooseUploadBtnId=$(this)[0].id;
			if(chooseUploadBtnId==null||chooseUploadBtnId==""||chooseUploadBtnId=="null"){
				alert("当前上传按钮没有按规则命名id");
				return;
			}
			chooseUploadBtnId=chooseUploadBtnId.substring(0,chooseUploadBtnId.length-3);
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : KindEditor('#url3').val(),
					clickFn : function(url, title, width, height, border, align) {
						$("#"+chooseUploadBtnId).val(url);
						editor.hideDialog();
					}
				});
			});
		});
		
		
		try{
			prettyPrint();
		}catch(e){
		}
	});
</script>