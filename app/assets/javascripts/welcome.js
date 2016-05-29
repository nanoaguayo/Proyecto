$(document).on("page:change",function(){

	
	$("img").each(function(i,obj){

		
		var alto;
		var ancho;
		var position;
		var clone;

		position = $(obj).position();
		alto = $(obj).heigth;
		ancho = $(obj).width;


		clone = $(obj).clone();
		$(clone).addClass("img-clon");

		$(obj).mouseenter(function(e){

			$("img-clon").animate({height:alto,width:ancho},200,function(){$(this).remove();});
			$(".image_cont").css("z-index",1);
			$(clone).css("z-index",1000).css("top",position.top).css("left",position.left).css("border","2px solid orange");

			$(clone).appendTo(".catalogo").css("position","absolute").animate({
				height:alto,
				width:ancho
				},200,function(){

					$(obj).mouseleave(function(e){

						$(clone).animate({
							height: alto,
							width: ancho

						},10,function(){$(clone).remove();});
					});

			});//mouseout

		});//mouseover


	});//function 4 each

});//doc ready