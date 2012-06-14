<form action="" method="post" id="checkout">
<b style="margin-bottom: 3px; display: block;"><?php echo $text_gateway_title; ?></b>
<div style="background: #F7F7F7; border: 1px solid #DDDDDD; padding: 10px; margin-bottom: 10px;">
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
  <table width="85%" border="0">    
<?php
	switch($step) { 	
	case 2:
?>
    <tr> 
      <td width="170px"><?php echo $text_serial_no; ?></td>
      <td> <input type="text" name="p_serial_no" value="<?php echo $p_serial_no; ?>" readonly="true"></td>
    </tr>
    <tr> 
      <td><?php echo $text_card_no; ?></td>
      <td> <input type="text" name="p_card_no" value="<?php echo $p_card_no;?>">
	  <input type="hidden" name="p_trans_session_id" value="<?=$arrOutPut[0]["TRANS_SESSION_ID"]?>">
		<input type="hidden" name="step" value="3">
	  <?php if ($error_card_no) { ?><span class="error"><?php echo $error_card_no; ?></span><?php } ?></td>
    </tr>
	<?php if(!empty($arrOutPut[0]["P_PIN_ONE"])) { ?>
    <tr> 
      <td><font face="Arial, Helvetica, sans-serif" color="#FF0000"><?=$arrOutPut[0]["P_PIN_ONE"]?></font> <?php echo $text_pin_no; ?></td>
      <td> <input type="text" name="p_pin_one" value="<?php echo $p_pin_one?>">
	  <?php if ($error_pin_one) { ?><span class="error"><?php echo $error_pin_one; ?></span><?php } ?></td>
    </tr>
	<?php } 
		 if(!empty($arrOutPut[0]["P_PIN_TWO"])) { 
	?>
    <tr> 
      <td><font face="Arial, Helvetica, sans-serif" color="#FF0000"><?=$arrOutPut[0]["P_PIN_TWO"]?></font> <?php echo $text_pin_no; ?></td>
      <td><input type="text" name="p_pin_two" value="<?php echo $p_pin_two;?>">
	  <?php if ($error_pin_two) { ?><span class="error"><?php echo $error_pin_two; ?></span><?php } ?></td>
    </tr>
	<?php } 
	  	  if(!empty($arrOutPut[0]["P_PAC_CODE_ONE"])) { 
	?>
    <tr> 
      <td><?php echo $text_pac_code; ?> <font face="Arial, Helvetica, sans-serif" color="#FF0000"><?=$arrOutPut[0]["P_PAC_CODE_ONE"]?></font>:</td>
      <td><input type="text" name="p_pac_code_one" value="<?php echo $p_pac_code_one;?>">
	  <?php if ($error_pac_one) { ?><span class="error"><?php echo $error_pac_one; ?></span><?php } ?></td></tr>
	<?php }
	  	  if(!empty($arrOutPut[0]["P_PAC_CODE_TWO"])) {
	?>
    <tr> 
      <td><?php echo $text_pac_code; ?> <font face="Arial, Helvetica, sans-serif" color="#FF0000"><?=$arrOutPut[0]["P_PAC_CODE_TWO"]?></font>:</td>
      <td><input type="text" name="p_pac_code_two" value="<?php echo $p_pac_code_two;?>">
	  <?php if ($error_pac_two) { ?><span class="error"><?php echo $error_pac_two; ?></span><?php } ?></td>
    </tr>
	<?php } 
		if(!empty($arrOutPut[0]["VAL_CARD_EXP"]) && $arrOutPut[0]["VAL_CARD_EXP"]=="Y") {
	?>
    <tr> 
      <td><?php echo $text_card_exp; ?></td>
      <td> 
        <select name="p_card_exp_month">
		  <option value="">Month</option>	
          <?php foreach ($months as $month) { ?>
          <option value="<?php echo $month['value']; ?>" <?php echo $p_card_exp_month==$month['value']?"selected":""; ?>><?php echo $month['text']; ?></option>
          <?php } ?>
        </select>
         / 
        <select name="p_card_exp_year">
		  <option value="">Year</option>		
          <?php foreach ($year_expire as $year) { ?>
          <option value="<?php echo $year['value']; ?>" <?php echo $p_card_exp_year==$year['value']?"selected":""; ?>><?php echo $year['text']; ?></option>
          <?php } ?>
        </select>
		<?php if ($error_exp_date) { ?><span class="error"><?php echo $error_exp_date; ?></span><?php } ?>
		</td>
    </tr>
	<?php } ?>
    <?php
	break;
	default :
?>
    <tr> 
      <td width="170px" valign="top"><?php echo $text_serial_no; ?></td>
      <td valign="top">
	  	<input type="text" name="p_serial_no" value="<?php echo $p_serial_no; ?>">
	  	<?php if ($error_serial_no) { ?><span class="error"><?php echo $error_serial_no; ?></span><?php } ?>
		<input type="hidden" name="step" value="2"><input type="hidden" name="p_sms_pac" value="Y">
	  </td>
    </tr>	
    <?php } ?>    
  </table>
</div>
<div class="buttons">
  <table>
    <tr>
      <td align="left"><a onclick="location = '<?php echo str_replace('&', '&amp;', $back); ?>'" class="button"><span><?php echo $button_back; ?></span></a></td>
      <td align="right"><a onclick="$('#checkout').submit();" class="button"><span><?php echo $button_confirm; ?></span></a></td>
    </tr>
  </table>
</div>
</form>