<div class="SubWrapper">
	        <div class="DetailPage">
	            <div class="LeftColumn1">
	               <ul class="SubMenuPages" id="left_menu">
		                <li class="<?php echo $product_selectLava['business-modeling-consulting']?>"><a href="<?php echo $link_service_detail?>/business-modeling-consulting" class="<?php echo $product_type['business-modeling-consulting']?>" title="<?php echo __("Consulting")?>"><span class="Smart"><?php echo __("Consulting")?></span></a></li>
		                <li class="<?php echo $product_selectLava['erp-implementation']?>"><a href="<?php echo $link_service_detail?>/erp-implementation" class="<?php echo $product_type['erp-implementation']?>" title="<?php echo __("erp-implementation")?>"><span class="Enter"><?php echo __("Implementation")?></span></a></li>
		                <li class="<?php echo $product_selectLava['outsourcing']?>"><a href="<?php echo $link_service_detail?>/outsourcing" class="<?php echo $product_type['outsourcing']?>" title="<?php echo __("Outsourcing")?>"><span class="Business"><?php echo __("Outsourcing")?></span></a></li>
		                <li class="<?php echo $product_selectLava['data-integration']?>"><a href="<?php echo $link_service_detail?>/data-integration" class="<?php echo $product_type['data-integration']?>" title="<?php echo __('Documentation')?>"><span class="Commerce"><?php echo __('Documentation')?></span></a></li>
		                <li class="<?php echo $product_selectLava['request']?>"><a href="<?php echo $link_contact?>" title="<?php echo __('Request')?>"><span class="Human"><?php echo __('Request')?></span></a></li>
		                <li class="<?php echo $product_selectLava['training']?>"><a href="<?php echo $link_service_detail?>/training" class="<?php echo $product_type['training']?>" title="<?php echo __("Training")?>"><span class="Point"><?php echo __("Training")?></span></a></li>
	                </ul>
	            </div>
	            <h2 class="DetailTitle" id="service_title"><?php if($product_selectLava['business-modeling-consulting']=="selectedLava") {echo "Business Modeling Consulting";}
				else if($product_selectLava['erp-implementation']=="selectedLava") {echo "ERP Implementation";}
				else if($product_selectLava['outsourcing']=="selectedLava") {echo "Outsourcing";}
				else if($product_selectLava['data-integration']=="selectedLava") {echo "Data Integration";}
				else if($product_selectLava['request']=="selectedLava") {echo "Request";}
				else if($product_selectLava['training']=="selectedLava") {echo "Training";}
	            ?></h2>
	            <?php if($product_selectLava['business-modeling-consulting']=="selectedLava"){?>
	            <div class="RightColumn1" id="business-modeling-consulting" style="<?php echo $product_display['business-modeling-consulting']?>">
	            	<div class ="MainContent" id="solution-content">
	            		
	            		<div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-consulting];" href="<?php echo RESOURCE_PATH?>/img/service/consulting.png" title="IT Master Plan">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/consulting.png" height="233px" alt="IT Master Plan" title="IT Master Plan"  />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_master_plan_content")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-soa];" href="<?php echo RESOURCE_PATH?>/img/service/esb.jpg" title="SOA ESB">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/esb.jpg" height="233px" alt="SOA ESB" title="SOA ESB" />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_SOA_content")?>
								</p>
			                    </div>
			                </div>
		                </div>
	            		<div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-agile];" href="<?php echo RESOURCE_PATH?>/img/service/agile_approach.jpg" title="Agile Approach">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/agile_approach.jpg" height="233px" alt="Agile Approach" title="Agile Approach" />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_approach_content")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-networking];" href="<?php echo RESOURCE_PATH?>/img/service/network_diagram.jpg" title="Network Diagram">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/network_diagram.jpg" height="233px" alt="Network Diagram" title="Network Diagram" />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_networking_content")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-architecture];" href="<?php echo RESOURCE_PATH?>/img/service/technical_architecture.png" title="Technical Architecture">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/technical_architecture.png" height="233px" alt="Technical Architecture" title="Technical Architecture" />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_architecture_content")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-workflow];" href="<?php echo RESOURCE_PATH?>/img/service/stock_out.png" title="Stock Out">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/stock_out.png" height="233px" alt="Stock Out" title="Stock Out" />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_workflow_content")?>
								</p>
			                    </div>
			                </div>
		                </div>
	                </div>
	                <div class="cb"></div>
	                <div class="ThreeCols">
	                    <div class="ThreeCols1">
	                        <div class="BtPrevious"><span><a class="prev" title="Previous">Previous</a></span></div>
	                    </div>
	                    <div class="ThreeCols2">
	                    	<div class="items">
	                    		<div>
			                        <ul class="AnLinks">
			                        	<li class="ITPlan"><a href="#" title="<?php  echo __('sv_title_master_plan')?>"><?php  echo __('sv_title_master_plan')?></a></li>
			                        	<li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_SOA')?>"><?php  echo __('sv_title_SOA')?></a></li>
					                    <li class="AgileApproach"><a href="#" title="<?php  echo __('sv_title_approach')?>"><?php  echo __('sv_title_approach')?></a></li>
							            <li class="Networking"><a href="#" title="<?php  echo __('sv_title_networking')?>"><?php  echo __('sv_title_networking')?></a></li>
										<li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_architecture')?>"><?php  echo __('sv_title_architecture')?></a></li>
										<li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_workflow')?>"><?php  echo __('sv_title_workflow')?></a></li>
					                </ul>  
				                </div>
	                    	</div>
	                    </div>
	                    <div class="ThreeCols3">
	                        <div class="BtNext"><span><a class="next" title="Next">Next</a></span></div>
	                    </div>
	                </div>
	            </div>
	             <?php } else if($product_selectLava['erp-implementation']=="selectedLava"){?>
	            <div class="RightColumn1" id="erp-implementation" style="<?php echo $product_display['erp-implementation']?>">
	            	<div class ="MainContent" id="solution-content">
	            		<div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-scope];" href="<?php echo RESOURCE_PATH?>/img/service/scope.jpg" title="Scope">
			                	<img src="<?php echo RESOURCE_PATH?>/img/service/scope.jpg" height="233px" alt="Scope" title="Scope" />
		                	</a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_scope")?>
								</p>
			                    </div>
			                </div>
		                </div>
		               <div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-implementation];" href="<?php echo RESOURCE_PATH?>/img/service/implementation_methodology_3.png" title="Implementation Plan">
			                	<img src="<?php echo RESOURCE_PATH?>/img/service/implementation_methodology_3.png" height="233px" alt="Implementation Plan" title="Implementation Plan" />
		                	</a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_implementation")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-requirement];" href="<?php echo RESOURCE_PATH?>/img/service/implementation_methodology_3.png" title="Requirement Interview">
			                	<img src="<?php echo RESOURCE_PATH?>/img/service/implementation_methodology_3.png" height="233px" alt="Requirement Interview" title="Requirement Interview" />
		                	</a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_requirement")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-nerwork_implementation];" href="<?php echo RESOURCE_PATH?>/img/service/implementation_methodology_3.png" title="Network Interview">
			                	<img src="<?php echo RESOURCE_PATH?>/img/service/implementation_methodology_3.png" height="233px" alt="Network Interview" title="Network Interview" />
		                	</a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_network")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-nerwork_data_migration];" href="<?php echo RESOURCE_PATH?>/img/service/DataMigration.png" title="Data Migration">
			                	<img src="<?php echo RESOURCE_PATH?>/img/service/DataMigration.png" height="233px" alt="Data Migration" title="Data Migration" />
		                	</a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_migration")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv-nerwork_content_pos];" href="<?php echo RESOURCE_PATH?>/img/service/DataMigration.png" title="Post Implementation">
			                	<img src="<?php echo RESOURCE_PATH?>/img/service/implementation_methodology_3.png" height="233px" alt="Post Implementation" title="Post Implementation" />
		                	</a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_post_implementation")?>
								</p>
			                    </div>
			                </div>
		                </div>
	                </div>
	                <div class="cb"></div>
	                <div class="ThreeCols">
	                    <div class="ThreeCols1">
	                        <div class="BtPrevious"><span><a class="prev" title="Previous">Previous</a></span></div>
	                    </div>
	                    <div class="ThreeCols2">
	                    	<div class="items">
	                    		<div>
			                        <ul class="AnLinks">
			                        	<li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_scope')?>"><?php  echo __('sv_title_scope')?></a></li>
					                    <li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_implementation')?>"><?php  echo __('sv_title_implementation')?></a></li>
							            <li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_requirement')?>"><?php  echo __('sv_title_requirement')?></a></li>
										<li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_network')?>"><?php  echo __('sv_title_network')?></a></li>
										<li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_migration')?>"><?php  echo __('sv_title_migration')?></a></li>
										<li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_post_implementation')?>"><?php  echo __('sv_title_post_implementation')?></a></li>
					                </ul>  
				                </div>
	                    	</div>
	                    </div>
	                    <div class="ThreeCols3">
	                        <div class="BtNext"><span><a class="next" title="Next">Next</a></span></div>
	                    </div>
	                </div>
	            </div>
	            <?php } else if($product_selectLava['training']=="selectedLava"){?>
	            <div class="RightColumn1" id="training" style="<?php echo $product_display['training']?>">
	            	<div class ="MainContent" id="solution-content">
	            		<div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv_what_to_train];" href="<?php echo RESOURCE_PATH?>/img/service/trainning_original.png" title="SmartBiz what to train">
			                <img src="<?php echo RESOURCE_PATH?>/img/service/trainning.png" height="233" alt="SmartBiz what to train" title="SmartBiz what to train" />
			                </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_what_to_train")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service">
			                <a rel="shadowbox[sv_how_to_train];" href="<?php echo RESOURCE_PATH?>/img/service/training_original.png" title="SmartBiz how to train">
			                <img src="<?php echo RESOURCE_PATH?>/img/service/training.png" alt="SmartBiz how to train" title="SmartBiz how to train" />
			                </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_how_to_train")?>
								</p>
			                    </div>
			                </div>
		                </div>
	                </div>
	                <div class="cb"></div>
	                <div class="ThreeCols">
	                    <div class="ThreeCols1">
	                        <div class="BtPrevious"><span><a class="prev" title="Previous">Previous</a></span></div>
	                    </div>
	                    <div class="ThreeCols2">
	                    	<div class="items">
	                    		<div>
			                        <ul class="AnLinks">
			                        	<li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_what_to_train')?>"><?php  echo __('sv_title_what_to_train')?></a></li>
					                    <li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_how_to_train')?>"><?php  echo __('sv_title_how_to_train')?></a></li>
					                </ul>  
				                </div>
	                    	</div>
	                    </div>
	                    <div class="ThreeCols3">
	                        <div class="BtNext"><span><a class="next" title="Next">Next</a></span></div>
	                    </div>
	                </div>
	            </div>
	            
	            <?php } else if($product_selectLava['outsourcing']=="selectedLava"){?>
	            <div class="RightColumn1" id="outsourcing" style="<?php echo $product_display['outsourcing']?>">
	            	<div class ="MainContent" id="solution-content">
	            		<div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-technology];" href="<?php echo RESOURCE_PATH?>/img/service/php-architecture.png" title="Technology">
			                <img src="<?php echo RESOURCE_PATH?>/img/service/php-architecture.png" height="233" alt="Technology" title="Technology" />
		                	</a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_technology")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-benefits];" href="<?php echo RESOURCE_PATH?>/img/service/ebiz.png" title="Benefits">
			                <img src="<?php echo RESOURCE_PATH?>/img/service/ebiz.png" height="233" alt="Benefits" title="Benefits" />
			                </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_Benefits")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-scrum];" href="<?php echo RESOURCE_PATH?>/img/service/ScrumOverviewResized.png" title="SCRUM – for small projects">
			                <img src="<?php echo RESOURCE_PATH?>/img/service/ScrumOverviewResized.png" height="233" alt="SCRUM – for small projects" title="SCRUM – for small projects" />
			                </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_scrum")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-rup];" href="<?php echo RESOURCE_PATH?>/img/service/rup.png" title="RUP – for large projects">
			                <img src="<?php echo RESOURCE_PATH?>/img/service/rup.png" height="233" alt="RUP – for large projects" title="RUP – for large projects" />
			                </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_rup")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-java];" href="<?php echo RESOURCE_PATH?>/img/service/java_original.png" title="Use case – JAVA">
			                <img src="<?php echo RESOURCE_PATH?>/img/service/java.png" height="233" alt="Use case – JAVA" title="Use case – JAVA" />
			                </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_java")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-content-php];" href="<?php echo RESOURCE_PATH?>/img/service/php-overview.png" title="Use case – PHP Ecommerce">
			                <img src="<?php echo RESOURCE_PATH?>/img/service/php-overview.png" height="233" alt="Use case – PHP Ecommerce" title="Use case – PHP Ecommerce" />
			                </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_php")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-database];" href="<?php echo RESOURCE_PATH?>/img/service/database_original.png" title="Use case – Database ">
			                <img src="<?php echo RESOURCE_PATH?>/img/service/database.png" alt="Use case – Database " title="Use case – Database " />
			                </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_db")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-oursourcing];" href="<?php echo RESOURCE_PATH?>/img/service/outsourcing.png" title="Why SunflowerVN">
			                <img src="<?php echo RESOURCE_PATH?>/img/service/outsourcing.png" height="233" alt="Why SunflowerVN" title="Why SunflowerVN" />
			                </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_why_sun_oursourcing")?>
								</p>
			                    </div>
			                </div>
		                </div>
	                </div>
	                <div class="cb"></div>
	                <div class="ThreeCols">
	                    <div class="ThreeCols1">
	                        <div class="BtPrevious"><span><a class="prev" title="Previous">Previous</a></span></div>
	                    </div>
	                    <div class="ThreeCols2">
	                    	<div class="items">
	                    		<div>
			                        <ul class="AnLinks">
			                        	<li class="OursourcingTechnology"><a href="#" title="<?php  echo __('sv_title_technology')?>"><?php  echo __('sv_title_technology')?></a></li>
					                    <li class="OursourcingBenefits"><a href="#" title="<?php  echo __('sv_title_Benefits')?>"><?php  echo __('sv_title_Benefits')?></a></li>
					                    <li class="OursourcingScrum"><a href="#" title="<?php  echo __('sv_title_scrum')?>"><?php  echo __('sv_title_scrum')?></a></li>
					                    <li class="OursourcingRup"><a href="#" title="<?php  echo __('sv_title_rup')?>"><?php  echo __('sv_title_rup')?></a></li>
					                    <li class="OursourcingJava"><a href="#" title="<?php  echo __('sv_title_java')?>"><?php  echo __('sv_title_java')?></a></li>
					                    <li class="OursourcingPhp"><a href="#" title="<?php  echo __('sv_title_php')?>"><?php  echo __('sv_title_php')?></a></li>
					                </ul>  
				                </div>
				                <div>
			                        <ul class="AnLinks">
					                    <li class="OursouringDatabase"><a href="#" title="<?php  echo __('sv_title_db')?>"><?php  echo __('sv_title_db')?></a></li>
					                    <li class="OursourcingSmartbiz"><a href="#" title="<?php  echo __('sv_title_why_sun_oursourcing')?>"><?php  echo __('sv_title_why_sun_oursourcing')?></a></li>
					                </ul>  
				                </div>
	                    	</div>
	                    </div>
	                    <div class="ThreeCols3">
	                        <div class="BtNext"><span><a class="next" title="Next">Next</a></span></div>
	                    </div>
	                </div>
	            </div>
	            <?php } else if($product_selectLava['request']=="selectedLava"){?>
	            <div class="RightColumn1" id="request" style="<?php echo $product_display['request']?>">
	            	<div class ="MainContent" id="solution-content">
	            		<div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                    
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("Request_content")?>
								</p>
			                    </div>
			                </div>
		                </div>
	                </div>
	                <div class="cb"></div>
	            </div>
	            <?php } else if($product_selectLava['data-integration']=="selectedLava"){?>
	            <div class="RightColumn1" id="data-integration" style="<?php echo $product_display['data-integration']?>">
	            	<div class ="MainContent" id="solution-content">
	            		<div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-integration];" href="<?php echo RESOURCE_PATH?>/img/service/data-integration.png" title="Data Integration">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/data-integration.png" height="233" alt="Data Integration" title="Data Integration" />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_why_etl")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-smart-etl];" href="<?php echo RESOURCE_PATH?>/img/service/SmartETL.png" title="Smart ETL">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/SmartETL.png" height="233" alt="Smart ETL" title="Smart ETL" />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_smart_etl")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-when-etl];" href="<?php echo RESOURCE_PATH?>/img/service/data-migration.png" title="When ETL">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/data-migration.png" height="233" alt="When ETL" title="When ETL" />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_when_etl")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-application];" href="<?php echo RESOURCE_PATH?>/img/service/data-migration.png" title="UC Application integration">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/data-migration.png" height="233" alt="UC Application integration" title="UC Application integration" />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_uc_application_integration")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-exploration];" href="<?php echo RESOURCE_PATH?>/img/service/data-migration.png" title="UC Exploration data">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/data-migration.png" height="233" alt="UC Exploration data" title="UC Exploration data" />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_uc_exploration_data")?>
								</p>
			                    </div>
			                </div>
		                </div>
		                <div class="solution-content">
			                <div class="SubLeftColumn1 service" >
			                <a rel="shadowbox[sv-uc6];" href="<?php echo RESOURCE_PATH?>/img/service/etl.png" title="ETL Tools">
			                    <img src="<?php echo RESOURCE_PATH?>/img/service/etl.png" height="233" alt="ETL Tools" title="ETL Tools" />
		                    </a>
			                </div>
			                <div class="SubLeftColumn2 W500Service scroll-pane">
			                    <div class="W290 W500Service">
								<p class="W290List W500Service">
									<?php echo __("sv_content_uc6")?>
								</p>
			                    </div>
			                </div>
		                </div>
	                </div>
	                <div class="cb"></div>
	                <div class="ThreeCols">
	                    <div class="ThreeCols1">
	                        <div class="BtPrevious"><span><a class="prev" title="Previous">Previous</a></span></div>
	                    </div>
	                    <div class="ThreeCols2">
	                    	<div class="items">
	                    		<div>
			                        <ul class="AnLinks">
					                    <li class="WhyEtl"><a href="#" title="<?php  echo __('sv_title_why_etl')?>"><?php  echo __('sv_title_why_etl')?></a></li>
							            <li class="Etl"><a href="#" title="<?php  echo __('sv_title_smart_etl')?>"><?php  echo __('sv_title_smart_etl')?></a></li>
										<li class="WhenEtl"><a href="#" title="<?php  echo __('sv_title_when_etl')?>"><?php  echo __('sv_title_when_etl')?></a></li>
										<li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_uc_application_integration')?>"><?php  echo __('sv_title_uc_application_integration')?></a></li>
										<li class="Exploration"><a href="#" title="<?php  echo __('sv_title_uc_exploration_data')?>"><?php  echo __('sv_title_uc_exploration_data')?></a></li>
										<li class="UnderConstruction"><a href="#" title="<?php  echo __('sv_title_uc6')?>"><?php  echo __('sv_title_uc6')?></a></li>
					                </ul>  
				                </div>
	                    	</div>
	                    </div>
	                    <div class="ThreeCols3">
	                        <div class="BtNext"><span><a class="next" title="Next">Next</a></span></div>
	                    </div>
	                </div>
	            </div>
	            <?php }?>
	        </div>
	    </div>