<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pre-Sales Contact Us - test</title>

    <!-- Styling -->
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600|Raleway:400,700" rel="stylesheet">
	<link href="/templates/six/css/all.min.css?v=89a108" rel="stylesheet">
	<link href="/templates/six/css/custom.css" rel="stylesheet">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

	<script type="text/javascript">
		var csrfToken = '5515a0f3bd75f599faaefe990bfa9c2970461dfe',
			markdownGuide = 'Markdown Guide',
			locale = 'en',
			saved = 'saved',
			saving = 'autosaving';
	</script>
	<script src="/templates/six/js/scripts.min.js?v=89a108"></script>


	<style>
		.current_ip{
			padding-top:5px;
			float: left;
		}
		.current_region{
			padding-top:5px;
			float: left;
		}
		.center {
			display: block;
			margin-left: auto;
			margin-right: auto;
			width: 6%;
		}
	</style>
</head>

<body>
	
	<?php
		$user_id = $_REQUEST['user_id'];
		if (!isset($user_id)) {
			die('Cannot access this url');
		}

		$servername = "localhost";
		$username = "root";
		$password = "daacdce544927fb0";
		$dbname = "test";

		// Create connection
		$conn = new mysqli($servername, $username, $password, $dbname);

		// Check connection
		if ($conn->connect_error) {
		    die("Connection failed: " . $conn->connect_error);
		}

		$sql = "select * from users where client_id='".$user_id."'";
		$query = mysqli_query($conn, $sql);
		$result = mysqli_fetch_array($query);
		$db_ip = '';
		if (count($result) > 0) {
			$db_ip = $result['ip'];
		}

		$msg = "";
		if(isset($_POST['submit'])):
			$msg = $_POST;
			$ip = $_REQUEST['ip'];
			$region = $_REQUEST['region'];

			$sql = "select * from users where client_id='".$user_id."'";
			$query = mysqli_query($conn, $sql);
			$result = mysqli_fetch_array($query);
			if (count($result) > 0) {
				$sql = "update users set ip='".$ip."', region='".$region."' where client_id='".$user_id."'";
				$result = mysqli_query($conn, $sql);
				if ($result) 
					$msg = 'Success';
				else 
					$msg = 'Failed';				
			} else {
				$sql = "insert into users set ip='".$ip."', region='".$region."', client_id='".$user_id."'";
				$result = mysqli_query($conn, $sql);
				if ($result) 
					$msg = 'Success';
				else 
					$msg = 'Failed';				
			}

			mysqli_close($conn);
		endif;
	?>

<section id="header">
    <div class="container">
        <ul class="top-nav">
			<li>
				<a href="#" class="choose-language" data-toggle="popover" id="languageChooser">
					English
					<b class="caret"></b>
				</a>
				<div id="languageChooserContent" class="hidden">
					<ul>
						<li>
							<a href="/subscribe.php?language=arabic">العربية</a>
						</li>
						<li>
							<a href="/subscribe.php?language=azerbaijani">Azerbaijani</a>
						</li>
						<li>
							<a href="/subscribe.php?language=catalan">Català</a>
						</li>
						<li>
							<a href="/subscribe.php?language=chinese">中文</a>
						</li>
						<li>
							<a href="/subscribe.php?language=croatian">Hrvatski</a>
						</li>
						<li>
							<a href="/subscribe.php?language=czech">Čeština</a>
						</li>
						<li>
							<a href="/subscribe.php?language=danish">Dansk</a>
						</li>
						<li>
							<a href="/subscribe.php?language=dutch">Nederlands</a>
						</li>
						<li>
							<a href="/subscribe.php?language=english">English</a>
						</li>
						<li>
							<a href="/subscribe.php?language=estonian">Estonian</a>
						</li>
						<li>
							<a href="/subscribe.php?language=farsi">Persian</a>
						</li>
						<li>
							<a href="/subscribe.php?language=french">Français</a>
						</li>
						<li>
							<a href="/subscribe.php?language=german">Deutsch</a>
						</li>
						<li>
							<a href="/subscribe.php?language=hebrew">עברית</a>
						</li>
						<li>
							<a href="/subscribe.php?language=hungarian">Magyar</a>
						</li>
						<li>
							<a href="/subscribe.php?language=italian">Italiano</a>
						</li>
						<li>
							<a href="/subscribe.php?language=macedonian">Macedonian</a>
						 </li>
						<li>
							<a href="/subscribe.php?language=norwegian">Norwegian</a>
						</li>
						<li>
							<a href="/subscribe.php?language=portuguese-br">Português</a>
						</li>
						<li>
							<a href="/subscribe.php?language=portuguese-pt">Português</a>
						</li>
						<li>
							<a href="/subscribe.php?language=romanian">Română</a>
						</li>
						<li>
							<a href="/subscribe.php?language=russian">Русский</a>
						</li>
						<li>
							<a href="/subscribe.php?language=spanish">Español</a>
						</li>
						<li>
							<a href="/subscribe.php?language=swedish">Svenska</a>
						</li>
						<li>
							<a href="/subscribe.php?language=turkish">Türkçe</a>
						</li>
						<li>
							<a href="/subscribe.php?language=ukranian">Українська</a>
						</li>
					</ul>
				</div>
			</li>
			
			<li>
				<a href="/clientarea.php">Login</a>
			</li>
			<li>
				<a href="/register.php">Register</a>
			</li>
			<li class="primary-action">
				<a href="/cart.php?a=view" class="btn btn-action">
					View Cart
				</a>
			</li>
			 <li>
				<a href="/logout.php?returntoadmin=1" class="btn btn-logged-in-admin" data-toggle="tooltip" data-placement="bottom" title="You are currently logged in as an admin. Click here to return to Admin Area">
					<i class="fa fa-sign-out"></i>
				</a>
			</li>
        </ul>

		<a href="/index.php" class="logo logo-text">test</a>
        
    </div>
</section>

<section id="main-menu">

    <nav id="nav" class="navbar navbar-default navbar-main" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#primary-nav">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="primary-nav">

                <ul class="nav navbar-nav">
                    <li menuItemName="Home" class="" id="Primary_Navbar-Home">
						<a href="/index.php">
							Home
                        </a>
					</li>
					<li menuItemName="Store" class="" id="Primary_Navbar-Store">
						<a href="/cart.php">
							Store
                        </a>
					</li>
					<li menuItemName="Announcements" class="" id="Primary_Navbar-Announcements">
						<a href="/index.php?rp=/announcements">
							Announcements
						</a>
					</li>
					<li menuItemName="Knowledgebase" class="" id="Primary_Navbar-Knowledgebase">
						<a href="/index.php?rp=/knowledgebase">
							Knowledgebase
                        </a>
					</li>
					<li menuItemName="Network Status" class="" id="Primary_Navbar-Network_Status">
						<a href="/serverstatus.php">
							Network Status
                        </a>
					</li>
					<li menuItemName="Contact Us" class="" id="Primary_Navbar-Contact_Us">
						<a href="/contact.php">
							Contact Us
                        </a>
					</li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li menuItemName="Account" class="dropdown" id="Secondary_Navbar-Account">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							Account
							&nbsp;<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li menuItemName="Login" id="Secondary_Navbar-Account-Login">
								<a href="/clientarea.php">
									Login
								</a>
							</li>
							<li menuItemName="Register" id="Secondary_Navbar-Account-Register">
								<a href="/register.php">
									Register
								</a>
							</li>
							<li menuItemName="Divider" class="nav-divider" id="Secondary_Navbar-Account-Divider">
								<a href="">
									-----
								</a>
							</li>
							<li menuItemName="Forgot Password?" id="Secondary_Navbar-Account-Forgot_Password?">
								<a href="/pwreset.php">
									Forgot Password?
								</a>
							</li>
						</ul>
					</li>
                </ul>

            </div><!-- /.navbar-collapse -->
        </div>
    </nav>

</section>




<section id="main-body">
    <div class="container">
        <div class="row">
			<!-- Container for main page display content -->
			<div class="col-xs-12 main-content">
				<?php
					$ip_address = $_SERVER['REMOTE_ADDR'];
					$ip_country = geoip_country_code_by_name($ip_address);
				?>
				
				<?php if(!$msg): ?>
					<div class="header-lined">
						<h1>Subscribe Us <small>We're ready and waiting for your subscriptions</small></h1>
					</div>
					<form method="post" action="" class="form-horizontal" role="form">
						<input type="hidden" name="token" value="5515a0f3bd75f599faaefe990bfa9c2970461dfe" />
						<input type="hidden" name="action" value="send" />
						<input type="hidden" name="ip" value="<?=$ip_address?>" />
						<input type="hidden" name="user_id" value="<?=$user_id?>" />

						<div class="form-group">
							<label for="dbip" class="col-sm-3 control-label">Your Database IP</label>
							<div class="col-sm-7">
								<span class="db_ip"><?php echo $db_ip;?></span>
							</div>
						</div>

						<div class="form-group">
							<label for="inputName" class="col-sm-3 control-label">Your Current IP</label>
							<div class="col-sm-7">
								<span class="current_ip"><?php echo $ip_address;?></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-sm-3 control-label">Your Current Region</label>
							<div class="col-sm-7">
								<span class="current_region"><?php echo $ip_country;?></span>
							</div>
						</div>
<!-- 						<div class="form-group">
							<label for="inputSubject" class="col-sm-3 control-label">What url you need to access?</label>
							<div class="col-sm-3">
								<input type="subject" name="subject" value="" class="form-control" id="inputSubject" />
							</div>
						</div>
 -->						<div class="form-group">
							<label for="inputMessage" class="col-sm-3 control-label">Please select the Region</label>
							<div class="col-sm-3">
								<select class="form-control" name="region">
									<option value="us">United States</option>
									<option value="uk">United Kingdom</option>
								</select>
							</div>
						</div>
						<div class="text-center margin-bottom">
						</div>
						<div class="form-group">
							<div class="text-center">
								<input type="submit" value="Send Request" name="submit" class="btn btn-primary">
							</div>
						</div>
					</form>
				<?php else: ?>
					<div class="header-lined">
						<h1>Thanks for the Subscription!! <small>Your request is under progress, please wait while we generate Proxy Url for you...</small></h1>
					</div>
					<div class="center"><?=$msg?></div>
					<div class="form-group">
						<div class="text-center">
							<a href="subscribe.php?user_id=<?=$user_id?>" class="btn btn-primary"style="margin-top:20px;float:left;">Go back</a>
						</div>
					</div>					
					<!-- <img src="assets/img/25.gif" class="center"> -->
				<?php endif; ?>
				
				<div style="position:absolute;top:0px;right:0px;padding:5px;background-color:#000066;font-family:Tahoma;font-size:11px;color:#ffffff" class="adminreturndiv">
					Logged in as Administrator | 
					<a href="admin/" style="color:#6699ff">
						Return to Admin Area
					</a>
				</div>

            </div><!-- /.main-content -->
        </div>
        <div class="clearfix"></div>
    </div>
    </div>
</section>

<section id="footer">
    <div class="container">
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        <p>Copyright &copy; 2018 test. All Rights Reserved.</p>
    </div>
</section>

<div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel panel-primary">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">Title</h4>
            </div>
            <div class="modal-body panel-body">
                Loading...
            </div>
            <div class="modal-footer panel-footer">
                <div class="pull-left loader">
                    <i class="fa fa-circle-o-notch fa-spin"></i> Loading...
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    Close
                </button>
                <button type="button" class="btn btn-primary modal-submit">
                    Submit
                </button>
            </div>
        </div>
    </div>
</div>



</body>
</html>
