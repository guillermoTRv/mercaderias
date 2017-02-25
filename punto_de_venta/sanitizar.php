<?php 
	function sanitizar($var_sn){
		$var_sn = addslashes(htmlspecialchars(strip_tags(trim($_POST[$var_sn]))));
		return $var_sn;
	}
?>