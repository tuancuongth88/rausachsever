<?php
class ControllerExtensionModuleNewsLatest extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/news_latest');

		$data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('news/news');
		$this->load->model('tool/image');

		$data['newss'] = array();

		if(!(int)$setting['limit']) {
			$setting['limit'] = 6;
		}

		$results = $this->model_news_news->getLatestNewss($setting['limit']);
		if($results){
			foreach ($results as $result) {

				if($result['image'] && file_exists(DIR_IMAGE.$result['image'])) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'],'resize');
				} else {
					$image = $this->model_tool_image->resize('no_image.png', $setting['width'], $setting['height']);
				}

				$data['newss'][] = array(
					'news_id'     => $result['news_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'date_available'  => date($this->language->get('date_format_short'), strtotime($result['date_available'])),
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '...',
					'href'        => $this->url->link('news/news', 'news_id=' . $result['news_id'])
				);
			}
			return $this->load->view('extension/module/news_latest', $data);
		}
	}
}
