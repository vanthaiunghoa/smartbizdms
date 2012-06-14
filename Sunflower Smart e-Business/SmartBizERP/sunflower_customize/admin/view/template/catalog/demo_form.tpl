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
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a><a href="#tab-link"><?php echo $tab_link; ?></a></div>
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
                <td><input type="text" name="demo_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($demo_description[$language['language_id']]) ? $demo_description[$language['language_id']]['name'] : ''; ?>" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_description; ?></td>
                <td><textarea name="demo_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($demo_description[$language['language_id']]) ? $demo_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><?php echo $entry_meta_keyword; ?></td>
                <td><textarea name="demo_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5"><?php echo isset($demo_description[$language['language_id']]) ? $demo_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
              </tr>
              <tr>
                <td><span class="required">*</span> <?php echo $entry_description; ?></td>
                <td>
                  <?php if (isset($error_description[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_description[$language['language_id']]; ?></span>
                  <?php } ?>
                <textarea name="demo_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($demo_description[$language['language_id']]) ? $demo_description[$language['language_id']]['description'] : ''; ?></textarea></td>
              </tr>
            </table>
          </div>
          <?php } ?>
        </div>
        <div id="tab-data">
          <table class="form">
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
        <div id="tab-link">
        	<div id="languages-link" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#language-link-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php 
          $link_row = 0;
          foreach ($languages as $language) { ?>
          <div id="language-link-<?php echo $language['language_id']; ?>">
          <table id="links<?php echo $language['language_id']; ?>" class="list">
            <thead>
              <tr>
                <td class="left" style="text-align:left; padding-left:10px; width: 300px;"><?php echo $entry_title; ?></td>>
                <td class="left" style="text-align:left; padding-left:10px; width: 600px;"><?php echo $entry_link; ?></td>>
                <td>&nbsp;</td>>
              </tr>
            </thead>
            <?php $row = 'link_row'.$language['language_id'];
            
            if(!empty($demo_link)) {
            
            ?>
            <?php foreach ($demo_link as $link) { 
            	if(isset($link[$language['language_id']])) {
            ?>
            <tbody id="link-row-<?php echo $link_row;?><?php echo $language['language_id'];?>">
              <tr>
                <td class="left">
                  <input type="text" name="links[<?php echo $link_row;?>][<?php echo $language['language_id'];?>][name]" value="<?php echo isset($link[$language['language_id']]) ? $link[$language['language_id']]['name'] : ''; ?>" maxlength="255" link_row ="<?php echo $link_row;?>" language="<?php echo $language['language_id'];?>" style="width:300px;" /></td>
                <td class="left">
                  <input type="text" name="links[<?php echo $link_row;?>][<?php echo $language['language_id'];?>][url]" value="<?php echo isset($link[$language['language_id']]) ? $link[$language['language_id']]['url'] : ''; ?>" maxlength="255" link_row ="<?php echo $link_row;?>" language="<?php echo $language['language_id'];?>" style="width:600px;"/></td>
                <td class="left"><a onclick="$('#link-row-<?php echo $link_row;?><?php echo $language['language_id'];?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
              </tr>
            </tbody>
            <?php $link_row++;
            	}
            }
            }  ?>
            <tfoot id="tfoot<?php echo $language['language_id']; ?>">
              <tr>
                <td></td>
                <td></td>
                <td class="left"><a onclick="addLink_<?php echo $language['language_id'];?>();" class="button"><span><?php echo $button_add_link; ?></span></a></td>
              </tr>
            </tfoot>
          </table>
          </div>
          <?php } ?>
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

<?php foreach ($languages as $language) { ?>
var link_row<?php echo $language['language_id'];?> = <?php echo $link_row;?>;
function addLink_<?php echo $language['language_id'];?>() {
    html = '<tbody id="link-row-'+link_row<?php echo $language['language_id'];?>+'<?php echo $language['language_id'];?>">';
	html += '  <tr>';
	html += '    <td class="left"><input type="text" name="links['+link_row<?php echo $language['language_id'];?>+'][<?php echo $language['language_id'];?>][name]" maxlength="255" value="" id="titletext'+link_row<?php echo $language['language_id'];?>+ '<?php echo $language['language_id'];?>" style="width:300px;"/></td>';
	html += '    <td class="left"><input type="text" name="links['+link_row<?php echo $language['language_id'];?>+'][<?php echo $language['language_id'];?>][url]" maxlength="255" value="" id="urltext'+link_row<?php echo $language['language_id'];?>+ '<?php echo $language['language_id'];?>" style="width:600px;"/></td>';
	html += '    <td class="left"><a onclick="$(\'#link-row-' +link_row<?php echo $language['language_id'];?>+'<?php echo $language['language_id'];?>\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#links<?php echo $language['language_id']; ?> #tfoot<?php echo $language['language_id'];?>').before(html);
	link_row<?php echo $language['language_id'];?>++;
}
<?php } ?>

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
$('#languages-link a').tabs(); 
$('#vtab-option a').tabs();
//--></script> 
<script type="text/javascript">
/*jQuery.validator.setDefaults({
	debug: true,
	success: "valid"
});*/
</script>

  <script>
  /*$(document).ready(function(){
  	$('input:text').each(function(index) {
  		id = $(this).attr('id');
  		row = $(this).attr('link_row');
  		lang = $(this).attr('language');
  		formid = 'urltext'+row+lang;
	    $(this).validate({
		  rules: {
		    formid: {
		      required: true,
		      url: true
		    }
		  }
		});
	});
  });*/
  </script>

<?php echo $footer; ?>