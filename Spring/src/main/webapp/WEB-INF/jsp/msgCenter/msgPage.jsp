<%@ page language    ="java" 
		 contentType ="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
	
		<title>客服</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<script src="jQuery 3.3.1.js"></script>

		<style>
			.block { height:400px; 
				     width:800px; 
				     overflow-y:auto; 
				     overflow-x:hidden; 
				     padding: 20px; 
				     border: 1px 
				     solid #969696; }
		</style>

		<style>

			.gap         	 {  clear       : both;   }

			.core       	 {
								position   : relative;
								margin      :  0 auto;
								margin-top  : 20px;
								height      : 630px;
								width       : 1100px;
								border      :   1px solid #f6f6f6;
							 }
			.msgcore         {
								position    : relative;
								float       : left;
								z-index     : 1; 
								margin-left : 20px;
								margin-top  : 20px;
								padding     :  0px;  								
								height      : 360px;
								width       : 800px;
								background-color : #fcfcfc;
								border      :   0px solid #ccc;
							 }
			.message 		 {
								position    : relative;
								float       : left;
								z-index     : 1; 
								overflow-x  : none;
								overflow-y  : auto;
								padding     : 10px;
								height      : 340px;
								width       : 780px;
								background-color : #fcfcfc;
								border      :   1px solid #ccc;
						 	 }
			.messagedefault  {
								z-index       : 0;
							 }			 	 
			.msga            {
								position      : relative;
								float         :   left;
								margin-top    :     0px;	
								margin-bottom :   -18px;
								width         :   483px;
								border        :     0px solid #222;
							 }
			.usera           {
								position    : static;
								float       :   left;
								width       :  50px;
								height      :  50px;
								overflow    :  hidden; 
								border      :   1px solid #ccc;
							 } 
			.texta           {
								position  		 : static;
								float            : left;
								margin-left      : 10px;
								border-radius    : 5px;
								width            : 350px;
								padding          :  10px; 
								background-color :  #fff;
								border           :   1px solid #ccc;
							 }
			.timea           {
								  position       : absolute;
								  bottom         :  12px;
								  right          :   0;
								  border         :   0px solid #ccc;
							 }

			.msgb            {
								position    : relative;
								float       :   right;
								margin-top    :     0px;	
								margin-bottom :   -18px;
								width       :  483px;
								border      :   0px solid #222;
							 }
			.userb           {
								position    : relative;
								float       : right;
								width       :  50px;
								height      :  50px;
								border      :   1px solid #ccc;
							 }
			.textb           {
								position  		 : static;
								float            : right;
								margin-right     :  10px;
								/*margin-bottom    :  22px; */
								border-radius    :   5px;
								width            : 350px;
								padding          :  10px; 
								color            : #fff;
								background-color : #1e325c; 
								/* background-color :  #5bbd31; */
								border           :   1px solid #ccc;
							 }
			.timeb           {
								position         : absolute;
								left             :   0;
								bottom           :  12px;
								border           :   0px solid #ccc;
							 }
			.msgimg          {
								max-width        :  350px; 
							 }				 


			.functionrow     {
								position    : relative;
								float       : left;
								margin-top  : 10px;
								margin-left : 20px;  
								height      :  30px;
								width       : 800px;
								border      :   1px solid #f6f6f6;
							 }

			.newmessage 	 {
								position    : relative;
								float       : left;
								margin-top  : 10px;
								margin-left : 20px;  
								overflow-x  : none;
								overflow-y  : auto;  	
								padding     : 10px;  								
								height      : 130px;
								width       : 780px;
								border      :   1px solid #ccc;
							 }
							 
			.userlist     	 {
								position     : relative;
								float        : right;
								margin-top   :  20px;
								margin-left  :  20px;  
								margin-right :  20px;
								overflow-x   : none;
								overflow-y   : auto;  
								height  	 : 360px;
								width   	 : 230px;
								border  	 :   1px solid #ccc;
							 }	
			.user            {
								position   : relative;
								float      : left;
								margin-top :   8px; 
								text-align :  center; 
								cursor     : default;
								height     :  30px;
								width      : 228px;
								border     :   1px solid #eee;
							 }
			.userfunc        {
								position   : relative;
								float      : left;
								margin-top :   8px; 
								text-align :  center; 
								cursor     : default;
								height     :  30px;
								width      : 228px;
								border     :   1px solid #eee;
							 }				 
			.userimg         {
								position   : relative;
								float      :   left;
								height     :  30px;
								width      :  30px;
								overflow   :  hidden;
								border     :   1px solid #ccc;
							 } 
			.usertext        {
								position   : relative;
								float      :   left;
								margin-top :   6px;
								text-align :  center; 
								font-size  :  14px; 
								height     :  18px;
								width      : 195px;
								border     :   0px solid #eee;
							 }


			.sendbox 		 {
								position     : relative;
								float        : right;
								margin-top   :  10px;
								margin-left  :  20px;  
								margin-right :  20px;
								height       : 150px;
								width        : 230px;
								border       :   1px solid #ccc;
							 }
			.send     	 	 {
							 }

		</style>

	</head>

	<body>

		<div class="core" id="core">

			<div class="msgcore" id="msgcore">

				<div class="message messagedefault" id="messagedefault"></div>

				<div class="message" id="用户A">

					<div class="msga">
						<p class="usera">
							<img height="50" src="img/user/2.jpg" />
						</p>
						<p class="texta">你好</p>
						<p class="timea">17:08</p>
					</div>

					<div class="msgb">
						<p class="userb">
							<img width="50" src="img/user/1.jpg" />
						</p>
						<p class="textb">你好</p>
						<p class="timeb">17:08</p>
					</div>

					<div class="msga">
						<p class="usera">
							<img height="50" src="img/user/2.jpg" />
						</p>
						<p class="texta">今晚约吗?</p>
						<p class="timea">17:08</p>
					</div>

					<div class="msgb">
						<p class="userb">
							<img width="50" src="img/user/1.jpg" />
						</p>
						<p class="textb">好</p>
						<p class="timeb">17:08</p>
					</div>

				</div>

			</div>

			<!-- users -->
			<div class="userlist" id="userlist">

				<div class="userfunc" name="adduser">
					<div class="userimg" >
						<input type  = "button" 
						       style = "background-color:#fefefe; border:0px; margin-top:-1px; height:31px; width:31px; " 
						       value = "+" />
					</div>
				</div>

				<div class="userfunc" name="index">
					<div class="userimg" >
						<input type  = "button" 
						       style = "background-color:#fefefe; border:0px; margin-top:-1px; height:31px; width:31px; " 
						       value = "&#128270;" />
					</div>
					<div class="usertext" contenteditable="true"></div>
				</div>

				<div class="user" name="用户A">
					<div class="userimg" >
						<img width="30" src="img/user/1.jpg" />
					</div>
					<div class="usertext">用户A</div>
				</div>

				<div class="user" name="用户B">
					<div class="userimg" >
						<img height="30" src="img/user/2.jpg" />
					</div>
					<div class="usertext">用户B</div>
				</div>

				<div class="user" name="用户C">
					<div class="userimg" >
						<img width="30" src="img/user/3.jpg" />
					</div>
					<div class="usertext">用户C</div>
				</div>

				<div class="user" name="用户D">
					<div class="userimg" >
						<img height="30" src="img/user/4.jpg" />
					</div>
					<div class="usertext">用户D</div>
				</div>

				<div class="user" name="用户E">
					<div class="userimg" >
						<img width="30" src="img/user/5.jpg" />
					</div>
					<div class="usertext">用户E</div>
				</div>

			</div>

			<div class="functionrow">
				<span>
					<button>插入表情</button>
					<button>字体大小</button>
					<button>字体颜色</button>
					<button id="cleancontent">清除聊天记录</button>
				</span>
				<span>
					<form>
						<input type="file" name="file" onchange="uploadimg()" id="file" value="插入图片" multiple/>
					</form>
				</span>
			</div>

			<div class="newmessage" id="newmessage" contenteditable="true">message box</div>

			<div class="sendbox" id="sendbox">
				<button class="send" id="send">发送</button>
			</div>

		</div>
		
		<script>


			// 1.click send.
			//   default.
			var user       = document.getElementById( '用户A' );
			var send       = document.getElementById(       'send' );
			var newmessage = document.getElementById( 'newmessage' );

			// local send message.
			var sendmsg    = function(event) {

				var msgb   = document.createElement('div');
					msgb.className = 'msgb';
					
				var userb  = document.createElement('p');
					userb.className = 'userb';

				var imgb   = document.createElement('img');
					imgb.height = '50';
					imgb.src    = 'img/user/1.jpg';

					userb.appendChild(imgb);

				var textb  = document.createElement('p');
					textb.className = 'textb';
				var newmsg = document.createTextNode(String(newmessage.innerHTML));
					textb.appendChild(newmsg);

				var timeb  = document.createElement('p');
					timeb.className = 'timeb';
				var time   = document.createTextNode('17:08');
					timeb.appendChild(time);

					msgb.appendChild(userb);
					msgb.appendChild(textb);
					msgb.appendChild(timeb);

					console.log( user.className );

					user.appendChild(msgb);

					console.log( 'finish...' );
				// message.appendChild();

			}

					send.addEventListener( 'click' , sendmsg , false );


			// insert img.
			var sendimg   = function(img) {

				var msgb   = document.createElement('div');
					msgb.className = 'msgb';
					
				var userb  = document.createElement('p');
					userb.className = 'userb';

				var imgb   = document.createElement('img');
					imgb.height = '50';
					imgb.src    = 'img/user/1.jpg';

					userb.appendChild(imgb);
					
				var textb  = document.createElement('p');
					textb.className = 'textb';

					img.className   = 'msgimg';

					textb.appendChild(img);

				var timeb  = document.createElement('p');
					timeb.className = 'timeb';
				var time   = document.createTextNode('17:08');
					timeb.appendChild(time);

					msgb.appendChild(userb);
					msgb.appendChild(textb);
					msgb.appendChild(timeb);

					console.log( user.className );

					user.appendChild(msgb);

			}


			// recieve message. 
			var sendmsga    = function(event) {

				var msga   = document.createElement('div');
					msga.className = 'msga';
					
				var usera  = document.createElement('p');
					usera.className = 'usera';

				var imga   = document.createElement('img');
					imga.height = '50';
					imga.src    = 'img/user/2.jpg';

					usera.appendChild(imga);

				var texta  = document.createElement('p');
					texta.className = 'texta';
				var newmsg = document.createTextNode(String(newmessage.innerHTML));
					texta.appendChild(newmsg);

				var timea  = document.createElement('p');
					timea.className = 'timea';
				var time   = document.createTextNode('17:08');
					timea.appendChild(time);

					msga.appendChild(usera);
					msga.appendChild(texta);
					msga.appendChild(timea);

					user.appendChild(msga);

					console.log( 'finish...' );

					console.log( 'finish...' );
			}
			
			send.addEventListener( 'mouseup' , sendmsga , false );

			/* userlist part. */
			var userlist       = document.getElementById('userlist');

			var newuser        = function(user) {

				var userrow            = document.createElement('div');
					userrow.className  = 'user';

				var userimg            = document.createElement('div');
					userimg.className  = 'userimg';

				var img                = document.createElement('img');
					img.width          = '30';
					img.src            = 'img/user/3.jpg';

				var username           = document.createElement('div');
					username.className = 'usertext';

				var usernametext       = document.createTextNode(user);

					username.appendChild(usernametext);

					userimg.appendChild(      img  );

					userrow.appendChild(  userimg  );
					userrow.appendChild(  username );

					userlist.appendChild( userrow  );

			}
					/* append users */
					newuser('用户F');


			var messagedefault = document.getElementById('messagedefault');
			var messages       = document.getElementsByClassName('message');
			var hidemessages   = function(event) {
				for( var i = 0 ; i < messages.length ; i++ ) 
					messages[i].style.display    = 'none';
			}
			var showdefaultmsg = function(event) {
				user.style.display = 'block';
			}

				hidemessages();
				showdefaultmsg();


			/*  */
			var userlist = document.getElementById('userlist');

			var users    = userlist.getElementsByClassName('user');

			var newmsg   = function(username) {

				var message           =  document.createElement('div');
					message.className = 'message' ;
					message.id        =  username ;

				var core              = document.getElementById('msgcore');
					core.appendChild(message);
					return           message;
			}



			var showmsg  = function(event) {

				/* 1.detect user */
				if( event.target.className =='user' ) {
					usernew = event.target;
					core    = event.target.parentNode;
				}
				else if( event.target.parentNode.className =='user' ) {
					usernew = event.target.parentNode;
					core    = event.target.parentNode.parentNode;
				}
				else if( event.target.parentNode.parentNode.className =='user' ) {
					usernew = event.target.parentNode.parentNode;
					core    = event.target.parentNode.parentNode.parentNode;
				}

				/* 2.getname from user */
				var name    = usernew.getAttribute('name');
				var id      = document.getElementById(name);

					hidemessages();

				/* 3.       if user message exists , display 
					 else   if not  exists , 
					 create it.
				 */

				if(  id != null)
					 id.style.display = 'block';
				else id  = newmsg(String(name));

					 user = id;

				console.log( '' + id.className   );
				console.log( '' + name );

			}



			for( var i = 0 ; i < users.length ; i++ ) 
				users[i].addEventListener( 'click' , showmsg , false );



			/* clean function. */
			//var user = document.getElementById('');
			var cleanbutton  = document.getElementById('cleancontent');

			var cleancontent = function(event) {
				while(user.hasChildNodes())
					user.removeChild(user.childNodes[0]);
			}

				cleanbutton.addEventListener( 'click' , cleancontent , false );


		</script>


		<script>

			$(document).ready( function() {

				//alert('show html.!');

				$('#showhtml').click( function() {
					console.log( document.getElementById('block').outerHTML );
				});
				
				$('#submit').click( function() {

					var formdata = new FormData();

					    formdata.append( 'page' , document.getElementById('block').outerHTML );

					$.ajax( {

						url      : 'uploader' ,
						data     :  formdata  ,
						type     : 'POST'     ,

						contentType : false   ,
						processData : false   ,

						success     : function(data) {
							$('#msg').append(data);
						}

					});

				});

			});

			var uploadimg = function() {

				//var block = document.getElementById('block');
				var files = document.getElementById('file').files;

				console.log( "length  " + files.length );

				for ( var i = 0 ; i < files.length ; i++ ) {

					var file       = files[i];

					var filereader = new FileReader();

						filereader.readAsDataURL(file);

						filereader.onload = function(fileevent) {
							
							var srcData = fileevent.target.result;

							var img     = new Image();
								img.src = srcData;

								sendimg(img);
						}

				}

			}

		</script>

	</body>

</html>



