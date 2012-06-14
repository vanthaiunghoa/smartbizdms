<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/download.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="location = '<?php echo $insert; ?>'" class="button"><span><?php echo $button_insert; ?></span></a><a onclick="$('form').submit();" class="button"><span><?php echo $button_delete; ?></span></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'dd.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
			   <td class="left"><?php if ($sort == 'd.sort_order') { ?>
                <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                <?php } ?></td>
			  <td class="left"><?php if ($sort == 'dcd.name') { ?>
                <a href="<?php echo $sort_category_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_category; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_category_name; ?>"><?php echo $column_category; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 'd.download_allowed') { ?>
                <a href="<?php echo $sort_download_allowed; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_download_allowed; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_download_allowed; ?>"><?php echo $column_download_allowed; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($downloads) { ?>
            <?php foreach ($downloads as $download) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($download['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $download['download_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $download['download_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $download['name']; ?></td>
			  <td class="left"><?php echo $download['sort_order']; ?></td>
			  <td class="left"><?php echo $download['category_name']; ?></td>
              <td class="right">
			  <input type="checkbox" name="download_allowed[]" value="<?php echo $download['download_id']; ?>" <?php echo ($download['download_allowed'] == 1)?' checked="checked"':''; ?>/>
			  </td>
              <td class="right"><?php foreach ($download['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>