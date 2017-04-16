<?php

/**
 *
 * Controller   : ControllerNewsNews
 *
 * @property ModelNewsCategory         model_news_category
 * @property ModelNewsNews             model_news_news
 * @property ModelToolImage            model_tool_image
 * @property ModelLocalisationLanguage model_localisation_language
 * @property ModelNewsUrlAlias         model_news_url_alias
 *
 **/
class ControllerNewsNews extends Controller
{
    private $error = array();

    public function index() {
        $this->load->language('news/news');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('news/news');

        $this->getList();
    }

    public function add() {
        $this->load->language('news/news');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('news/news');

        if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $news_id = $this->model_news_news->addNews($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if(isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if(isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if(isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if(isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if(isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if(isset($this->request->get['redirect'])) {
                switch ($this->request->get['redirect']) {
                    case "edit":
                        $this->response->redirect($this->url->link('news/news/edit', 'token=' . $this->session->data['token'] . '&news_id=' . $news_id . $url, TRUE));
                        break;
                    case "add":
                        $this->response->redirect($this->url->link('news/news/add', 'token=' . $this->session->data['token'] . $url, TRUE));
                        break;
                    case "exit";
                        $this->response->redirect($this->url->link('news/news', 'token=' . $this->session->data['token'] . $url, TRUE));
                        break;
                    default:
                        $this->response->redirect($this->url->link('news/news', 'token=' . $this->session->data['token'] . $url, TRUE));
                }
            } else {
                $this->response->redirect($this->url->link('news/news', 'token=' . $this->session->data['token'] . $url, TRUE));
            }
        }

        $this->getForm();
    }

    public function edit() {
        $this->load->language('news/news');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('news/news');

        if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_news_news->editNews($this->request->get['news_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if(isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if(isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if(isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if(isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if(isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if(isset($this->request->get['redirect'])) {
                switch ($this->request->get['redirect']) {
                    case "edit":
                        $this->response->redirect($this->url->link('news/news/edit', 'token=' . $this->session->data['token'] . '&news_id=' . $this->request->get['news_id'] . $url, TRUE));
                        break;
                    case "add":
                        $this->response->redirect($this->url->link('news/news/add', 'token=' . $this->session->data['token'] . $url, TRUE));
                        break;
                    case "exit";
                        $this->response->redirect($this->url->link('news/news', 'token=' . $this->session->data['token'] . $url, TRUE));
                        break;
                    default:
                        $this->response->redirect($this->url->link('news/news', 'token=' . $this->session->data['token'] . $url, TRUE));
                }
            } else {
                $this->response->redirect($this->url->link('news/news', 'token=' . $this->session->data['token'] . $url, TRUE));
            }
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('news/news');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('news/news');

        if(isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $news_id) {
                $this->model_news_news->deleteNews($news_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if(isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if(isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if(isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if(isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if(isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('news/news', 'token=' . $this->session->data['token'] . $url, TRUE));
        }

        $this->getList();
    }

    public function copy() {
        $this->load->language('news/news');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('news/news');

        if(isset($this->request->post['selected']) && $this->validateCopy()) {
            foreach ($this->request->post['selected'] as $news_id) {
                $this->model_news_news->copyNews($news_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if(isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if(isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
            }

            if(isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if(isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if(isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('news/news', 'token=' . $this->session->data['token'] . $url, TRUE));
        }

        $this->getList();
    }

    protected function getList() {
        if(isset($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
        } else {
            $filter_name = NULL;
        }

        if(isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = NULL;
        }

        if(isset($this->request->get['filter_category_id'])) {
            $filter_category_id = $this->request->get['filter_category_id'];
        } else {
            $filter_category_id = null;
        }

        if(isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'n.date_added';
        }

        if(isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'DESC';
        }

        if(isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if(isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if(isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }
        if(isset($this->request->get['filter_category_id'])) {
            $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
        }

        if(isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if(isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if(isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], TRUE)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('news/news', 'token=' . $this->session->data['token'] . $url, TRUE)
        );

        $data['add'] = $this->url->link('news/news/add', 'token=' . $this->session->data['token'] . $url, TRUE);
        $data['copy'] = $this->url->link('news/news/copy', 'token=' . $this->session->data['token'] . $url, TRUE);
        $data['delete'] = $this->url->link('news/news/delete', 'token=' . $this->session->data['token'] . $url, TRUE);

        $data['newss'] = array();

        $filter_data = array(
            'filter_name'        => $filter_name,
            'filter_status'      => $filter_status,
            'filter_category_id' => $filter_category_id,
            'sort'               => $sort,
            'order'              => $order,
            'start'              => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'              => $this->config->get('config_limit_admin')
        );

        $this->load->model('tool/image');

        $news_total = $this->model_news_news->getTotalNewss($filter_data);

        $results = $this->model_news_news->getNewss($filter_data);

        foreach ($results as $result) {
            if(is_file(DIR_IMAGE . $result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 40, 40);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 40, 40);
            }


            // Categories
            $this->load->model('news/category');
            $news_categories_data = array();
            $news_categories = $this->model_news_news->getNewsCategories($result['news_id']);

            foreach ($news_categories as $category_id) {
                $news_categories_info = $this->model_news_category->getCategory($category_id);

                if($news_categories_info) {
                    $news_categories_data[] = array(
                        'category_id' => $news_categories_info['category_id'],
                        'name'        => ($news_categories_info['path'] ? $news_categories_info['path'] . ' &gt; ' : '') . $news_categories_info['name']
                    );
                }
            }


            $data['newss'][] = array(
                'news_id' => $result['news_id'],
                'image'   => $image,
                'news_categories' => $news_categories_data,
                'name'    => utf8_substr(strip_tags(html_entity_decode($result['name'],ENT_QUOTES,'UTF-8')),0,50 ),
                'status'  => ($result['status']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
                'edit'    => $this->url->link('news/news/edit', 'token=' . $this->session->data['token'] . '&news_id=' . $result['news_id'] . $url, TRUE)
            );
        }
        $data['categories'] = $categories = $this->model_news_category->getCategories($filter_data);


        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_image'] = $this->language->get('column_image');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_cat_news'] = $this->language->get('column_cat_news');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_price'] = $this->language->get('column_price');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_action'] = $this->language->get('column_action');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_model'] = $this->language->get('entry_model');
        $data['entry_price'] = $this->language->get('entry_price');
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_catgory'] = $this->language->get('entry_catgory');

        $data['button_copy'] = $this->language->get('button_copy');
        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');

        $data['token'] = $this->session->data['token'];

        if(isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if(isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if(isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if(isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if(isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }
        if(isset($this->request->get['filter_category_id'])) {
            $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
        }

        if($order == 'DESC') {
            $url .= '&order=ASC';
        } else {
            $url .= '&order=DESC';
        }

        if(isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('news/news', 'token=' . $this->session->data['token'] . '&sort=nd.name' . $url, TRUE);
        $data['sort_status'] = $this->url->link('news/news', 'token=' . $this->session->data['token'] . '&sort=n.status' . $url, TRUE);
        $data['sort_order'] = $this->url->link('news/news', 'token=' . $this->session->data['token'] . '&sort=n.sort_order' . $url, TRUE);

        $url = '';

        if(isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if(isset($this->request->get['filter_category_id'])) {
            $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
        }

        if(isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if(isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if(isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $news_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('news/news', 'token=' . $this->session->data['token'] . $url . '&page={page}', TRUE);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($news_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($news_total - $this->config->get('config_limit_admin'))) ? $news_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $news_total, ceil($news_total / $this->config->get('config_limit_admin')));

        $data['filter_name'] = $filter_name;
        $data['filter_status'] = $filter_status;
        $data['filter_category_id'] = $filter_category_id;

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('news/news_list', $data));
    }

    protected function getForm() {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['news_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_plus'] = $this->language->get('text_plus');
        $data['text_minus'] = $this->language->get('text_minus');
        $data['text_default'] = $this->language->get('text_default');
        $data['text_option'] = $this->language->get('text_option');
        $data['text_option_value'] = $this->language->get('text_option_value');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_percent'] = $this->language->get('text_percent');
        $data['text_amount'] = $this->language->get('text_amount');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_meta_title'] = $this->language->get('entry_meta_title');
        $data['entry_meta_description'] = $this->language->get('entry_meta_description');
        $data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
        $data['entry_keyword'] = $this->language->get('entry_keyword');
        $data['entry_model'] = $this->language->get('entry_model');
        $data['entry_sku'] = $this->language->get('entry_sku');
        $data['entry_upc'] = $this->language->get('entry_upc');
        $data['entry_ean'] = $this->language->get('entry_ean');
        $data['entry_jan'] = $this->language->get('entry_jan');
        $data['entry_isbn'] = $this->language->get('entry_isbn');
        $data['entry_mpn'] = $this->language->get('entry_mpn');
        $data['entry_location'] = $this->language->get('entry_location');
        $data['entry_minimum'] = $this->language->get('entry_minimum');
        $data['entry_shipping'] = $this->language->get('entry_shipping');
        $data['entry_date_available'] = $this->language->get('entry_date_available');
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['entry_stock_status'] = $this->language->get('entry_stock_status');
        $data['entry_price'] = $this->language->get('entry_price');
        $data['entry_tax_class'] = $this->language->get('entry_tax_class');
        $data['entry_points'] = $this->language->get('entry_points');
        $data['entry_option_points'] = $this->language->get('entry_option_points');
        $data['entry_subtract'] = $this->language->get('entry_subtract');
        $data['entry_weight_class'] = $this->language->get('entry_weight_class');
        $data['entry_weight'] = $this->language->get('entry_weight');
        $data['entry_dimension'] = $this->language->get('entry_dimension');
        $data['entry_length_class'] = $this->language->get('entry_length_class');
        $data['entry_length'] = $this->language->get('entry_length');
        $data['entry_width'] = $this->language->get('entry_width');
        $data['entry_height'] = $this->language->get('entry_height');
        $data['entry_image'] = $this->language->get('entry_image');
        $data['entry_additional_image'] = $this->language->get('entry_additional_image');
        $data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
        $data['entry_download'] = $this->language->get('entry_download');
        $data['entry_category'] = $this->language->get('entry_category');
        $data['entry_filter'] = $this->language->get('entry_filter');
        $data['entry_related'] = $this->language->get('entry_related');
        $data['entry_attribute'] = $this->language->get('entry_attribute');
        $data['entry_text'] = $this->language->get('entry_text');
        $data['entry_option'] = $this->language->get('entry_option');
        $data['entry_option_value'] = $this->language->get('entry_option_value');
        $data['entry_required'] = $this->language->get('entry_required');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_date_start'] = $this->language->get('entry_date_start');
        $data['entry_date_end'] = $this->language->get('entry_date_end');
        $data['entry_priority'] = $this->language->get('entry_priority');
        $data['entry_tag'] = $this->language->get('entry_tag');
        $data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $data['entry_reward'] = $this->language->get('entry_reward');

        $data['entry_recurring'] = $this->language->get('entry_recurring');

        $data['help_keyword'] = $this->language->get('help_keyword');
        $data['help_sku'] = $this->language->get('help_sku');
        $data['help_upc'] = $this->language->get('help_upc');
        $data['help_ean'] = $this->language->get('help_ean');
        $data['help_jan'] = $this->language->get('help_jan');
        $data['help_isbn'] = $this->language->get('help_isbn');
        $data['help_mpn'] = $this->language->get('help_mpn');
        $data['help_minimum'] = $this->language->get('help_minimum');
        $data['help_manufacturer'] = $this->language->get('help_manufacturer');
        $data['help_stock_status'] = $this->language->get('help_stock_status');
        $data['help_points'] = $this->language->get('help_points');
        $data['help_category'] = $this->language->get('help_category');
        $data['help_filter'] = $this->language->get('help_filter');
        $data['help_download'] = $this->language->get('help_download');
        $data['help_related'] = $this->language->get('help_related');
        $data['help_tag'] = $this->language->get('help_tag');
        $data['help_url_seo'] = $this->language->get('help_url_seo');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_attribute_add'] = $this->language->get('button_attribute_add');
        $data['button_option_add'] = $this->language->get('button_option_add');
        $data['button_option_value_add'] = $this->language->get('button_option_value_add');
        $data['button_discount_add'] = $this->language->get('button_discount_add');
        $data['button_special_add'] = $this->language->get('button_special_add');
        $data['button_image_add'] = $this->language->get('button_image_add');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_recurring_add'] = $this->language->get('button_recurring_add');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_save_add'] = $this->language->get('button_save_add');
        $data['button_save_edit'] = $this->language->get('button_save_edit');
        $data['button_save_exit'] = $this->language->get('button_save_exit');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['tab_general'] = $this->language->get('tab_general');
        $data['tab_data'] = $this->language->get('tab_data');
        $data['tab_attribute'] = $this->language->get('tab_attribute');
        $data['tab_option'] = $this->language->get('tab_option');
        $data['tab_recurring'] = $this->language->get('tab_recurring');
        $data['tab_discount'] = $this->language->get('tab_discount');
        $data['tab_special'] = $this->language->get('tab_special');
        $data['tab_image'] = $this->language->get('tab_image');
        $data['tab_links'] = $this->language->get('tab_links');
        $data['tab_reward'] = $this->language->get('tab_reward');
        $data['tab_design'] = $this->language->get('tab_design');
        $data['tab_seo'] = $this->language->get('tab_seo');

        if(isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if(isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if(isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = array();
        }

        if(isset($this->error['keyword'])) {
            $data['error_keyword'] = $this->error['keyword'];
        } else {
            $data['error_keyword'] = '';
        }

        $url = '';

        if(isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if(isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if(isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if(isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if(isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], TRUE)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('news/news', 'token=' . $this->session->data['token'] . $url, TRUE)
        );

        if(!isset($this->request->get['news_id'])) {
            $data['action'] = $this->url->link('news/news/add', 'token=' . $this->session->data['token'] . $url, TRUE);
        } else {
            $data['action'] = $this->url->link('news/news/edit', 'token=' . $this->session->data['token'] . '&news_id=' . $this->request->get['news_id'] . $url, TRUE);
        }

        $data['cancel'] = $this->url->link('news/news', 'token=' . $this->session->data['token'] . $url, TRUE);

        if(isset($this->request->get['news_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $news_info = $this->model_news_news->getNews($this->request->get['news_id']);
        }

        $data['token'] = $this->session->data['token'];

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        if(isset($this->request->post['news_description'])) {
            $data['news_description'] = $this->request->post['news_description'];
        } elseif(isset($this->request->get['news_id'])) {
            $data['news_description'] = $this->model_news_news->getNewsDescriptions($this->request->get['news_id']);
        } else {
            $data['news_description'] = array();
        }

        if(isset($this->request->post['keyword'])) {
            $data['keyword'] = $this->request->post['keyword'];
        } elseif(!empty($news_info)) {
            $data['keyword'] = $news_info['keyword'];
        } else {
            $data['keyword'] = '';
        }

        if(isset($this->error['keyword'])) {
            if(utf8_strlen($this->request->post['keyword']) == 0) {
                $this->load->model('news/url_alias');
                $url_alias_info = $this->model_news_url_alias->getUrlAlias(convert_url($this->request->post['news_description'][$this->config->get('config_language_id')]['name']));
                if($url_alias_info && isset($this->request->get['news_id']) && $url_alias_info['query'] != 'news_id=' . $this->request->get['news_id']) {
                    $data['keyword'] = convert_url($this->request->post['news_description'][$this->config->get('config_language_id')]['name']);
                }

                if(!isset($this->request->get['news_id'])) {
                    $data['keyword'] = convert_url($this->request->post['news_description'][$this->config->get('config_language_id')]['name']);
                }
            }
        }

        if(isset($this->request->post['date_available'])) {
            $data['date_available'] = $this->request->post['date_available'];
        } elseif(!empty($news_info)) {
            $data['date_available'] = ($news_info['date_available'] != '0000-00-00') ? $news_info['date_available'] : '';
        } else {
            $data['date_available'] = date('Y-m-d');
        }

        if(isset($this->request->post['sort_order'])) {
            $data['sort_order'] = $this->request->post['sort_order'];
        } elseif(!empty($news_info)) {
            $data['sort_order'] = $news_info['sort_order'];
        } else {
            $data['sort_order'] = 1;
        }

        if(isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif(!empty($news_info)) {
            $data['status'] = $news_info['status'];
        } else {
            $data['status'] = TRUE;
        }

        // Categories
        $this->load->model('news/category');

        if(isset($this->request->post['news_category'])) {
            $categories = $this->request->post['news_category'];
        } elseif(isset($this->request->get['news_id'])) {
            $categories = $this->model_news_news->getNewsCategories($this->request->get['news_id']);
        } else {
            $categories = array();
        }

        $data['news_categories'] = array();

        foreach ($categories as $category_id) {
            $category_info = $this->model_news_category->getCategory($category_id);

            if($category_info) {
                $data['news_categories'][] = array(
                    'category_id' => $category_info['category_id'],
                    'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
                );
            }
        }

        // Image
        if(isset($this->request->post['image'])) {
            $data['image'] = $this->request->post['image'];
        } elseif(!empty($news_info)) {
            $data['image'] = $news_info['image'];
        } else {
            $data['image'] = '';
        }

        $this->load->model('tool/image');

        if(isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
        } elseif(!empty($news_info) && is_file(DIR_IMAGE . $news_info['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($news_info['image'], 100, 100);
        } else {
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        // Images
        if(isset($this->request->post['news_image'])) {
            $news_images = $this->request->post['news_image'];
        } elseif(isset($this->request->get['news_id'])) {
            $news_images = $this->model_news_news->getNewsImages($this->request->get['news_id']);
        } else {
            $news_images = array();
        }

        $data['news_images'] = array();

        foreach ($news_images as $news_image) {
            if(is_file(DIR_IMAGE . $news_image['image'])) {
                $image = $news_image['image'];
                $thumb = $news_image['image'];
            } else {
                $image = '';
                $thumb = 'no_image.png';
            }

            $data['news_images'][] = array(
                'image'      => $image,
                'thumb'      => $this->model_tool_image->resize($thumb, 100, 100),
                'sort_order' => $news_image['sort_order']
            );
        }

        if(isset($this->request->post['news_related'])) {
            $newss = $this->request->post['news_related'];
        } elseif(isset($this->request->get['news_id'])) {
            $newss = $this->model_news_news->getNewsRelated($this->request->get['news_id']);
        } else {
            $newss = array();
        }

        $data['news_relateds'] = array();

        foreach ($newss as $news_id) {
            $related_info = $this->model_news_news->getNews($news_id);

            if($related_info) {
                $data['news_relateds'][] = array(
                    'news_id' => $related_info['news_id'],
                    'name'    => $related_info['name']
                );
            }
        }

        if(!empty($news_info)) {
            $data['suffix'] = 'n' . ($news_info['news_id'] + $news_info['news_id']);
        } else {
            $max_news_id = $this->model_news_news->getMaxNewss();
            $data['suffix'] = 'n' . (($max_news_id ? ($max_news_id + 1) + ($max_news_id + 1) : '1'));
        }

        $data['config_language_id'] = $this->config->get('config_language_id');

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('news/news_form', $data));
    }

    protected function validateForm() {
        if(!$this->user->hasPermission('modify', 'news/news')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        foreach ($this->request->post['news_description'] as $language_id => $value) {
            if((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 255)) {
                $this->error['name'][$language_id] = $this->language->get('error_name');
            }
        }

        if(utf8_strlen($this->request->post['keyword']) == 0) {
            $this->load->model('news/url_alias');
            $url_alias_info = $this->model_news_url_alias->getUrlAlias(convert_url($this->request->post['news_description'][$this->config->get('config_language_id')]['name']));
            if($url_alias_info && isset($this->request->get['news_id']) && $url_alias_info['query'] != 'news_id=' . $this->request->get['news_id']) {
                $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
            }
            if($url_alias_info && !isset($this->request->get['news_id'])) {
                $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
            }
        }

        if(utf8_strlen($this->request->post['keyword']) > 0) {
            $this->load->model('news/url_alias');

            $url_alias_info = $this->model_news_url_alias->getUrlAlias($this->request->post['keyword']);

            if($url_alias_info && isset($this->request->get['news_id']) && $url_alias_info['query'] != 'news_id=' . $this->request->get['news_id']) {
                $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
            }

            if($url_alias_info && !isset($this->request->get['news_id'])) {
                $this->error['keyword'] = sprintf($this->language->get('error_keyword'));
            }
        }

        if($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }

    protected function validateDelete() {
        if(!$this->user->hasPermission('modify', 'news/news')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        
        if(!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    protected function validateCopy() {
        if(!$this->user->hasPermission('modify', 'news/news')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    public function autocomplete() {
        $json = array();

        if(isset($this->request->get['filter_name'])) {
            $this->load->model('news/news');

            if(isset($this->request->get['filter_name'])) {
                $filter_name = $this->request->get['filter_name'];
            } else {
                $filter_name = '';
            }

            if(isset($this->request->get['limit'])) {
                $limit = $this->request->get['limit'];
            } else {
                $limit = 5;
            }

            $filter_data = array(
                'filter_name' => $filter_name,
                'start'       => 0,
                'limit'       => $limit
            );

            $results = $this->model_news_news->getNewss($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'news_id' => $result['news_id'],
                    'name'    => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
                );
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
