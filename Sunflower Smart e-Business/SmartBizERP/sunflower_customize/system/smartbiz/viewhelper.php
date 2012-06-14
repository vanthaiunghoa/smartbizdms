<?php
function __($language_key) {
	if(Common::$LANG_INSTANCE) {
		return Common::$LANG_INSTANCE->get($language_key);
	} else {
		return $language_key;
	}
}
?>