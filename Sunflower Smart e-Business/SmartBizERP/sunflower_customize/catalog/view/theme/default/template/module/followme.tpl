<div class="box">
  <div class="top"><img src="catalog/view/theme/default/image/social.png" alt="Orkut"/><?php echo $heading_title; ?></div>
  <div class="middle">
	 	<div id="followme">
		<?php if ($followme_orkut_username || $followme_youtube_username|| $followme_twitter_username || $followme_facebook_username) { ?>
        
       <?php if ($followme_orkut_username) { ?>
       <ul>
       <li>
       <a href="<?php echo $followme_orkut_username; ?>" target="_blank"><img src="catalog/view/theme/default/image/logo_orkut.png" alt="Orkut"/></a>
      </li>
      <?php if ($followme_youtube_username) { ?>
      <li>
      <a href="http://youtube.com/<?php echo $followme_youtube_username; ?>" target="_blank"><img src="catalog/view/theme/default/image/logo_youtube.png" alt="Youtube"/>     </a>
      </li>
	<?php if ($followme_twitter_username) { ?>
     <li>
     <a href="http://twitter.com/<?php echo $followme_twitter_username; ?>" target="_blank"><img src="catalog/view/theme/default/image/logo_twitter.png" alt="Twitter"/>    </a>
     </li>
	 <?php } ?>
	<?php if ($followme_facebook_username) { ?>
    <li>
    <a href="http://www.facebook.com/<?php echo $followme_facebook_username; ?>" target="_blank"><img src="catalog/view/theme/default/image/logo_facebook.png" alt="Facebook"/></a>
    </li>
    </ul>
		<?php } ?>
        <?php } ?>
        <?php } ?>
        
    <?php } ?>
		</div>
  </div>
  <div class="bottom">&nbsp;</div>
</div>