$(document).on("page:change",function(){

	
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
	    $(".prod-preview").mouseleave(function(){$(".prod-preview").remove();});
	  }


	  $prodLinks.on('mouseenter',function(ev){

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