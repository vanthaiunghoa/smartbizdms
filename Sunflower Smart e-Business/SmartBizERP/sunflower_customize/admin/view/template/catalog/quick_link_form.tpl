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
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/download.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
    <div class="content">
	<div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-links"><?php echo $tab_links; ?></a><a href="#tab-image"><?php echo $tab_image; ?></a></div>	
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
		<div id="languages" class="htabs">
			<?php foreach ($languages as $language) { ?>
			<a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
			<?php } ?>
		</div>
		<?php foreach ($languages as $language) { ?>
		<div id="language<?php echo $language['language_id']; ?>">
		<table class="form">
          <tr>
            <td><?php echo $entry_name; ?>
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
			&nbsp;&nbsp;<span class="required">(*)</span>
			</td>
            <td><?php //foreach ($languages as $language) { ?>
              <input type="text" size="100" name="quick_link_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($quick_link_description[$language['language_id']]) ? $quick_link_description[$language['language_id']]['name'] : ''; ?>" />
              <br />
              <?php if (isset($error_name[$language['language_id']])) { ?>
              <span class="error"><?php echo $error_name[$language['language_id']]; ?></span><br />
              <?php } ?>
              <?php //} ?></td>
          </tr>
		  <?php //foreach ($languages as $language) { ?>
		  <tr>
            <td valign="top"> <?php echo $entry_description; ?>
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
			</td>
            <td>
				<textarea name="quick_link_description[<?php echo $language['language_id']; ?>][description]" cols="40" rows="5" id="description<?php echo $language['language_id']; ?>"><?php echo isset($quick_link_description[$language['language_id']]) ? $quick_link_description[$language['language_id']]['description'] : ''; ?></textarea>
				
				<?php if (isset($error_name[$language['language_id']])) { ?>
				<span class="error"><?php echo $error_name[$language['language_id']]; ?></span><br />
				<?php } ?>
				</td>
          </tr>
		  <?php //} ?>
        </table>
		</div>
		<?php } ?>
		</div>
		<div id="tab-links">
          <table class="form">
            <tr>
              <td><?php echo $entry_category; ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($categories as $category) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($category['quick_link_category_id'], $quick_link_category)) { ?>
                    <input type="checkbox" name="quick_link_category[]" value="<?php echo $category['quick_link_category_id']; ?>" checked="checked" />
                    <?php echo $category['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="quick_link_category[]" value="<?php echo $category['quick_link_category_id']; ?>" />
                    <?php echo $category['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr>
              <td><?php echo $entry_store; ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array(0, $quick_link_store)) { ?>
                    <input type="checkbox" name="quick_link_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="quick_link_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($store['store_id'], $quick_link_store)) { ?>
                    <input type="checkbox" name="quick_link_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="quick_link_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
			<tr>
				<td><?php echo $entry_demo_url; ?></td>
				<td><input type="text" name="demo_url" value="<?php echo $demo_url; ?>" style="width:500px;" maxlength="250"/></td>
			</tr>
			<tr>
				<td><?php echo $entry_username_password; ?></td>
				<td><input type="text" name="username_password" value="<?php echo $username_password; ?>" style="width:300px;" maxlength="50" /></td>
			</tr>
			<!--tr style="display:none;">
				<td><?php //echo $entry_filename; ?></td>
				<td><input type="file" name="quick_link" value="" />
				  <br/>
				  <span class="help"><?php //echo $filename; ?></span>
				  <?php //if ($error_quick_link) { ?>
				  <span class="error"><?php //echo $error_quick_link; ?></span>
				  <?php //} ?>
				</td>
          </tr>
		  <tr style="display:none;">
            <td><?php //echo $entry_movie; ?></td>
            <td><input type="file" name="movie" value="" />
              <br/>
              <span class="help"><?php //echo $movie; ?></span>
              <?php //if ($error_quick_link) { ?>
              <span class="error"><?php //echo $error_quick_link; ?></span>
              <?php //} ?></td>
          </tr>
          <tr style="display:none;">
            <td><?php //echo $entry_download_allowed; ?></td>
            <td><input type="checkbox" name="download_allowed" value="1" <?php //if($download_allowed == 1) echo 'checked="checked"';?>/></td>
          </tr-->
		  <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" /></td>
          </tr>
          </table>
        </div>
		<div id="tab-image">
          <table id="images" class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_image; ?></td>
                <td></td>
				<td></td>
              </tr>
            </thead>
            <?php $image_row = 0; ?>
            <?php foreach ($quick_link_images as $quick_link_image) { ?>
            <tbody id="image-row<?php echo $image_row; ?>">
              <tr>
				<td width="350">
					<?php echo $entry_image_title;?><br/>
					<input type="text" name="quick_link_image[<?php echo $image_row; ?>][image_title]" maxlength="255" style="width: 300px;" value="<?php echo $quick_link_image['image_title']; ?>"/>
				</td>
                <td class="left"><img src="<?php echo $quick_link_image['preview']; ?>" alt="" id="preview<?php echo $image_row; ?>" class="image" onclick="image_upload('image<?php echo $image_row; ?>', 'preview<?php echo $image_row; ?>');" />
                  <input type="hidden" name="quick_link_image[<?php echo $image_row; ?>][image]" value="<?php echo $quick_link_image['image']; ?>" id="image<?php echo $image_row; ?>"  /></td>
                <td class="left"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
              </tr>
            </tbody>
            <?php $image_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td></td>
				<td></td>
                <td class="left"><a onclick="addImage();" class="button"><span><?php echo $button_add_image; ?></span></a></td>
              </tr>
            </tfoot>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 

<script type="text/javascript"><!--
$(document).ready(function(){
	$('#tab-general').addClass('selected');
});
function image_upload(field, preview) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>',
					type: 'POST',
					data: 'image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(data) {
						$('#' + preview).replaceWith('<img src="' + data + '" alt="" id="' + preview + '" class="image" onclick="image_upload(\'' + field + '\', \'' + preview + '\');" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 

<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
    html  = '<tbody id="image-row' + image_row + '">';
	html += '  <tr>';
	html += '  	 <td width="350"><?php echo $entry_image_title;?><br/><input type="text" name="quick_link_image[' + image_row + '][image_title]" maxlength="255" style="width: 300px;" value=""/></td>'
	html += '    <td class="left"><input type="hidden" name="quick_link_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><img src="<?php echo $no_image; ?>" alt="" id="preview' + image_row + '" class="image" onclick="image_upload(\'image' + image_row + '\', \'preview' + image_row + '\');" /></td>';
	html += '    <td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#images tfoot').before(html);
	
	image_row++;
}
//--></script> 
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"><!--
$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs(); 
$('#vtab-option a').tabs();
//--></script> 
<?php echo $footer; ?>
