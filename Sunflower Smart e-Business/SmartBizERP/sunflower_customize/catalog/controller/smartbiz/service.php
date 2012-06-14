<?php
class ControllerSmartBizService extends SmartBizController {
	private $error = array();
	public function index() {
		$this->data['link_service_detail'] = $this->getServicePage();
		$this->updateStatusMenuNavigation('service');		$this->load->model('smartbiz/service');		$this->load->model('smartbiz/service_detail');		$services = $this->model_smartbiz_service->getAll();        foreach($services as &$service) {            $names = explode(' ',$service['name']);            $temp = array();            foreach($names as $key=>$name) {                if(!empty($name) && $name != '-') {                    $temp[$key] = $name;                }            }            $service['searchengine'] = mb_strtolower(implode('-',$temp),'UTF-8');        }		$this->data['services'] = $services;		$uri = $_SERVER['REQUEST_URI'];		$elements = explode('/',$uri);		$params = array();		foreach($elements as $ele) {			if(strpos($ele,':') !== false) {				$arr = explode(':',$ele);				$params[$arr[0]] = $arr[1];				$this->data[$arr[0]] = $arr[1];			}		}		if(!isset($params['id'])) {			$parent = $this->model_smartbiz_service->getFirstId();			$params['id'] = $parent['service_id'];			$this->data['id'] = $parent['service_id'];		}		$serviceDataObj = $this->model_smartbiz_service->getById($params['id']);		$this->data['serviceDataObj'] = $serviceDataObj;		$serviceDetailDataObjs = $this->model_smartbiz_service_detail->getByParentId($params['id']);		$this->data['serviceDetailDataObjs'] = $serviceDetailDataObjs;		$this->document->setKeywords($serviceDataObj['meta_keyword']);		$this->data['keywords'] = $this->document->getKeywords();		$product_type = array(
			'business-modeling-consulting' => '',
			'erp-implementation' => '',
			'outsourcing' => '',
			'data-integration' => '',
			'request' => '',
			'training' => '',
		);

		$keys = array_keys($product_type);

		foreach($keys as $key) {
			$product_display[$key] = 'display:none;';
			$product_selectLava[$key] = '';
			$product_scrollpane[$key] = '';
		}

		$spans = array(
			'Smart',
			'Enter',
			'Business',
			'Commerce',
			'Human',
			'Point',
		);
		$listMenu = array(
			'business-modeling-consulting' => array(
									'ITPlan',
									'UnderConstruction',
									'AgileApproach',
									'Networking',
									'UnderConstruction',
									'UnderConstruction',
		),
			'erp-implementation' => array(
									'UnderConstruction',
									'UnderConstruction',
									'UnderConstruction',
									'UnderConstruction',
									'UnderConstruction',
									'UnderConstruction',
		),
			'outsourcing' => array(
									'OursourcingTechnology',
									'OursourcingBenefits',
									'OursourcingScrum',
									'OursourcingRup',
									'OursourcingJava',
									'OursourcingPhp',
									'OursouringDatabase',
									'OursourcingSmartbiz',
		),
			'data-integration' => array(
									'WhyEtl',
									'Etl',
									'WhenEtl',
									'UnderConstruction',
									'Exploration',
									'UnderConstruction',
									'WhenEtl',
									'UnderConstruction',
		),
			'training' => array(
									'UnderConstruction',
									'UnderConstruction',
		),
		);
		if (isset($this->request->get['product_type'])) {
			$product_type[$this->request->get['product_type']] = 'SubMenuPagesCur';
			$product_display[$this->request->get['product_type']] = 'display:block;';
			$product_selectLava[$this->request->get['product_type']] = 'selectedLava';
			$product_scrollpane[$this->request->get['product_type']] = 'scroll-pane';
			$this->data['js_binding_tab_click'] = 'bindingTabClick("' . $this->request->get['product_type'] . '", true);';
		} else {
			$product_type['business-modeling-consulting'] = 'SubMenuPagesCur';
			$product_display['business-modeling-consulting'] = 'display:block;';
			$product_selectLava['business-modeling-consulting'] = 'selectedLava';
			$product_scrollpane['business-modeling-consulting'] = 'scroll-pane';
			$this->data['js_binding_tab_click'] = 'bindingTabClick("business-modeling-consulting", true);';
		}		$this->data['spans'] = $spans;
		$this->data['keys'] = $keys;
		$this->data['cur_key'] = isset($this->request->get['product_type'])?$this->request->get['product_type']:$keys[0];
		$this->data['listMenu'] = $listMenu;
		$this->data['product_type'] = $product_type;		$this->data['product_display'] = $product_display;		$this->data['product_selectLava'] = $product_selectLava;		$this->data['product_scrollpane'] = $product_scrollpane;
		if (isset($this->request->get['product_type'])) {			if($this->request->get['product_type'] == 'business-modeling-consulting')			{				$this->data['page_title'] = "Tư vấn chiến lược và giải pháp toàn diện cho doanh nghiệp | SmartBiz";				$this->data['page_description'] = "SmartBiz cùng khách hàng xây dựng IT Master Plan định hướng phát triển công nghệ thông tin theo chiến lược của doanh nghiệp";			}			else if($this->request->get['product_type'] == 'erp-implementation')			{				$this->data['page_title'] = "Cách thức triển khai hệ thống cho doanh nghiệp | SmartBiz";				$this->data['page_description'] = "SmartBiz xây dựng phương thức triển khai chặt chẽ chi tiết bảo đảm tính hiệu quả của giải pháp và sự đón nhận của khách hàng.";			}			else if($this->request->get['product_type'] == 'outsourcing')			{				$this->data['page_title'] = "Dịch vụ Outsourcing | SmartBiz";				$this->data['page_description'] = "SmartBiz cung cấp nguồn nhân lực kinh nghiệm dồi dào với phương thức quản lý phù hợp với từng dự án để đảm báo chất lượng, thời gian, và chi phí của dự án. Công nghệ là điểm mạnh của chúng tôi, tập trung vào Java và PHP";			}			else if($this->request->get['product_type'] == 'data-integration')			{				$this->data['page_title'] = "Tích hợp dư liệu tập trung | SmartBiz";				$this->data['page_description'] = "ETL cho phép nạp dữ liệu từ nhiều nguồn, nhiều cơ sở dữ liệu khác nhau, sau đó dữ liệu có thể được chuyển đổi định dạng lại và nạp tập trung vào cơ sử dữ liệu đích. SmartBiz cũng đồng bộ dữ liệu giữa phần mềm bán hàng và phần mềm quản lý doanh nghiệp";			}			else if($this->request->get['product_type'] == 'training')			{				$this->data['page_title'] = "Đăng ký nhận bản thiết kế hệ thống | SmartBiz";				$this->data['page_description'] = "Quý khách hàng có thể xem bản thiết kế mẫu của chúng tôi bao gồm các phân hệ phần mềm và chức năng cho một doanh nghiệp. Xin hãy liên lạc với chúng tôi để biết thêm chi tiết";			}		}

		$this->data['link_contact'] = $this->getRequestProposalPage();
		$this->display('/template/common/service.tpl');
	}
}
?>