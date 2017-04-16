<?php

class ModelNewsComment extends Model
{
    public function addComment($news_id, $data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "comment SET author = '" . $this->db->escape($data['author']) . "',email = '" . $this->db->escape($data['email']) . "', customer_id = '" . (int)$this->customer->getId() . "', news_id = '" . (int)$news_id . "', content = '" . $this->db->escape($data['content']) . "',  date_added = NOW()");

        $comment_id = $this->db->getLastId();

        if($this->config->get('config_comment_mail')) {
            $this->load->language('mail/comment');
            $this->load->model('news/news');

            $news_info = $this->model_news_news->getNews($news_id);

            $subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

            $message = $this->language->get('text_waiting') . "\n";
            $message .= sprintf($this->language->get('text_news'), html_entity_decode($news_info['name'], ENT_QUOTES, 'UTF-8')) . "\n";
            $message .= sprintf($this->language->get('text_commenter'), html_entity_decode($data['name'], ENT_QUOTES, 'UTF-8')) . "\n";
            $message .= $this->language->get('text_comment') . "\n";
            $message .= html_entity_decode($data['text'], ENT_QUOTES, 'UTF-8') . "\n\n";

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
            $mail->setSubject($subject);
            $mail->setText($message);
            $mail->send();

            // Send to additional alert emails
            $emails = explode(',', $this->config->get('config_mail_alert'));

            foreach ($emails as $email) {
                if($email && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $mail->setTo($email);
                    $mail->send();
                }
            }
        }
    }

    public function getCommentsByNewsId($news_id, $start = 0, $limit = 30) {
        if($start < 0) {
            $start = 0;
        }

        if($limit < 1) {
            $limit = 30;
        }

        $query = $this->db->query("SELECT r.comment_id, r.author, r.email, r.content, n.news_id, nd.name,  n.image, r.date_added FROM " . DB_PREFIX . "comment r LEFT JOIN " . DB_PREFIX . "news n ON (r.news_id = n.news_id) LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) WHERE n.news_id = '" . (int)$news_id . "' AND n.date_available <= NOW() AND n.status = '1' AND r.status = '1' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

        return $query->rows;
    }

    public function getTotalCommentsByNewsId($news_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment r LEFT JOIN " . DB_PREFIX . "news n ON (r.news_id = n.news_id) LEFT JOIN " . DB_PREFIX . "news_description nd ON (n.news_id = nd.news_id) WHERE n.news_id = '" . (int)$news_id . "' AND n.date_available <= NOW() AND n.status = '1' AND r.status = '1' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        return $query->row['total'];
    }
}