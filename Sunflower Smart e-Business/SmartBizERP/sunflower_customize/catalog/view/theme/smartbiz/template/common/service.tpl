<script language="javascript" type="text/javascript">
$(document).ready(function() {
	$('#product_title').html($('#onlyShowFirst').val());
	$('.subtablink').click(function() {
		$('#product_title').text($(this).attr('title'));
	});
});
</script>
<div class="SubWrapper">
    <div class="DetailPage">
        <div class="LeftColumn1">
		   <ul class="SubMenuPages" id = "left_menu">
		   		<?php $i = 0; foreach($services as $service) {
		   		if($keys[$i] == 'request') {
		   		?>
		   		<li class="<?php if($service['service_id'] == $id) echo 'selectedLava';?>">
					<a href="<?php echo $link_contact;?>/<?php echo $service['searchengine'];?>/id:<?php echo $service['service_id'];?>" class="<?php if($service['service_id'] == $id) echo 'SubMenuPagesCur';?>" title="<?php echo $service['name'];?>">
						<span class="<?php echo $spans[$i];?>"><?php echo $service['name'];?></span>
					</a>
				</li>
		   		<?php
		   		} else {
		   		?>
				<li class="<?php if($service['service_id'] == $id) echo 'selectedLava';?>">
					<a href="<?php echo $link_service_detail?>/<?php echo $service['searchengine'];?>/id:<?php echo $service['service_id'];?>" class="<?php if($service['service_id'] == $id) echo 'SubMenuPagesCur';?>" title="<?php echo $service['name'];?>">
						<span class="<?php echo $spans[$i];?>"><?php echo $service['name'];?></span>
					</a>
				</li>
				<?php } $i++; } ?>
		   </ul>
        </div>
        
        <?php if(!empty($serviceDataObj)) { ?>
        <h2 class="DetailTitle" id="product_title">
        </h2>
        
        <div class="RightColumn1" id="<?php echo $cur_key;?>" style="<?php echo $product_display[$cur_key]?>">
        	<?php $i = 0; foreach($serviceDetailDataObjs as $serviceDetailDataObj) { ?>
	        	<?php if($i == 0) { ?>
	        		<input type="hidden" id="onlyShowFirst" value="<?php echo $serviceDataObj['name'].' - '.$serviceDetailDataObj['name'];?>"/>
	        	<?php } ?>
	        	<div class ="MainContent" id="service-content_<?php  echo $serviceDetailDataObj['service_detail_id'];?>">
	        		<div class="service-content">
		                <div class="SubLeftColumn1 service" align="center">
		                    <a rel="shadowbox[smartbiz-suite-<?php echo strtolower($listMenu[$cur_key][$i]);?>" href="<?php echo HTTP_IMAGE.$serviceDetailDataObj['image_preview']; ?>" title="<?php echo $serviceDetailDataObj['name'];?>">
		                    <img height="233" src="<?php echo HTTP_IMAGE.$serviceDetailDataObj['image']; ?>" class="watermark" alt="<?php echo $serviceDetailDataObj['name'];?>" /></a>
		                </div>
		                <div class="SubLeftColumn2 <?php echo $product_scrollpane[$cur_key];?>">
		                    <div class="W290 W500Service">
								<div class="W290List W500Service">
									<?php echo html_entity_decode($serviceDetailDataObj['description']);?>
								</div>
		                    </div>
		                </div>
	                </div>
	            </div>
	            <?php $i++; } ?>
	            <div class="cb"></div>
	            <div class="ThreeCols">
	                <div class="ThreeCols1">
	                    <div class="BtPrevious"><span><a class="prev" title="Previous">Previous</a></span></div>
	                </div>
	                <div class="ThreeCols2">
	                	<div class="items">
			                <div>
	                        <ul class="AnLinks">
	                        <?php $i = 0; foreach($serviceDetailDataObjs as $serviceDetailDataObj) { ?>
			                    <li class="<?php echo $listMenu[$cur_key][$i];?>">
			                    	<a class="subtablink" href="#" title="<?php  echo $serviceDataObj['name'].' - '.$serviceDetailDataObj['name'];?>">
			                    		<?php echo $serviceDetailDataObj['name'];?>
			                    	</a>
			                    </li>
			                <?php 
			                if($i % 5 == 0 && $i > 0) {
			                ?>
			                </ul>
			                </div>
			                <div>
	                        <ul class="AnLinks">
			                <?php
			                }
			                $i++; } ?>
			                </ul>
			                </div>
	                	</div>
	                </div>
	                <div class="ThreeCols3">
	                    <div class="BtNext"><span><a class="next" title="Next">Next</a></span></div>
	                </div>
	            </div>
	        <?php } ?>
        </div>
    </div>
</div>