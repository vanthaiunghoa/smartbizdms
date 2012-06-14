<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
 <div class="left"></div>
 <div class="right"></div>
 <div class="heading">
   <h1 style="background-image: url('view/image/module.png');"><?php echo $heading_title; ?></h1>
   <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location='<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
 </div>
 <div class="content">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
    <table class="form">
      <tr>
        <td width="25%"><?php echo $entry_position; ?></td>
        <td><select name="followme_position">
            <?php if ($followme_position == 'left') { ?>
            <option value="left" selected="selected"><?php echo $text_left; ?></option>
            <?php } else { ?>
            <option value="left"><?php echo $text_left; ?></option>
            <?php } ?>
            <?php if ($followme_position == 'right') { ?>
            <option value="right" selected="selected"><?php echo $text_right; ?></option>
            <?php } else { ?>
            <option value="right"><?php echo $text_right; ?></option>
            <?php } ?>
          </select></td>
      </tr>
      <tr>
        <td><?php echo $entry_status; ?></td>
        <td><select name="followme_status">
            <?php if ($followme_status) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select></td>
      </tr>
      <tr>
        <td><?php echo $entry_sort_order; ?></td>
        <td><input type="text" name="followme_sort_order" value="<?php echo $followme_sort_order; ?>" size="1" /></td>
      </tr>
      <tr>
        <td><?php echo $entry_orkut_username; ?></td>
        <td><input type="text" name="followme_orkut_username" value="<?php echo $followme_orkut_username; ?>" size="20" /></td>
      </tr>
      <tr>
        <td><?php echo $entry_youtube_username; ?></td>
        <td><input type="text" name="followme_youtube_username" value="<?php echo $followme_youtube_username; ?>" size="20" /></td>
      </tr> 
		<tr>
        <td><?php echo $entry_twitter_username; ?></td>
        <td><input type="text" name="followme_twitter_username" value="<?php echo $followme_twitter_username; ?>" size="20" /></td>
      </tr> 
			<tr>
        <td><?php echo $entry_facebook_username; ?></td>
        <td><input type="text" name="followme_facebook_username" value="<?php echo $followme_facebook_username; ?>" size="20" /></td>
      </tr>		
    </table>
  </form>
 </div>
</div>
<?php echo $footer; ?>