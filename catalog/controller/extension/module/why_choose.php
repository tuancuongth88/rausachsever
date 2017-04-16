<?php

class ControllerExtensionModuleWhyChoose extends Controller
{
    public function index($setting) {
        $data['banners'] = array();
        $this->load->model('design/banner');
        $this->load->model('tool/image');

        $results = $this->model_design_banner->getBanner($setting['banner_id']);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE . $result['image'])) {
                $data['banners'][] = array(
                    'title' => $result['title'],
                    'link'  => $result['link'],
                    'image' => $this->model_tool_image->resize($result['image'], $setting['banner_width'], $setting['banner_height'])
                );
            }
        }

        if(isset($setting['module_description'])) {
            $data['descriptions'] = array();
            $module_description = $setting['module_description'];

            foreach ($module_description as $item) {
                if($item['status']){
                    $data['descriptions'][] = array(
                        'icon' => $item['icon'],
                        'sort_order' => $item['sort_order'],
                        'title' => $item[$this->config->get('config_language_id')]['title'],
                    );
                }
            }
            $sort_order = array();
            foreach ($data['descriptions'] as $key => $item) {
                $sort_order[$key] = $item['sort_order'];
            }
            array_multisort($sort_order , SORT_ASC, $data['descriptions']);

        }

        return $this->load->view('extension/module/why_choose', $data);
    }
}