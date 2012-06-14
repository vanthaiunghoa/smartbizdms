<div class="SubWrapper M8left">
            <div class="RightColumn2 W100p">
            	<h3 class="Text3">Smartbiz News</h3>
                <br class="cb" />
                <?php foreach($news_list as $news) {?>
                <div class="BossInfo">
				   <div class="NewsContent">
				        <a href="<?php echo $link_news . "/" . $news['news_id']?>" title="<?php echo $news['title']?>"><img src="<?php echo $news['image']?>" width="146px" height="111px" title="<?php echo $news['title']?>" alt="<?php echo $news['title']?>" /></a>
				        <h6 class="NewsTitle NewsTitlePaddingTop0"><a href="<?php echo $link_news . "/" . $news['news_id']?>" title="<?php echo $news['title']?>"><?php echo $news['title']?></a>&nbsp;<i class="NewsDetails" style="color: #333;font-weight: normal"><?php echo $news['date_added']?></i></h6>
				        <p class="NewsDetails NewsDetailsPaddingTop0 NewsDetailsPaddingBottom0">
				            <?php echo $news['preview']?><br><a href="<?php echo $link_news . "/" . $news['news_id']?>" class="LinkDetails LinkDetailsNoPaddingLeft LinkDetailsPaddingTop0"><?php echo __('viewmore')?></a>
				        </p>
				   </div>
                    <br class="cb" />
                </div>
                <?php }?>
            </div>
	    </div>