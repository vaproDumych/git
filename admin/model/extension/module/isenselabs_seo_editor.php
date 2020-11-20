<?php
class ModelExtensionModuleiSenseLabsSeoEditor extends Model {  
        
    public function getProducts($page = 1, $data = array()) {
        $query = "SELECT p.*, pd.*, sua.keyword as `seo_keyword`, spd.h1, spd.h2 FROM `" . DB_PREFIX . "product` p ";
        
        if (empty($data['language_id'])) {
            $data['language_id'] = $this->config->get('config_lanugage_id');
        }
        
        $query .= " LEFT JOIN `" . DB_PREFIX . "product_description` pd ON (p.product_id = pd.product_id AND pd.language_id = '" . $data['language_id'] . "')";
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_url_alias` sua ON (CONCAT('product_id=',p.product_id) = sua.query AND sua.language_id = '" . $data['language_id'] . "')";
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_product_description` spd ON (p.product_id = spd.product_id AND spd.language_id = '" . $data['language_id'] . "')";
        
        $query .= " WHERE 1=1 ";
        
        if (!empty($data['filter_name'])) {
            $query .= " AND pd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }
        
        if (!empty($data['filter_meta_title'])) {
            $query .= " AND pd.meta_title LIKE '%" . $this->db->escape($data['filter_meta_title']) . "%'";
        }
        
        if (!empty($data['filter_meta_description'])) {
            $query .= " AND pd.meta_description LIKE '%" . $this->db->escape($data['filter_meta_description']) . "%'";
        }
        
        if (!empty($data['filter_meta_keywords'])) {
            $query .= " AND pd.meta_keyword LIKE '%" . $this->db->escape($data['filter_meta_keywords']) . "%'";
        }
        
        if (!empty($data['filter_keyword'])) {
            $query .= " AND sua.keyword LIKE '%" . $this->db->escape($data['filter_keyword']) . "%'";
        }
        
        if (!empty($data['filter_h1'])) {
            $query .= " AND spd.h1 LIKE '%" . $this->db->escape($data['filter_h1']) . "%'";
        }
        
        if (!empty($data['filter_h2'])) {
            $query .= " AND spd.h2 LIKE '%" . $this->db->escape($data['filter_h2']) . "%'";
        }
        
        if ($page) {
			$start = ($page - 1) * $data['filter_limit'];
		}
        
        $query .= " ORDER BY `p`.`status` DESC, `pd`.`name` ASC LIMIT ".$start.", ".$data['filter_limit'];
        
        $query = $this->db->query($query);

        return $query->rows;
    }
    
    public function getTotalProducts($data = array()) {
		$query = "SELECT COUNT(*) as `count`  FROM `" . DB_PREFIX . "product` p ";
        
        if (empty($data['language_id'])) {
            $data['language_id'] = $this->config->get('config_lanugage_id');
        }
        
        $query .= "JOIN `" . DB_PREFIX . "product_description` pd ON (p.product_id = pd.product_id AND pd.language_id = '" . $data['language_id'] . "')";
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_url_alias` sua ON (CONCAT('product_id=',p.product_id) = sua.query AND sua.language_id = '" . $data['language_id'] . "')";
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_product_description` spd ON (p.product_id = spd.product_id AND spd.language_id = '" . $data['language_id'] . "')";

        $query .= " WHERE 1=1 ";
        
        if (!empty($data['filter_name'])) {
            $query .= " AND pd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }
        
        if (!empty($data['filter_meta_title'])) {
            $query .= " AND pd.meta_title LIKE '%" . $this->db->escape($data['filter_meta_title']) . "%'";
        }
        
        if (!empty($data['filter_meta_description'])) {
            $query .= " AND pd.meta_description LIKE '%" . $this->db->escape($data['filter_meta_description']) . "%'";
        }
        
        if (!empty($data['filter_meta_keywords'])) {
            $query .= " AND pd.meta_keyword LIKE '%" . $this->db->escape($data['filter_meta_keywords']) . "%'";
        }
        
        if (!empty($data['filter_keyword'])) {
            $query .= " AND sua.keyword LIKE '%" . $this->db->escape($data['filter_keyword']) . "%'";
        }
        
        if (!empty($data['filter_h1'])) {
            $query .= " AND spd.h1 LIKE '%" . $this->db->escape($data['filter_h1']) . "%'";
        }
        
        if (!empty($data['filter_h2'])) {
            $query .= " AND spd.h2 LIKE '%" . $this->db->escape($data['filter_h2']) . "%'";
        }
		
		$query = $this->db->query($query);
        
		return $query->row['count']; 
	}
    
    public function getCategories($page = 1, $data = array()) {
        $query = "SELECT c.*, cd.*, sua.keyword as `seo_keyword` FROM `" . DB_PREFIX . "category` c ";
        
        if (empty($data['language_id'])) {
            $data['language_id'] = $this->config->get('config_lanugage_id');
        }
        
        $query .= " LEFT JOIN `" . DB_PREFIX . "category_description` cd ON (c.category_id = cd.category_id AND cd.language_id = '" . $data['language_id'] . "')";
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_url_alias` sua ON (CONCAT('category_id=',c.category_id) = sua.query AND sua.language_id = '" . $data['language_id'] . "')";
        
        $query .= " WHERE 1=1 ";
        
        if (!empty($data['filter_name'])) {
            $query .= " AND cd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }
        
        if (!empty($data['filter_meta_title'])) {
            $query .= " AND cd.meta_title LIKE '%" . $this->db->escape($data['filter_meta_title']) . "%'";
        }
        
        if (!empty($data['filter_meta_description'])) {
            $query .= " AND cd.meta_description LIKE '%" . $this->db->escape($data['filter_meta_description']) . "%'";
        }
        
        if (!empty($data['filter_meta_keywords'])) {
            $query .= " AND cd.meta_keyword LIKE '%" . $this->db->escape($data['filter_meta_keywords']) . "%'";
        }
        
        if (!empty($data['filter_keyword'])) {
            $query .= " AND sua.keyword LIKE '%" . $this->db->escape($data['filter_keyword']) . "%'";
        }
        
        if ($page) {
			$start = ($page - 1) * $data['filter_limit'];
		}
        
        $query .= " ORDER BY `c`.`status` DESC, `cd`.`name` ASC LIMIT ".$start.", ".$data['filter_limit'];
        
        $query = $this->db->query($query);

        return $query->rows;
    }
    
    public function getTotalCategories($data = array()) {
		$query = "SELECT COUNT(*) as `count`  FROM `" . DB_PREFIX . "category` c ";
        
        if (empty($data['language_id'])) {
            $data['language_id'] = $this->config->get('config_lanugage_id');
        }
        
        $query .= "JOIN `" . DB_PREFIX . "category_description` cd ON (c.category_id = cd.category_id AND cd.language_id = '" . $data['language_id'] . "')";
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_url_alias` sua ON (CONCAT('category_id=',c.category_id) = sua.query AND sua.language_id = '" . $data['language_id'] . "')";
        
        $query .= " WHERE 1=1 ";
        
        if (!empty($data['filter_name'])) {
            $query .= " AND cd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }
        
        if (!empty($data['filter_meta_title'])) {
            $query .= " AND cd.meta_title LIKE '%" . $this->db->escape($data['filter_meta_title']) . "%'";
        }
        
        if (!empty($data['filter_meta_description'])) {
            $query .= " AND cd.meta_description LIKE '%" . $this->db->escape($data['filter_meta_description']) . "%'";
        }
        
        if (!empty($data['filter_meta_keywords'])) {
            $query .= " AND cd.meta_keyword LIKE '%" . $this->db->escape($data['filter_meta_keywords']) . "%'";
        }
        
        if (!empty($data['filter_keyword'])) {
            $query .= " AND sua.keyword LIKE '%" . $this->db->escape($data['filter_keyword']) . "%'";
        }
		
		$query = $this->db->query($query);
        
		return $query->row['count']; 
	}
    
    public function getInformations($page = 1, $data = array()) {
        $query = "SELECT i.*, id.*, sua.keyword as `seo_keyword` FROM `" . DB_PREFIX . "information` i ";
        
        if (empty($data['language_id'])) {
            $data['language_id'] = $this->config->get('config_lanugage_id');
        }
        
        $query .= " LEFT JOIN `" . DB_PREFIX . "information_description` id ON (i.information_id = id.information_id AND id.language_id = '" . $data['language_id'] . "')";
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_url_alias` sua ON (CONCAT('information_id=',i.information_id) = sua.query AND sua.language_id = '" . $data['language_id'] . "')";
        
        $query .= " WHERE 1=1 ";
        
        if (!empty($data['filter_name'])) {
            $query .= " AND id.title LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }
        
        if (!empty($data['filter_meta_title'])) {
            $query .= " AND id.meta_title LIKE '%" . $this->db->escape($data['filter_meta_title']) . "%'";
        }
        
        if (!empty($data['filter_meta_description'])) {
            $query .= " AND id.meta_description LIKE '%" . $this->db->escape($data['filter_meta_description']) . "%'";
        }
        
        if (!empty($data['filter_meta_keywords'])) {
            $query .= " AND id.meta_keyword LIKE '%" . $this->db->escape($data['filter_meta_keywords']) . "%'";
        }
        
        if (!empty($data['filter_keyword'])) {
            $query .= " AND sua.keyword LIKE '%" . $this->db->escape($data['filter_keyword']) . "%'";
        }
        
        if ($page) {
			$start = ($page - 1) * $data['filter_limit'];
		}
        
        $query .= " ORDER BY `i`.`status` DESC, `id`.`title` ASC LIMIT ".$start.", ".$data['filter_limit'];
        
        $query = $this->db->query($query);

        return $query->rows;
    }
    
    public function getTotalInformations($data = array()) {
		$query = "SELECT COUNT(*) as `count`  FROM `" . DB_PREFIX . "information` i ";
        
        if (empty($data['language_id'])) {
            $data['language_id'] = $this->config->get('config_lanugage_id');
        }
        
        $query .= "JOIN `" . DB_PREFIX . "information_description` id ON (i.information_id = id.information_id AND id.language_id = '" . $data['language_id'] . "')";
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_url_alias` sua ON (CONCAT('information_id=',i.information_id) = sua.query AND sua.language_id = '" . $data['language_id'] . "')";
        
        $query .= " WHERE 1=1 ";
        
        if (!empty($data['filter_name'])) {
            $query .= " AND id.title LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }
        
        if (!empty($data['filter_meta_title'])) {
            $query .= " AND id.meta_title LIKE '%" . $this->db->escape($data['filter_meta_title']) . "%'";
        }
        
        if (!empty($data['filter_meta_description'])) {
            $query .= " AND id.meta_description LIKE '%" . $this->db->escape($data['filter_meta_description']) . "%'";
        }
        
        if (!empty($data['filter_meta_keywords'])) {
            $query .= " AND id.meta_keyword LIKE '%" . $this->db->escape($data['filter_meta_keywords']) . "%'";
        }
        
        if (!empty($data['filter_keyword'])) {
            $query .= " AND sua.keyword LIKE '%" . $this->db->escape($data['filter_keyword']) . "%'";
        }
		
		$query = $this->db->query($query);
        
		return $query->row['count']; 
	}
    
    public function getManufacturers($page = 1, $data = array()) {
        $query = "SELECT m.*, sua.keyword as `seo_keyword`, smd.* FROM `" . DB_PREFIX . "manufacturer` m ";
        
        if (empty($data['language_id'])) {
            $data['language_id'] = $this->config->get('config_lanugage_id');
        }
        
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_manufacturer_description` smd ON (m.manufacturer_id = smd.manufacturer_id AND smd.language_id = '" . $data['language_id'] . "')";
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_url_alias` sua ON (CONCAT('manufacturer_id=',m.manufacturer_id) = sua.query AND sua.language_id = '" . $data['language_id'] . "')";
        
        $query .= " WHERE 1=1 ";
        
        if (!empty($data['filter_name'])) {
            $query .= " AND m.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }
        
        if (!empty($data['filter_keyword'])) {
            $query .= " AND sua.keyword LIKE '%" . $this->db->escape($data['filter_keyword']) . "%'";
        }
        
        if (!empty($data['filter_meta_title'])) {
            $query .= " AND smd.meta_title LIKE '%" . $this->db->escape($data['filter_meta_title']) . "%'";
        }
        
        if (!empty($data['filter_meta_description'])) {
            $query .= " AND smd.meta_description LIKE '%" . $this->db->escape($data['filter_meta_description']) . "%'";
        }
        
        if (!empty($data['filter_meta_keywords'])) {
            $query .= " AND smd.meta_keyword LIKE '%" . $this->db->escape($data['filter_meta_keywords']) . "%'";
        }
        
        if ($page) {
			$start = ($page - 1) * $data['filter_limit'];
		}
        
        $query .= " ORDER BY `m`.`name` ASC LIMIT ".$start.", ".$data['filter_limit'];
        
        $query = $this->db->query($query);

        return $query->rows;
    }
    
    public function getTotalManufacturers($data = array()) {
		$query = "SELECT COUNT(*) as `count`  FROM `" . DB_PREFIX . "manufacturer` m ";
        
        if (empty($data['language_id'])) {
            $data['language_id'] = $this->config->get('config_lanugage_id');
        }
        
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_manufacturer_description` smd ON (m.manufacturer_id = smd.manufacturer_id AND smd.language_id = '" . $data['language_id'] . "')";
        $query .= " LEFT JOIN `" . DB_PREFIX . "seo_url_alias` sua ON (CONCAT('manufacturer_id=',m.manufacturer_id) = sua.query AND sua.language_id = '" . $data['language_id'] . "')";
        
        $query .= " WHERE 1=1 ";
        
        if (!empty($data['filter_name'])) {
            $query .= " AND m.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }
        
        if (!empty($data['filter_keyword'])) {
            $query .= " AND sua.keyword LIKE '%" . $this->db->escape($data['filter_keyword']) . "%'";
        }
        
        if (!empty($data['filter_meta_title'])) {
            $query .= " AND smd.meta_title LIKE '%" . $this->db->escape($data['filter_meta_title']) . "%'";
        }
        
        if (!empty($data['filter_meta_description'])) {
            $query .= " AND smd.meta_description LIKE '%" . $this->db->escape($data['filter_meta_description']) . "%'";
        }
        
        if (!empty($data['filter_meta_keywords'])) {
            $query .= " AND smd.meta_keyword LIKE '%" . $this->db->escape($data['filter_meta_keywords']) . "%'";
        }
        
		$query = $this->db->query($query);
        
		return $query->row['count']; 
	}
    
    public function saveField($data = array()) {
        if (!empty($data) && !empty($data['id']) && !empty($data['field']) && !empty($data['language_id']) && !empty($data['entity_type']) && isset($data['value'])) {
              
            $field = '';
            $used_table = '';
            $selected_id = '';
            if ($data['field'] == 'url_alias') {
                $used_table = 'seo_url_alias'; 
                $field = 'keyword';
                $selected_id = 'query';
                $data['id'] = $data['entity_type'] . '_id=' . $data['id'];
            } else if ($data['field'] == 'h1' || $data['field'] == 'h2') {
                $used_table = 'seo_product_description';
                $selected_id = $data['entity_type'] . '_id';
                $field = $data['field'];
            } else if ($data['entity_type'] == 'manufacturer') {
                $used_table = 'seo_'. $data['entity_type'] . '_description';
                $field = $data['field'];
                $selected_id = $data['entity_type'] . '_id';
            } else {
                $used_table = $data['entity_type'] . '_description';
                $field = $data['field'];
                $selected_id = $data['entity_type'] . '_id';
            }
                
            if (!empty($field) && !empty($used_table)) {
                
                if ($data['field'] == 'url_alias') {
                    $check_if_exists = $this->db->query("SELECT * FROM `" . DB_PREFIX . $used_table . "` WHERE `" . $field . "` = '" . trim($this->db->escape($data['id'])) . "'");

                    if ($check_if_exists->num_rows > 0) {
                        return false;
                    }
                    
                    $query_check = $this->db->query("SELECT * FROM `" . DB_PREFIX . $used_table . "` WHERE `" . $selected_id . "` = '" . $this->db->escape($data['id']) . "' AND `language_id` = '" . $this->db->escape((int)$data['language_id'])."'");
                    
                    if ($query_check->num_rows == 0) {    
                        $sql = "INSERT INTO `" . DB_PREFIX . $used_table . "` SET `" . $field . "` = '" . $this->db->escape($data['value']) . "', `" . $selected_id . "` = '" . $this->db->escape($data['id']) . "', `language_id` = '" . $this->db->escape((int)$data['language_id'])."'";
                    } else {
                        $sql = "UPDATE `" . DB_PREFIX . $used_table . "` SET `" . $field . "` = '" . $this->db->escape($data['value']) . "' WHERE `" . $selected_id . "` = '" . $this->db->escape($data['id']) . "' AND `language_id` = '" . $this->db->escape((int)$data['language_id'])."'";
                    } 
                        
                    $query = $this->db->query($sql);
                } else if ($data['field'] == 'h1' || $data['field'] == 'h2') {
                     $query_check = $this->db->query("SELECT * FROM `" . DB_PREFIX . $used_table . "` WHERE `" . $selected_id . "` = '" . $this->db->escape($data['id']) . "' AND `language_id` = '" . $this->db->escape((int)$data['language_id'])."'");
                    
                    if ($query_check->num_rows == 0) {    
                        $sql = "INSERT INTO `" . DB_PREFIX . $used_table . "` SET `" . $field . "` = '" . $this->db->escape($data['value']) . "', `" . $selected_id . "` = '" . $this->db->escape($data['id']) . "', `language_id` = '" . $this->db->escape((int)$data['language_id'])."'";
                    } else {
                        $sql = "UPDATE `" . DB_PREFIX . $used_table . "` SET `" . $field . "` = '" . $this->db->escape($data['value']) . "' WHERE `" . $selected_id . "` = '" . $this->db->escape($data['id']) . "' AND `language_id` = '" . $this->db->escape((int)$data['language_id'])."'";
                    } 
                    
                    $query = $this->db->query($sql);
                } else {
                    $query = $this->db->query("UPDATE `" . DB_PREFIX . $used_table . "` SET `" . $field . "` = '" . $this->db->escape($data['value']) . "' WHERE `" . $selected_id . "` = '" . $this->db->escape($data['id']) . "' AND `language_id` = '" . $this->db->escape((int)$data['language_id'])."'");
                }
                
                return true;
            }
        
            return false;
        } else {
            return false;
        }
        
        
    }
   
}
