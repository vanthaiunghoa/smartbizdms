<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('view/image/payment.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><span class="required"></span><?php echo $entry_merchant; ?></td>
          <td><input type="text" name="paymenex_direct_merchant" value="<?php echo $paymenex_direct_merchant; ?>" />
		  <?php if ($error_merchant) { ?><span class="error"><?php echo $error_merchant; ?></span><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_secret_key; ?></td>
          <td><input type="text" name="paymenex_direct_secret_key" value="<?php echo $paymenex_direct_secret_key; ?>" />
		  <?php if ($error_secret_key) { ?><span class="error"><?php echo $error_secret_key; ?></span><?php } ?></td>
        </tr>
        <tr> 
          <td><?php echo $entry_iv_key; ?></td>
          <td><input type="text" name="paymenex_direct_iv_key" value="<?php echo $paymenex_direct_iv_key; ?>" />
		  <?php if ($error_iv_key) { ?><span class="error"><?php echo $error_iv_key; ?></span><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_izen_id; ?></td>
          <td><input type="text" name="paymenex_direct_izen_id" value="<?php echo $paymenex_direct_izen_id; ?>" />
		  <?php if ($error_izen_id) { ?><span class="error"><?php echo $error_izen_id; ?></span><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_order_status; ?></td>
          <td><select name="paymenex_direct_order_status_id">
              <?php foreach ($order_statuses as $order_status) { ?>
              <?php if ($order_status['order_status_id'] == $paymenex_direct_order_status_id) { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_geo_zone; ?></td>
          <td><select name="paymenex_direct_geo_zone_id">
              <option value="0"><?php echo $text_all_zones; ?></option>
              <?php foreach ($geo_zones as $geo_zone) { ?>
              <?php if ($geo_zone['geo_zone_id'] == $paymenex_direct_geo_zone_id) { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_status; ?></td>
          <td><select name="paymenex_direct_status">
              <?php if ($paymenex_direct_status) { ?>
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
          <td><input type="text" name="paymenex_direct_sort_order" value="<?php echo $paymenex_direct_sort_order; ?>" size="1" /></td>
        </tr>
      </table>
    </form>
  </div>
</div>
<?php echo $footer; ?>