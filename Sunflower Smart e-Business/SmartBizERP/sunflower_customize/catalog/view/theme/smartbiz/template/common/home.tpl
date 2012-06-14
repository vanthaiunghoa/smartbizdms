<div class="SubWrapper">
	<?php if(sizeof($topFeaturedProducts) > 0) { foreach($topFeaturedProducts as $topFeaturedProduct) {?>
    <div class="LeftColumn">
		<div class="TopBox1">
		    <h6><a href="<?php echo $link_product_detail?>/<?php echo $topFeaturedProduct['sku'] ?>" title="<?php echo $topFeaturedProduct['name']?>"><?php echo $topFeaturedProduct['name']?></a></h6>
		</div>
		<div class="CenterBox1">
		    <div class="FeaturedImg">
		    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="256" height="204" id="single1" name="single1">
				    <param name="movie" value="<?php echo RESOURCE_PATH?>/scripts/player.swf" />
				    <param name="allowfullscreen" value="true" />
				    <param name="allowscriptaccess" value="always" />
				    <param name="flashvars" value= "file=<?php echo RESOURCE_PATH?><?php echo $topFeaturedProduct['video'] ?>&amp;image=<?php echo $topFeaturedProduct['product_image'] ?>" />
				    <embed id="single2" allowscriptaccess='always' allowfullscreen='true' src="<?php echo RESOURCE_PATH?>/scripts/player.swf" flashvars="file=<?php echo RESOURCE_PATH?><?php echo $topFeaturedProduct['video'] ?>&amp;image=<?php echo $topFeaturedProduct['product_image'] ?>" width="256" height="204" />
			    </object>
		    </div>
		</div>
		<div class="BottomBox1"></div>
	</div>
	<?php }} ?>
    <?php if(sizeof($lasted_news) > 0) { ?>
	<div class="CenterColumn">
		<div class="TopBox2">
		    <h6><a href="<?php echo $link_news?>" title="<?php echo __('news')?>"><?php echo __('news')?></a></h6>
		</div>
		<div class="CenterBox2">
		   <div class="NewsContent">
		        <a href="<?php echo $link_news . "/" . $lasted_news['news_id']?>" title="<?php echo $lasted_news['title']?>"><img src="<?php echo $lasted_news['image']?>" title="<?php echo $lasted_news['title']?>" alt="<?php echo $lasted_news['title']?>" /></a>
		        <h6 class="NewsTitle NewsTitlePaddingTop10"><a href="<?php echo $link_news . "/" . $lasted_news['news_id']?>" title="<?php echo $lasted_news['title']?>"><?php echo $lasted_news['title']?></a></h6>
		        <p class="NewsDetails NewsDetails1">
		            <?php echo $lasted_news['preview']?>
		            <a href="<?php echo $link_news . "/" . $lasted_news['news_id']?>" class="LinkDetails LinkDetailsPaddingRight14"><?php echo __('viewmore')?></a>
		        </p>
		   </div>
		</div>
		<div class="BottomBox2"></div>
	</div>
	<?php } ?>
	<?php if(sizeof($partners) > 0) { ?>
	<div class="RightColumn">
		<div class="TopBox1">
		    <h6><a title="<?php echo __('partner')?>"><?php echo __('partner')?></a></h6>
		</div>
		<div class="CenterBox1">
		    <div class="PartnerImg">
		        <div class="marq">
		    	<ul id="marquee" class="marquee">
		    		<?php foreach($partners as $partner) {?>
		    		<li><a href="<?php echo $partner['href']?>" target="_blank" title="<?php echo $partner['name']?>"><img src="<?php echo $partner['image']?>" width="145px" height="185px" alt="<?php echo $partner['name']?>" title="<?php echo $partner['name']?>" /></a></li>
		    		<?php }?>
				</ul>
		    	</div>
		    </div>
		</div>
		<div class="BottomBox1"></div>
	</div>
	<?php } ?>
	<br class="cb" />
	<?php if(sizeof($featuredProducts) > 0) { ?>
	<ul id="slide_product"> 
	<li>
	<?php for($i=0;$i<3;$i++) {?>
		<div class="W300">
		    <div class="ProTitle1">
			    <h6><a href="<?php echo $link_product_detail?>/<?php echo $featuredProducts[$i]['sku']?>" title="<?php echo $featuredProducts[$i]['name']; ?>"><?php echo $featuredProducts[$i]['name']; ?></a></h6>
			</div>
			<div class="W127 product">
			    <a href="<?php echo $link_product_detail?>/<?php echo $featuredProducts[$i]['sku']?>" title="Product"><img src="<?php echo $featuredProducts[$i]['image'];?>" title="<?php echo $featuredProducts[$i]['name']?>" alt="<?php echo $featuredProducts[$i]['name']?>" /></a>
			</div>
			<div class="W170">
			    
			        <?php echo $featuredProducts[$i]['description']?>
			    
			    <div class="ProFunction">
			        <a href="<?php echo $link_contact?>" class="order" title="<?php echo __('order')?>"><?php echo __('order')?></a>
			        <a href="<?php echo $link_product_detail?>/<?php echo $featuredProducts[$i]['sku']?>" class="more" title="<?php echo __('more')?>"><?php echo __('more')?></a>
			    </div>
			</div> 
		</div>
	<?php }?>
	</li>
	<li>
	<?php for($i=3;$i<6;$i++) {?>
		<div class="W300">
		    <div class="ProTitle1">
			    <h6><a href="<?php echo $link_product_detail?>/<?php echo $featuredProducts[$i]['sku']?>" title="<?php echo __('standard-package-pos')?>"><?php echo $featuredProducts[$i]['name']?></a></h6>
			</div>
			<div class="W127 product">
			    <a href="<?php echo $link_product_detail?>/<?php echo $featuredProducts[$i]['sku']?>" title="Product"><img src="<?php echo $featuredProducts[$i]['image']?>" title="<?php echo $featuredProducts[$i]['name']?>" alt="<?php echo $featuredProducts[$i]['name']?>" /></a>
			</div>
			<div class="W170">
			    
			        <?php echo $featuredProducts[$i]['description']?>
			    
			    <div class="ProFunction">
			        <a href="<?php $link_contact?>" class="order" title="<?php echo __('order')?>"><?php echo __('order')?></a>
			        <a href="<?php echo $link_product_detail?>/<?php echo $featuredProducts[$i]['sku']?>" class="more" title="<?php echo __('more')?>"><?php echo __('more')?></a>
			    </div>
			</div> 
		</div>
	<?php }?>
	</li>
	 </ul>
	 <?php } ?>
	 <div style="height:10px;">&nbsp;</div>
</div>
