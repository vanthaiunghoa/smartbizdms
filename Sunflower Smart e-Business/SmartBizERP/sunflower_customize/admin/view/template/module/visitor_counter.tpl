<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('view/image/module.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><?php echo $entry_position; ?></td>
          <td><select name="visitor_counter_position">
              <?php if ($visitor_counter_position == 'left') { ?>
              <option value="left" selected="selected"><?php echo $text_left; ?></option>
              <?php } else { ?>
              <option value="left"><?php echo $text_left; ?></option>
              <?php } ?>
              <?php if ($visitor_counter_position == 'right') { ?>
              <option value="right" selected="selected"><?php echo $text_right; ?></option>
              <?php } else { ?>
              <option value="right"><?php echo $text_right; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_status; ?></td>
          <td><select name="visitor_counter_status">
              <?php if ($visitor_counter_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
		<!-- count all or unique -->
        <tr>
          <td><?php echo $entry_count_type; ?></td>
          <td><select name="visitor_counter_count_type">
              <?php if ($visitor_counter_count_type) { ?>
              <option value="1" selected="selected"><?php echo $text_count_unique; ?></option>
              <option value="0"><?php echo $text_count_all; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_count_unique; ?></option>
              <option value="0" selected="selected"><?php echo $text_count_all; ?></option>
              <?php } ?>
            </select></td>
        </tr>
		<!-- background color -->
        <tr>
          <td><?php echo $entry_background_color; ?></td>
          <td><input type="text" name="visitor_counter_background_color" value="<?php echo $visitor_counter_background_color; ?>" size="1" /></td>
        </tr>
		<!-- font color -->
        <tr>
          <td><?php echo $entry_font_color; ?></td>
          <td><input type="text" name="visitor_counter_font_color" value="<?php echo $visitor_counter_font_color; ?>" size="1" /></td>
        </tr>
		<!-- sort order -->
        <tr>
          <td><?php echo $entry_sort_order; ?></td>
          <td><input type="text" name="visitor_counter_sort_order" value="<?php echo $visitor_counter_sort_order; ?>" size="1" /></td>
        </tr>
      </table>
    </form>
  </div>
</div>
<?php echo $footer; ?>