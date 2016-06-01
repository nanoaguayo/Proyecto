$(document).on("page:change",function(){
	//Paginacion
	var $productos = $('.photo');
	var product_number = 4;
	var pag_actual=1;
	var pages=1;
	if($productos.length%4==0)
		pages = $productos.length/4;
	else
		pages = ($productos.length/4) +1;

	var HasNext = function(){
		return pag_actual<pages
	};

	var LoadNext = function(){
		pag_actual++
		var URL = "page/"+pag_actual+".json"

		$.ajax({

		  "url": URL,
	      "dataType": "json",
	      "success": function(data, ts, jq) {
	        //Cargamos los id
	        var id1 = data.id1
	        var id2 = data.id2
	        var id3 = data.id3
	        var id4 = data.id4

	        //Ahora transformamos estas clases en visibles y las otras en hide
	        $('.photo').addClass("hide");
	        var $e1 = $('#'+id1);

	      },
	      "error": function(jq, st, er) {
	        console.log("ERROR :(", jq, st, er);
	      }
		})
	};

	//Vista previa
	$(".image-cont a").each(function(i,obj){

	
	  var $prodLinks = $(obj);


	  var ShowProd = function(prodInfo) {
	   
	    $div = $("<div class='prod-preview'>" +
	            "<h1 style='text-align:center'>"+ prodInfo.name +"</h1>" +
	            "<p class='description'>"+ prodInfo.desc +"</p>" +
	            "<a href='"+ prodInfo.url + "' style='object-position:center'>Ir al producto</a>" +
	        "</div>");

	    $(".photo").css("z-index",1);

	    var position = $(obj).parent().position();

	
	    $div.appendTo(".catalogo");
	    $div.offset({top: position.top,left: position.left});
	    $(".prod-preview").css("z-index",1000);
	    $(".prod-preview").css("width","30%").css("background-color","gray");
	    $(".prod-preview").mouseleave(function(ev){
	    	ev.preventDefault();
	    	$(".prod-preview").remove();
	    });
	  }


	  $prodLinks.mouseenter(function(ev){

	  	$(".prod-preview").remove();
	    ev.preventDefault();

	    var $link = $(this);

	    //alert($link.data());

	    var sourceUrl = $link.data('purl');
	    

	    $.ajax({
	      
	      "url": sourceUrl,
	      "dataType": "json",
	      "success": function(data, ts, jq) {
	        console.log("success: ", data)
	        ShowProd(data);
	      },
	      "error": function(jq, st, er) {
	        console.log("ERROR :(", jq, st, er);
	      }
	    });

	  });


	});//function 4 each

});//doc ready