<?php

class ControllerExtensionModuleChangeColor extends Controller
{
    private $error = array();

    public function index() {

        $this->load->language('extension/module/change_color');

        $this->document->addStyle('view/javascript/colorpicker/jquery.colorpicker.css');
        $this->document->addStyle('http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css');

        $this->document->addScript('https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js');
        $this->document->addScript('view/javascript/colorpicker/jquery.colorpicker.js');
        $this->document->addScript('view/javascript/colorpicker/i18n/jquery.ui.colorpicker-nl.js');
        $this->document->addScript('view/javascript/colorpicker/swatches/jquery.ui.colorpicker-pantone.js');
        $this->document->addScript('view/javascript/colorpicker/swatches/jquery.ui.colorpicker-crayola.js');
        $this->document->addScript('view/javascript/colorpicker/swatches/jquery.ui.colorpicker-ral-classic.js');
        $this->document->addScript('view/javascript/colorpicker/swatches/jquery.ui.colorpicker-x11.js');
        $this->document->addScript('view/javascript/colorpicker/parts/jquery.ui.colorpicker-rgbslider.js');
        $this->document->addScript('view/javascript/colorpicker/parts/jquery.ui.colorpicker-memory.js');
        $this->document->addScript('view/javascript/colorpicker/parts/jquery.ui.colorpicker-swatchesswitcher.js');
        $this->document->addScript('view/javascript/colorpicker/parsers/jquery.ui.colorpicker-cmyk-parser.js');
        $this->document->addScript('view/javascript/colorpicker/parsers/jquery.ui.colorpicker-cmyk-percentage-parser.js');


        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('change_color', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
        }


        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_item'] = $this->language->get('text_item');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_title'] = $this->language->get('entry_title');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_icon'] = $this->language->get('entry_icon');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_image'] = $this->language->get('entry_image');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_add'] = $this->language->get('button_add');
        $data['button_cancel'] = $this->language->get('button_cancel');

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
            $data['error_name'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
        );


        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/change_color', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('extension/module/change_color', 'token=' . $this->session->data['token'], true);
        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

        if(isset($this->request->post['change_color_name'])) {
            $data['name'] = $this->request->post['change_color_name'];
        } else {
            $data['name'] = $this->config->get('change_color_name') ? $this->config->get('change_color_name') : '' ;
        }


        if(isset($this->request->post['change_color_bg_menu'])) {
            $data['change_color_bg_menu'] = $this->request->post['change_color_bg_menu'];
        } else {
            $data['change_color_bg_menu'] = $this->config->get('change_color_bg_menu') ;
        }
        if(isset($this->request->post['change_color_bg_copyright'])) {
            $data['change_color_bg_copyright'] = $this->request->post['change_color_bg_copyright'];
        } else {
            $data['change_color_bg_copyright'] = $this->config->get('change_color_bg_copyright') ;
        }
        if(isset($this->request->post['change_color_bg_body'])) {
            $data['change_color_bg_body'] = $this->request->post['change_color_bg_body'];
        } else {
            $data['change_color_bg_body'] = $this->config->get('change_color_bg_body') ;
        }
        if(isset($this->request->post['change_color_link_hover'])) {
            $data['change_color_link_hover'] = $this->request->post['change_color_link_hover'];
        } else {
            $data['change_color_link_hover'] = $this->config->get('change_color_link_hover') ;
        }

        if (isset($this->request->post['change_color_bg_body_background_image'])) {
            $data['change_color_bg_body_background_image'] = $this->request->post['change_color_bg_body_background_image'];
        } else {
            $data['change_color_bg_body_background_image'] = $this->config->get('change_color_bg_body_background_image') ;
        }

        if (isset($this->request->post['change_color_bg_body_image_background_repeat'])) {
            $data['change_color_bg_body_image_background_repeat'] = $this->request->post['change_color_bg_body_image_background_repeat'];
        } else {
            $data['change_color_bg_body_image_background_repeat'] = $this->config->get('change_color_bg_body_image_background_repeat') ;
        }
        if (isset($this->request->post['change_color_bg_body_image_background_size'])) {
            $data['change_color_bg_body_image_background_size'] = $this->request->post['change_color_bg_body_image_background_size'];
        } else {
            $data['change_color_bg_body_image_background_size'] = $this->config->get('change_color_bg_body_image_background_size') ;
        }
        if (isset($this->request->post['change_color_bg_body_image_background_attachment'])) {
            $data['change_color_bg_body_image_background_attachment'] = $this->request->post['change_color_bg_body_image_background_attachment'];
        } else {
            $data['change_color_bg_body_image_background_attachment'] = $this->config->get('change_color_bg_body_image_background_attachment') ;
        }
        if (isset($this->request->post['change_color_bg_body_image_background_position'])) {
            $data['change_color_bg_body_image_background_position'] = $this->request->post['change_color_bg_body_image_background_position'];
        } else {
            $data['change_color_bg_body_image_background_position'] = $this->config->get('change_color_bg_body_image_background_position') ;
        }

        $this->load->model('tool/image');

        if (isset($this->request->post['change_color_bg_body_background_image']) && is_file(DIR_IMAGE . $this->request->post['change_color_bg_body_background_image'])) {
            $data['thumb'] = $this->model_tool_image->resize($this->request->post['change_color_bg_body_background_image'], 100, 100);
        } elseif (($this->config->get('change_color_bg_body_background_image')) && is_file(DIR_IMAGE . $this->config->get('change_color_bg_body_background_image'))) {
            $data['thumb'] = $this->model_tool_image->resize($this->config->get('change_color_bg_body_background_image'), 100, 100);
        } else {
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/change_color', $data));
    }

    protected function validate() {
        if(!$this->user->hasPermission('modify', 'extension/module/change_color')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if((utf8_strlen($this->request->post['change_color_name']) < 3) || (utf8_strlen($this->request->post['change_color_name']) > 64)) {
            $this->error['name'] = $this->language->get('error_name');
        }

        return !$this->error;
    }
}