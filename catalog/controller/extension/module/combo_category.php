<?php
class ControllerExtensionModuleComboCategory extends Controller {
	public function index($setting) {
        static $module = 0;
        $this->load->language('extension/module/combo_category');

		$data['heading_title'] = $this->language->get('heading_title');

        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');

		$data['text_tax'] = $this->language->get('text_tax');
        
        
		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}
		if (!$setting['width']) {
			$setting['width'] = 170;
		}
		if (!$setting['height']) {
			$setting['height'] = 170;
		}
        $category_ids = $setting['combo_categories'];
        $data['categories'] = array();
        foreach ($category_ids as $category_id) {
            $category_info = $this->model_catalog_category->getCategory($category_id);
            if(isset($category_info['name'])){
                $products = array();

                $filter_data = array(
                    'filter_category_id' => $category_id,
                    'sort'               => 'p.date_added',
                    'order'              => 'DESC',
                    'start'              => 0,
                    'limit'              => (int)$setting['limit']
                );
                $results = $this->model_catalog_product->getProducts($filter_data);
                foreach ($results as $result) {
                    if ($result['image']) {
                        $image = $this->model_tool_image->resize($result['image'], (int)$setting['width'], (int)$setting['height']);
                    } else {
                        $image = $this->model_tool_image->resize('placeholder.png', (int)$setting['width'], (int)$setting['height']);
                    }

                    if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                        $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $price = false;
                    }

                    if ((float)$result['special']) {
                        $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $special = false;
                    }

                    if ($this->config->get('config_tax')) {
                        $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
                    } else {
                        $tax = false;
                    }

                    if ($this->config->get('config_review_status')) {
                        $rating = (int)$result['rating'];
                    } else {
                        $rating = false;
                    }

                    $products[] = array(
                        'product_id'  => $result['product_id'],
                        'thumb'       => $image,
                        'name'        => $result['name'],
                        'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                        'price'       => $price,
                        'special'     => $special,
                        'tax'         => $tax,
                        'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
                        'rating'      => $result['rating'],
                        'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] )
                    );
                }
            

            $data['categories'][] = array(
                'category_id' => $category_info['category_id'],
                'name' => $category_info['name'],
                'href' => $this->url->link('product/category', 'path=' . $category_id),
                'products' => $products
            );
            unset($products);
            }
        }

        $data['module'] = $module++;

		if ($data['categories']) {
			return $this->load->view('extension/module/combo_category', $data);
		}
	}
}