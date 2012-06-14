<?php echo $header; ?>
<div id="content">
  <div id="loginFormBlock" class="loginforadmin">
    <div class="heading">
      <!--h1><img src="view/image/lockscreen.png" alt="" /> <?php //echo $text_login; ?></h1-->
      <?php echo $text_login; ?>
    </div>
    <div class="content" style="min-height: 150px; overflow: hidden;">
      <?php if ($success) { ?>
      <div class="success"><?php echo $success; ?></div>
      <?php } ?>
      <?php if ($error_warning) { ?>
      <div class="warning"><?php echo $error_warning; ?></div>
      <?php } ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table style="width: 100%;">
          <tr>
            <td style="text-align: center;" rowspan="4"><img src="view/image/login.png" alt="<?php echo $text_login; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_username; ?><br />
              <input type="text" name="username" id="txtusername" value="<?php echo $username; ?>" style="margin-top: 4px;" />
              <br />
              <br />
              <?php echo $entry_password; ?><br />
              <input type="password" name="password" value="<?php echo $password; ?>" style="margin-top: 4px;" />
              <br />
              <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td style="text-align: right;"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_login; ?></span></a></td>
          </tr>
        </table>
        <?php if ($redirect) { ?>
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        <?php } ?>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$(document).ready(function(){
	$('#txtusername').focus();
	start = 0;
	step = 10;
	end = (parseInt($('html').width()/2) - parseInt($('#loginFormBlock').width()/2));
	setInterval("slideLoginForm('loginFormBlock', "+end+")", 20);
	$('#form input').keydown(function(e) {
		if (e.keyCode == 13) {
			$('#form').submit();
		}
	});
});
function slideLoginForm(divid, stop) {
	if(start == 0) {
		step += 20;
		if(step > stop) {
			start = stop;
		}
	}
	$('#'+divid).css({"left":step+"px","position":"absolute"});
}
//--></script> 
<?php echo $footer; ?>