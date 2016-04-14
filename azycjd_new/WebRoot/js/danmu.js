$("#shadowBoxHide").click(function(){
   $("#shadowBox").hide(500);
   $(".input_danmu").hide(500);
   $("#shadowBoxShow").show(800);
});
$("#shadowBoxShow").click(function(){
   $(".input_danmu").show(500);
   $("#shadowBox").show(500);
   $(this).hide()
})
$("#post_danmu").click(function(){
	var data = {
	   text : $("#danmu_value").val(),
	   color :  $("#danmu_fontColor option:selected").val(),
	   fontSize : $("#danmu_fontSize option:selected").val()
   };

  initScreen('shadowBox','danmu',15000,data);
});
// initial danmu 
function initScreen(shabowBox,danmu,timer,data){
	var _top = 0;
	var _width = $("#"+shabowBox+"").width();
	var _height = $("#"+shabowBox+"").height();
	$("#"+danmu+"").append("<div style='font-size:"+data['fontSize']+";color:"+data['color']+"'>"+data['text']+"</div>");
	$("#"+danmu+"").find('div').each(function(){	
		_top += 20 ;
		if(_top >= _height-20)
		    _top = 0 ;
		$(this).css( {left:_width,top:_top} );
		$(this).animate({left:"-200px"},timer,function(){
			$(this).hide().remove();
		});
	});
};