<div id="header">
    <div class="SubWrapper">
	    <div class="Logo">
		    <h1><a href="<?php echo $base;?>" title="<?php echo $company_name;?>">
				<img alt="" src="<?php echo HTTP_IMAGE.$logo;?>"/>
			</a></h1>
	    </div>
		
	    <div class="TopRight">
			<div id="shoppingcart" style="display:none;">
				<div class="heading">
				  <h4><?php echo 'Shopping cart'; ?></h4>
				  <a><span id="cart_total"><?php echo '0 '.'item(s) - $'.'0.00'; ?></span></a></div>
				<div class="content"></div>
			</div>
			<div class="Slogan">
	            <h4>Smart solution for smarter business</h4>
	        </div>
	        <ul class="ShareLinks">
		        <li id="blog"><a href="javascript:void window.open('http://blog.smartbiz.vn')" title="Blog">Blog</a></li>
				<li id="forum"><a href="javascript:void window.open('http://forum.smartbiz.vn')" title="Forum">Forum</a></li>
				<li id="email"><a href="<?php echo $link_contact?>" title="Email">Email</a></li>
				<li id="skype"><a href="skype:sun.smartbiz?chat" rel="nofollow" title="Skype">Skype</a></li>
				<li id="yahoo"><a title="Yahoo" onclick="___openFixedPopup('index.php?route=smartbiz/yahoo_pingbox', 400, 286);" href="javascript:">Yahoo</a></li>
				<?php if($_SESSION["language"] == "en") {?>
	        		<li id="vn"><a title="Tiếng việt" href="<?php echo $link_language?>/vn">VN</a></li>
	        	<?php } else {?>
	        		<li id="eng"><a title="English" href="<?php echo $link_language?>/en">EN</a></li>
	        	<?php }?>
		    </ul>  
		    <div class="SearchGoogle">
		    <form action="<?php echo $link_searchgoogle?>" id="cse-search-box" class="frmgblsearch">
		    	<div>
		    		<input name="cx" value="011666577006839900891:juakmittoqm" type="hidden" />
		    		<input name="cof" value="FORID:11" type="hidden" />
		    		<input name="ie" value="UTF-8" type="hidden" />
		    		<input style="border: 1px solid rgb(255, 255, 255); padding: 2px; background: url(&quot;http://www.google.com.vn/cse/intl/vi/images/google_custom_search_watermark.gif&quot;) no-repeat scroll left center rgb(255, 255, 255);" name="q" size="55" type="text" class="txtsearch"/>
		    		<input name="sa" value="Tìm kiếm" type="submit" class="btnsearch" style="height:19px;" />
		        </div><input value="www.smartbiz.vn" name="siteurl" type="hidden" />
		    </form><script type="text/javascript" src="<?php echo RESOURCE_PATH?>/scripts/brand"></script>
		    </div>
	    </div>
	    <div class="cb"></div>
    </div>
</div>

<div id="banner">
    <div class="SubWrapper" id="ads_banner">
    	<ul id="slide_banner">  
    	<?php foreach($banners as $key=>$banner) { ?>
    		<li>
	            <div class="AdverBanner">
	                <img src="<?php echo HTTP_IMAGE.$banner['image'];?>" width="930px" height="242px" alt="Banner" class="watermark" />
					<?php if(strpos($banner['image'],'Business-Intelligence.jpg') !== false || strpos($banner['image'],'SmartBizSuite.jpg') !== false) { ?>
	                <div class="AdverBannerBt1">
	                    <span id="buy"><a href="#" title="Buy Now">Buy Now</a></span>
					    <span id="online"><a href="<?php echo $link_demo?>" title="Online Demo">Online Demo</a></span>
					</div>
					<?php } ?>
	            </div>
	       	</li>
	     <?php } ?>
	  	</ul>
	  	<div class="CounterBt2" id="counter_button">
            
        </div>
    </div>
    
</div>

<div id="mainNav">
	<div class="SubWrapper" id="nav">
        <ul class="MenuPages" id="main_nav">
	        <li class="<?php echo $_SESSION['menu_status']['home']?>"><a href="<?php echo $link_home?>" title="<?php echo __('home')?>"><?php echo __('home')?></a></li>
	        <li class="<?php echo $_SESSION['menu_status']['product']?>"><a href="<?php echo $link_solution?>" title="<?php  echo __('solutions')?>"><?php echo __('solutions')?></a></li>
	        <li class="<?php echo $_SESSION['menu_status']['service']?>"><a href="<?php  echo $link_service?>" title="<?php echo __('services')?>"><?php echo __('services')?></a></li>
	        <li class="<?php echo $_SESSION['menu_status']['download']?>"><a href="<?php echo $link_download?>" title="<?php echo __('download')?>"><?php echo __('download')?></a></li>
	        <li class="<?php echo $_SESSION['menu_status']['about']?>"><a href="<?php echo $link_about?>" title="<?php echo __('company')?>"><?php echo __('company')?></a></li>
	        <li class="<?php echo $_SESSION['menu_status']['demo']?>"><a href="<?php echo $link_demo?>" title="<?php echo __('demo')?>" class="endli"><?php echo __('demo')?></a></li>
        </ul>
	</div>
</div>