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
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a><a href="#tab-special"><?php echo $tab_special; ?></a></div>
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
                <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                <td><input type="text" name="solution_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($solution_description[$language['language_id']]) ? $solution_description[$language['language_id']]['name'] : ''; ?>" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_description; ?></td>
                <td><textarea name="solution_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($solution_description[$language['language_id']]) ? $solution_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_keyword; ?></td>
                <td><textarea name="solution_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5"><?php echo isset($solution_description[$language['language_id']]) ? $solution_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><span class="required">*</span> <?php echo $entry_description; ?></td>
                <td>
                  <?php if (isset($error_description[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_description[$language['language_id']]; ?></span>
                  <?php } ?>
                <textarea name="solution_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($solution_description[$language['language_id']]) ? $solution_description[$language['language_id']]['description'] : ''; ?></textarea></td>
              </tr>
            </table>
          </div>
          <?php } ?>
        </div>
        <div id="tab-data">
          <table class="form">
            <tr>
              <td><?php echo $entry_price; ?></td>
              <td><input type="text" name="price" value="<?php echo $price; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_image_icon; ?></td>
              <td><input type="hidden" name="image_icon" value="<?php echo $image_icon; ?>" width="50" height="50" id="image_icon" />
              <img src="<?php echo $preview_icon; ?>" alt="" id="preview_icon" class="image" onclick="image_upload('image_icon', 'preview_icon');" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_image; ?></td>
              <td><input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                <img src="<?php echo $preview; ?>" alt="" id="preview" class="image" onclick="image_upload('image', 'preview');" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_image_preview; ?></td>
              <td><input type="hidden" name="image_preview" value="<?php echo $image_preview; ?>" id="image_preview" />
                <img src="<?php echo $preview_preview; ?>" alt="" id="preview_preview" class="image_preview" onclick="image_upload('image_preview', 'preview_preview');" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="2" /></td>
            </tr>
          </table>
        </div>
        
        <div id="tab-special">
          <table id="special" class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_customer_group; ?></td>
                <td class="right"><?php echo $entry_priority; ?></td>
                <td class="right"><?php echo $entry_price; ?></td>
                <td class="left"><?php echo $entry_date_start; ?></td>
                <td class="left"><?php echo $entry_date_end; ?></td>
                <td></td>
              </tr>
            </thead>
            <?php $special_row = 0; ?>
            <?php foreach ($solution_specials as $solution_special) { ?>
            <tbody id="special-row<?php echo $special_row; ?>">
              <tr>
                <td class="left"><select name="solution_special[<?php echo $special_row; ?>][customer_group_id]">
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $solution_special['customer_group_id']) { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
                <td class="right"><input type="text" name="solution_special[<?php echo $special_row; ?>][priority]" value="<?php echo $solution_special['priority']; ?>" size="2" /></td>
                <td class="right"><input type="text" name="solution_special[<?php echo $special_row; ?>][price]" value="<?php echo $solution_special['price']; ?>" /></td>
                <td class="left"><input type="text" name="solution_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $solution_special['date_start']; ?>" class="date" /></td>
                <td class="left"><input type="text" name="solution_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $solution_special['date_end']; ?>" class="date" /></td>
                <td class="left"><a onclick="$('#special-row<?php echo $special_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
              </tr>
            </tbody>
            <?php $special_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="5"></td>
                <td class="left"><a onclick="addSpecial();" class="button"><span><?php echo $button_add_special; ?></span></a></td>
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
var special_row = <?php echo $special_row; ?>;

function addSpecial() {
	html  = '<tbody id="special-row' + special_row + '">';
	html += '  <tr>'; 
    html += '    <td class="left"><select name="solution_special[' + special_row + '][customer_group_id]">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
    <?php } ?>
    html += '    </select></td>';
    html += '    <td class="right"><input type="text" name="solution_special[' + special_row + '][priority]" value="" size="2" /></td>';
	html += '    <td class="right"><input type="text" name="solution_special[' + special_row + '][price]" value="" /></td>';
    html += '    <td class="left"><input type="text" name="solution_special[' + special_row + '][date_start]" value="" class="date" /></td>';
	html += '    <td class="left"><input type="text" name="solution_special[' + special_row + '][date_end]" value="" class="date" /></td>';
	html += '    <td class="left"><a onclick="$(\'#special-row' + special_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
    html += '</tbody>';
	
	$('#special tfoot').before(html);
 
	$('#special-row' + special_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});
	
	special_row++;
}
//--></script> 
<script type="text/javascript"><!--
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