<!DOCTYPE HTML>
<html lang="<?php echo $_SESSION['language']; ?>">
<head>
    <meta charset="utf-8">
    <title><?php echo isset($page_title) ? $page_title : "SmartBiz E-business"?></title>
    <!--  Keywords for SEO -->
    
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>
	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($icon) { ?>
	<!--link href="<?php //echo $icon; ?>" rel="icon" /-->
	<?php } ?>
	<!-- End Keywords for SEO -->
    <!-- CSS Including -->
	<link type="text/css" rel="stylesheet" href="<?php echo RESOURCE_PATH?>/css/global.css"  />
	<link type="text/css" rel="stylesheet" href="<?php echo RESOURCE_PATH?>/css/mystyle.css"  />
	<link type="text/css" rel="stylesheet" href="<?php echo RESOURCE_PATH?>/css/js.css"  />
	<link type="text/css" rel="stylesheet" href="<?php echo RESOURCE_PATH?>/css/shadowbox.css"  />
	<link type="text/css" rel="stylesheet" href="<?php echo RESOURCE_PATH?>/css/jScrollPane.css"  media="all" />
	<link type="text/css" rel="stylesheet" href="<?php echo RESOURCE_PATH?>/css/demoStyles.css"  media="all" />
	<link type="text/css" rel="stylesheet" href="<?php echo RESOURCE_PATH?>/css/jqzoom.css"/>
	
	<!-- End CSS Including -->
	<!-- Favicon -->
    <?php if (preg_match('/Firefox/i',$_SERVER['HTTP_USER_AGENT'])) { ?>
	<link href='<?php echo RESOURCE_PATH?>/img/firefox.png' rel='icon'/>
    <?php } else if (preg_match('/Chrome/i',$_SERVER['HTTP_USER_AGENT'])) { ?>
    <link href='<?php echo RESOURCE_PATH?>/img/google-chrome.png' rel='icon'/>
    <?php } else if (preg_match('/Safari/i',$_SERVER['HTTP_USER_AGENT'])) { ?>
    <link href='<?php echo RESOURCE_PATH?>/img/safari.png' rel='icon'/>
    <?php } else  { ?>
    <link href='<?php echo RESOURCE_PATH?>/img/favicon.ico' rel='icon'/>
    <?php }?>
	<!-- End Favicon -->
	
	<!-- JS Library -->
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/change.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/jquery.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/easySlider1.7.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/animator.min.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/jquery.lavalamp-1.3.4b.js"></script>
	<script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/common.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/jquery.marquee.min.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/shadowbox.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/about-scroll.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/jquery.tools.min.js"></script> 
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/jquery.bxSlider.min.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/jScrollPane.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/jquery.jqzoom1.0.1.js"></script>
    <script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/watermark.js"></script>
    <!-- End JS Library -->
    
    <!-- JS Function -->
    <script type="text/javascript">
		$(document).ready(function(){
			initCommon();
			<?php echo isset($js_binding_tab_click) ? $js_binding_tab_click : ''?>
			
		});	
	</script>
	<script type="text/javascript">
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-20651595-1']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	</script>
	<script>
		var load = false;
		window.onload = function(){
			if(!load) {
				wmark.init({
					/* config goes here */
					"position": "bottom-right", // default "bottom-right"
					"opacity": 50, // default 50
					"className": "watermark", // default "watermark"
					"path": "<?php echo RESOURCE_PATH?>/img/logo_Sunflower.png"
				});
			
				load = true;
			}
		}
	</script>
    <!-- End JS Function -->
   	
</head>
<body>
<div id="container">
<?php echo isset($header) ? $header : ''; ?>
<div id="mainContent">
  <?php echo $content?>
</div>
<?php echo isset($footer) ? $footer : ''; ?> 
</div>
</body>
</html>