<?php
class ModelExtensionModuleExportProduct extends Model {

	public function categories() {
		$sql = "SELECT c.category_id, c.parent_id, cd.name "
			. "FROM " . DB_PREFIX . "category c "
			. "LEFT JOIN " . DB_PREFIX . "category_description cd USING(category_id) WHERE cd.language_id=".(int)$this->config->get('config_language_id')
			. " ORDER BY parent_id";

		$query = $this->db->query($sql);

		$list = [];
		//Ключ массива - идентификатор родительского элемента
		// значение - список дочерних элементов

		foreach ($query->rows as $row) {
			if( empty($list[$row['parent_id']]) ){
				$list[$row['parent_id']] = [];
			}
			$list[$row['parent_id']][] = $row;
		}

		return $this->tree_list_tree($list);
	}

	public function tree_list_tree(&$a_list, $category_id = 0) {
		if ( empty($a_list[$category_id]) ) {
			return [];
		}
		
		$a_tree = [];

		for ($i = 0; $i < count($a_list[$category_id]); $i++) {
			$f			 = $a_list[$category_id][$i];
			$f['a_tree'] = $this->tree_list_tree($a_list, $a_list[$category_id][$i]['category_id']);
			$a_tree[]	 = $f;
		}

		return $a_tree;
	}

}
