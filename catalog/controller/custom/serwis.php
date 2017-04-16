<?php  
class ControllerCustomSerwis extends Controller {
	public function index() {
		$this->language->load('custom/serwis');
		$this->load->model('news/news');
		$this->load->model('tool/image');
		$this->document->setTitle($this->language->get('heading_title'));

		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$results = $this->model_news_news->getLatestNewss(1000);
		if($results){
			foreach ($results as $result) {

				if($result['image'] && file_exists(DIR_IMAGE.$result['image'])) {
					$image = $this->model_tool_image->resize($result['image'], 500,300,'resize');
				} else {
					$image = $this->model_tool_image->resize('no_image.png', 500,300);
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
		}
		$this->response->setOutput($this->load->view('custom/serwis', $data));

	}
}
?>