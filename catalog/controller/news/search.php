<?php

class ControllerNewsSearch extends Controller
{
    public function index() {
        $this->load->language('news/search');

        $this->load->model('news/category');
        $this->load->model('news/news');
        $this->load->model('tool/image');

        if(isset($this->request->get['search'])) {
            $search = $this->request->get['search'];
        } else {
            $search = '';
        }

        if(isset($this->request->get['tag'])) {
            $tag = $this->request->get['tag'];
        } elseif(isset($this->request->get['search'])) {
            $tag = $this->request->get['search'];
        } else {
            $tag = '';
        }

        if(isset($this->request->get['description'])) {
            $description = $this->request->get['description'];
        } else {
            $description = '';
        }

        if(isset($this->request->get['category_id'])) {
            $category_id = $this->request->get['category_id'];
        } else {
            $category_id = 0;
        }

        if(isset($this->request->get['sub_category'])) {
            $sub_category = $this->request->get['sub_category'];
        } else {
            $sub_category = '';
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

        if(isset($this->request->get['limit'])) {
            $limit = (int)$this->request->get['limit'];
        } else {
            $limit =20;
        }

        if(isset($this->request->get['search'])) {
            $this->document->setTitle($this->language->get('heading_title') . ' - ' . $this->request->get['search']);
        } elseif(isset($this->request->get['tag'])) {
            $this->document->setTitle($this->language->get('heading_title') . ' - ' . $this->language->get('heading_tag') . $this->request->get['tag']);
        } else {
            $this->document->setTitle($this->language->get('heading_title'));
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $url = '';

        if(isset($this->request->get['search'])) {
            $url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
        }

        if(isset($this->request->get['tag'])) {
            $url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
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
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('news/search', $url)
        );

        if(isset($this->request->get['search'])) {
            $data['heading_title'] = $this->language->get('heading_title') . ' - ' . $this->request->get['search'];
        } else {
            $data['heading_title'] = $this->language->get('heading_title');
        }

        $data['text_empty'] = $this->language->get('text_empty');
        $data['text_search'] = $this->language->get('text_search');
        $data['text_keyword'] = $this->language->get('text_keyword');
        $data['text_category'] = $this->language->get('text_category');
        $data['text_sub_category'] = $this->language->get('text_sub_category');
        $data['text_sort'] = $this->language->get('text_sort');
        $data['text_limit'] = $this->language->get('text_limit');
        $data['text_viewed'] = $this->language->get('text_viewed');

        $data['entry_search'] = $this->language->get('entry_search');
        $data['entry_description'] = $this->language->get('entry_description');

        $data['button_search'] = $this->language->get('button_search');
        $data['button_list'] = $this->language->get('button_list');
        $data['button_detail'] = $this->language->get('button_detail');
        $data['button_continue'] = $this->language->get('button_continue');
        $data['url_news_search'] = $this->url->link('news/search');

        $this->load->model('news/category');

        // 3 Level Category Search
        $data['categories'] = array();

        $categories_1 = $this->model_news_category->getCategories(0);

        foreach ($categories_1 as $category_1) {
            $level_2_data = array();

            $categories_2 = $this->model_news_category->getCategories($category_1['category_id']);

            foreach ($categories_2 as $category_2) {
                $level_3_data = array();

                $categories_3 = $this->model_news_category->getCategories($category_2['category_id']);

                foreach ($categories_3 as $category_3) {
                    $level_3_data[] = array(
                        'category_id' => $category_3['category_id'],
                        'name'        => $category_3['name'],
                    );
                }

                $level_2_data[] = array(
                    'category_id' => $category_2['category_id'],
                    'name'        => $category_2['name'],
                    'children'    => $level_3_data
                );
            }

            $data['categories'][] = array(
                'category_id' => $category_1['category_id'],
                'name'        => $category_1['name'],
                'children'    => $level_2_data
            );
        }

        $data['newss'] = array();

        if(isset($this->request->get['search']) || isset($this->request->get['tag'])) {
            $filter_data = array(
                'filter_name'         => $search,
                'filter_tag'          => $tag,
                'filter_description'  => $description,
                'filter_category_id'  => $category_id,
                'filter_sub_category' => $sub_category,
                'sort'                => $sort,
                'order'               => $order,
                'start'               => ($page - 1) * $limit,
                'limit'               => $limit
            );

            $news_total = $this->model_news_news->getTotalNewss($filter_data);

            $results = $this->model_news_news->getNewss($filter_data);

            foreach ($results as $result) {
                if($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], 400, 250);
                } else {
                    $image = $this->model_tool_image->resize('no_image.png',400, 250);
                }


                $data['newss'][] = array(
                    'news_id'     => $result['news_id'],
                    'thumb'       => $image,
                    'name'        => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 200) . '...',
                    'viewed'     => $result['viewed'],
                    'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'date_available'  => date($this->language->get('date_format_short'), strtotime($result['date_available'])),
                    'href'        => $this->url->link('news/news', 'news_id=' . $result['news_id'] . $url)
                );
            }

            $url = '';

            if(isset($this->request->get['search'])) {
                $url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
            }

            if(isset($this->request->get['tag'])) {
                $url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
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

            if(isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['sorts'] = array();

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_default'),
                'value' => 'n.sort_order-ASC',
                'href'  => $this->url->link('news/search', 'sort=n.sort_order&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_name_asc'),
                'value' => 'nd.name-ASC',
                'href'  => $this->url->link('news/search', 'sort=nd.name&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_name_desc'),
                'value' => 'nd.name-DESC',
                'href'  => $this->url->link('news/search', 'sort=nd.name&order=DESC' . $url)
            );

            $url = '';

            if(isset($this->request->get['search'])) {
                $url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
            }

            if(isset($this->request->get['tag'])) {
                $url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
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

            $data['limits'] = array();

            $limits = array_unique(array(
                20,
                25,
                50,
                75,
                100
            ));

            sort($limits);

            foreach ($limits as $value) {
                $data['limits'][] = array(
                    'text'  => $value,
                    'value' => $value,
                    'href'  => $this->url->link('news/search', $url . '&limit=' . $value)
                );
            }

            $url = '';

            if(isset($this->request->get['search'])) {
                $url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
            }

            if(isset($this->request->get['tag'])) {
                $url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
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

            if(isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $pagination = new Pagination();
            $pagination->total = $news_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('news/search', $url . '&page={page}');

            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'), ($news_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($news_total - $limit)) ? $news_total : ((($page - 1) * $limit) + $limit), $news_total, ceil($news_total / $limit));

            if($page == 1) {
                $this->document->addLink($this->url->link('news/search', '', TRUE), 'canonical');
            } elseif($page == 2) {
                $this->document->addLink($this->url->link('news/search', '', TRUE), 'prev');
            } else {
                $this->document->addLink($this->url->link('news/search', $url . '&page=' . ($page - 1), TRUE), 'prev');
            }

            if($limit && ceil($news_total / $limit) > $page) {
                $this->document->addLink($this->url->link('news/search', $url . '&page=' . ($page + 1), TRUE), 'next');
            }
        }

        $data['search'] = $search;
        $data['description'] = $description;
        $data['category_id'] = $category_id;
        $data['sub_category'] = $sub_category;

        $data['sort'] = $sort;
        $data['order'] = $order;
        $data['limit'] = $limit;

        $data['content_maintop'] = $this->load->controller('common/content_maintop');
        $data['content_mainbottom'] = $this->load->controller('common/content_mainbottom');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('news/search', $data));
    }
}
