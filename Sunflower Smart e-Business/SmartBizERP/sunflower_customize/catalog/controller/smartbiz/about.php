<?php  
class ControllerSmartBizAbout extends SmartBizController {
	public function index() {
		$this->updateStatusMenuNavigation('about');				$this->load->model('smartbiz/company');				$this->data['companies'] = $this->model_smartbiz_company->getAllCompanies();		$this->data['images'] = $this->model_smartbiz_company->getCompanyImages();				$this->data['no_image'] = HTTP_IMAGE.'/no_image.jpg';		$this->data['page_title'] = "Công ty | SmartBiz";
		$this->data['page_description'] = "Những thành viên trụ cột của SmartBiz: Nguyễn Nhất Thanh, Nguyễn Phong Châu, Trần Văn Giang, Nguyễn Trần Bảo Minh";
		$this->display('/template/common/about.tpl');	}}?>