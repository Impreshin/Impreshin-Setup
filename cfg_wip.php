<?php
if (php_sapi_name() == 'cli'){
	$cfg = array();
	if (file_exists('/media/data/wip')){
		require_once('/media/data/wip/config.default.inc.php');
		require_once('/media/data/wip/config.inc.php');

		foreach ($cfg['DB'] as $key => $val) {
			echo "db_$key:$val\n";
		}
		foreach ($cfg['git'] as $key => $val) {
			if (!is_array($val)) {
				echo "git_$key:$val\n";
			}

		}
	}


}



?>
