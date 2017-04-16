<?php

class ControllerNewsNews extends Controller
{
    private $error = array();

    public function index() {
        $this->load->language('news/news');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $this->load->model('news/category');
        
        if(isset($this->request->get['cat_news'])) {
            $cat_news = '';

            $parts = explode('_', (string)$this->request->get['cat_news']);

            $category_id = (int)array_pop($parts);

            foreach ($parts as $cat_news_id) {
                if(!$cat_news) {
                    $cat_news = $cat_news_id;
                } else {
                    $cat_news .= '_' . $cat_news_id;
                }

                $category_info = $this->model_news_category->getCategory($cat_news_id);

                if($category_info) {
                    $data['breadcrumbs'][] = array(
                        'text' => $category_info['name'],
                        'href' => $this->url->link('news/category', 'cat_news=' . $cat_news)
                    );
                }
            }

            // Set the last category breadcrumb
            $category_info = $this->model_news_category->getCategory($category_id);

            if($category_info) {
                $url = '';

                if(isset($this->request->get['sort'])) {
                    $url .= '&sort=' . $this->request->get['sort'];
                }

                if(isset($this->request->get['order'])) {
                    $url .= '&order=' . $this->request->get['order'];
                }

                if(isset($this->request->get['page'])) {
                    $url .= '&page=' . $this->request->get['page'];
                }

                if(isset($this->request->get['limit'])) {
                    $url .= '&limit=' . $this->request->get['limit'];
                }

                $data['breadcrumbs'][] = array(
                    'text' => $category_info['name'],
                    'href' => $this->url->link('news/category', 'cat_news=' . $this->request->get['cat_news'] . $url)
                );
            }
        }

        if(isset($this->request->get['search']) || isset($this->request->get['tag'])) {
            $url = '';

            if(isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if(isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if(isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if(isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if(isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
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

            if(isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_search'),
                'href' => $this->url->link('news/search', $url)
            );
        }

        if(isset($this->request->get['news_id'])) {
            $news_id = (int)$this->request->get['news_id'];
        } else {
            $news_id = 0;
        }

        $this->load->model('news/news');

        $news_info = $this->model_news_news->getNews($news_id);

        if($news_info) {
            $url = '';

            if(isset($this->request->get['cat_news'])) {
                $url .= '&cat_news=' . $this->request->get['cat_news'];
            }

            if(isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if(isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if(isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if(isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if(isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if(isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
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

            if(isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $news_info['name'],
                'href' => $this->url->link('news/news', $url . '&news_id=' . $this->request->get['news_id'])
            );

			$this->load->model('tool/image');
			
            $this->document->setTitle($news_info['meta_title']?$news_info['meta_title']:$news_info['name']);
            $this->document->setDescription($news_info['meta_description']);
            $this->document->setKeywords($news_info['meta_keyword']);
            $this->document->addLink($this->url->link('news/news', 'news_id=' . $this->request->get['news_id']), 'canonical');

            $data['heading_title'] = $news_info['name'];

            $data['text_select'] = $this->language->get('text_select');
            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', TRUE), $this->url->link('account/register', '', TRUE));
            $data['text_note'] = $this->language->get('text_note');
            $data['text_tags'] = $this->language->get('text_tags');
            $data['text_loading'] = $this->language->get('text_loading');
            $data['text_related'] = $this->language->get('text_related');
            $data['text_related'] = $this->language->get('text_related');
            $data['text_comment'] = $this->language->get('text_comment');
            $data['text_viewed'] = $this->language->get('text_viewed');

            $data['entry_name'] = $this->language->get('entry_name');
            $data['entry_content'] = $this->language->get('entry_content');
            $data['entry_email'] = $this->language->get('entry_email');
            $data['entry_captcha'] = $this->language->get('entry_captcha');

            $data['button_send'] = $this->language->get('button_send');
            $data['button_continue'] = $this->language->get('button_continue');

            $this->load->model('news/comment');

            $data['tab_description'] = $this->language->get('tab_description');
            $data['tab_attribute'] = $this->language->get('tab_attribute');
            $data['tab_comment'] = sprintf($this->language->get('tab_comment'), $news_info['comments']);

            $data['news_id'] = (int)$this->request->get['news_id'];
            $data['description'] = html_entity_decode($news_info['description'], ENT_QUOTES, 'UTF-8');
            $data['date_added'] = date($this->language->get('date_format_short'), strtotime($news_info['date_added']));
            $data['date_available'] = date($this->language->get('date_format_short'), strtotime($news_info['date_available']));
            $data['viewed'] = $news_info['viewed'];

            if($news_info['image'] && file_exists(DIR_IMAGE.$news_info['image'])) {
                $data['popup'] = $this->model_tool_image->resize($news_info['image'], 500, 300);
            } else {
                $data['popup'] = '';
            }

            if($news_info['image'] && file_exists(DIR_IMAGE.$news_info['image'])) {
                $data['thumb'] = $this->model_tool_image->resize($news_info['image'], 300, 500);
            } else {
                $data['thumb'] ='';
            }

            $data['images'] = array();

            $results = $this->model_news_news->getNewsImages($this->request->get['news_id']);

            foreach ($results as $result) {
                $data['images'][] = array(
                    'popup' => $this->model_tool_image->resize($result['image'], 500, 300),
                    'thumb' => $this->model_tool_image->resize($result['image'], 500, 300)
                );
            }

            $data['comment_status'] = $this->config->get('config_comment_status');

            if($this->config->get('config_comment_guest') || $this->customer->isLogged()) {
                $data['comment_guest'] = TRUE;
            } else {
                $data['comment_guest'] = FALSE;
            }

            if($this->customer->isLogged()) {
                $data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
            } else {
                $data['customer_name'] = '';
            }

            $data['comments'] = sprintf($this->language->get('text_comments'), (int)$news_info['comments']);
            $data['rating'] = (int)$news_info['rating'];

            // Captcha
            if($this->config->get($this->config->get('config_captcha') . '_status') && in_array('comment', (array)$this->config->get('config_captcha_page'))) {
                $data['captcha'] = $this->load->controller('captcha/' . $this->config->get('config_captcha'));
            } else {
                $data['captcha'] = '';
            }

            $data['share'] = $this->url->link('news/news', 'news_id=' . (int)$this->request->get['news_id']);

            // news view latest by month
            $data['newss'] = array();

            $results = $this->model_news_news->getNewsRelated($this->request->get['news_id']);
            $nr = 0;
            foreach ($results as $result) {
                if($result['image'] && file_exists(DIR_IMAGE.$result['image'])) {
                    $image = $this->model_tool_image->resize($result['image'], 500, 300);
                } else {
                    $image = $this->model_tool_image->resize('no_image.png',500,300);
                }

                if($this->config->get('config_comment_status')) {
                    $rating = (int)$result['rating'];
                } else {
                    $rating = FALSE;
                }

                $data['newss'][] = array(
                    'news_id'     => $result['news_id'],
                    'viewed'     => $result['viewed'],
                    'thumb'       => $image,
                    'name'        => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '...',
                    'rating'      => $rating,
                    'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'date_available'  => date($this->language->get('date_format_short'), strtotime($result['date_available'])),
                    'href'        => $this->url->link('news/news', 'news_id=' . $result['news_id'])
                );
                if($nr == $this->config->get('theme_setting_news_limit_related')){
                    break;
                }
                $nr++;
            }

            // tags
            $data['tags'] = array();

            if($news_info['tag']) {
                $tags = explode(',', $news_info['tag']);

                foreach ($tags as $tag) {
                    $data['tags'][] = array(
                        'tag'  => trim($tag),
                        'href' => $this->url->link('news/search', 'tag=' . trim($tag))
                    );
                }
            }


            $this->model_news_news->updateViewed($this->request->get['news_id']);

            $data['content_maintop'] = $this->load->controller('common/content_maintop');
            $data['content_mainbottom'] = $this->load->controller('common/content_mainbottom');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('news/news', $data));
        } else {
            $url = '';

            if(isset($this->request->get['cat_news'])) {
                $url .= '&cat_news=' . $this->request->get['cat_news'];
            }

            if(isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if(isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if(isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if(isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if(isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if(isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
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

            if(isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('news/news', $url . '&news_id=' . $news_id)
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_error');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

            $data['content_maintop'] = $this->load->controller('common/content_maintop');
            $data['content_mainbottom'] = $this->load->controller('common/content_mainbottom');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }
    }

    public function comment() {
        $this->load->language('news/news');

        $this->load->model('news/comment');

        $data['text_no_comments'] = $this->language->get('text_no_comments');

        if(isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['comments'] = array();

        $comment_total = $this->model_news_comment->getTotalCommentsByNewsId($this->request->get['news_id']);

        $results = $this->model_news_comment->getCommentsByNewsId($this->request->get['news_id'], ($page - 1) * 5, 5);

        foreach ($results as $result) {
            $data['comments'][] = array(
                'author'     => $result['author'],
                'content'       => nl2br($result['content']),
                'email'     => (int)$result['email'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }

        $pagination = new Pagination();
        $pagination->total = $comment_total;
        $pagination->page = $page;
        $pagination->limit = 5;
        $pagination->url = $this->url->link('news/news/comment', 'news_id=' . $this->request->get['news_id'] . '&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($comment_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($comment_total - 5)) ? $comment_total : ((($page - 1) * 5) + 5), $comment_total, ceil($comment_total / 5));

        $this->response->setOutput($this->load->view('news/comment', $data));
    }

    public function write() {
        $this->load->language('news/news');

        $json = array();

        if($this->request->server['REQUEST_METHOD'] == 'POST') {

            // Captcha
            if($this->config->get($this->config->get('config_captcha') . '_status') && in_array('comment', (array)$this->config->get('config_captcha_page'))) {
                $captcha = $this->load->controller('captcha/' . $this->config->get('config_captcha') . '/validate');

                if($captcha) {
                    $json['error'] = $captcha;
                }
            }

            if((utf8_strlen($this->request->post['content']) < 10) || (utf8_strlen($this->request->post['content']) > 1000)) {
                $json['error'] = $this->language->get('error_content');
            }

            if(empty($this->request->post['email']) || utf8_strlen($this->request->post['email']) < 0 || utf8_strlen($this->request->post['email']) > 90) {
                $json['error'] = $this->language->get('error_email');
            }else{
                if (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
                    $json['error'] = $this->language->get('error_email');
                }
            }
            if((utf8_strlen($this->request->post['author']) < 3) || (utf8_strlen($this->request->post['author']) > 35)) {
                $json['error'] = $this->language->get('error_author');
            }


            if(!isset($json['error'])) {
                $this->load->model('news/comment');

                $this->model_news_comment->addComment($this->request->get['news_id'], $this->request->post);

                $json['success'] = $this->language->get('text_success');
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
