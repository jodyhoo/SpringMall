



function uploadImgBox0(){
	//1.set content of selector result as empty.
    $('#imgbox0').html('');
    $("#form0"  ).ajaxForm({
        success:function(data) { 
              $('#imgbox0').html(data);
    },
     dataType:"text"
   }).submit();
}


function uploadImgBox1(){
	//1.set content of selector result as empty.
    $('#imgbox1').html('');
    $("#form1").ajaxForm({
        success:function(data) { 
              $('#imgbox1').html(data);
    },
     dataType:"text"
   }).submit();
}


function uploadImgBox2(){
	//1.set content of selector result as empty.
    $('#imgbox2').html('');
    $("#form2").ajaxForm({
        success:function(data) { 
              $('#imgbox2').html(data);
    },
     dataType:"text"
   }).submit();
}


function uploadImgBox3(){
	//1.set content of selector result as empty.
    $('#imgbox3').html('');
    $("#form3").ajaxForm({
        success:function(data) { 
              $('#imgbox3').html(data);
    },
     dataType:"text"
   }).submit();
}


function uploadImgBox4(){
	//1.set content of selector result as empty.
    $('#imgbox4').html('');
    $("#form4").ajaxForm({
        success:function(data) { 
              $('#imgbox4').html(data);
    },
     dataType:"text"
   }).submit();
}


function uploadImgBox5(){
	//1.set content of selector result as empty.
    $('#imgbox5').html('');
    $("#form5").ajaxForm({
        success:function(data) { 
              $('#imgbox5').html(data);
    },
     dataType:"text"
   }).submit();
}


// page image upload.
$(document).ready( function() {
	
	var pagePath = $('#pageContent').attr('value');
	
    $.ajax({
        url      : pagePath,
        dataType : "text",
        success  : function (data) {
            $("#pageImgBlock").html(data);
        }
    });
	
	
});


var uploadPageImg = function() {
	
	// 1.page display.
	var block = document.getElementById('pageImgBlock');
	var files = document.getElementById('pageImg').files;
	
	console.log( "length -- " + files.length );
	
	for ( var i = 0 ; i < files.length ; i++ ) {

		var file       = files[i];
		var filereader = new FileReader();
			filereader.readAsDataURL(file);
			filereader.onload = function(fileevent) {
				var srcData = fileevent.target.result;
				var img     = new Image();
					img.src = srcData;
					block.appendChild(img);
			}
	}
	
	
	// 2.page record.
	var formdata = new FormData();
		formdata.append( 'userPage' , document.getElementById('pageImgBlock').outerHTML );
    
	$.ajax( {
		url      : 'pageImgUploader'   ,
		data     :  formdata  ,
		type     : 'POST'     ,
		
		contentType : false   ,
		processData : false   ,
		
		success     : function(data) {
			$('#msg').append(data);
		}
		
	});
	
}


