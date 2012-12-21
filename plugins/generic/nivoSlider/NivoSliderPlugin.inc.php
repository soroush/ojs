<?php

/**
 * @file NivoSliderPlugin.inc.php
 *
 * NivoSliderPlugin class
 *
 */

import('lib.pkp.classes.plugins.GenericPlugin');

class NivoSliderPlugin extends GenericPlugin {

	function getName() {
		return 'NivoSliderPlugin';
	}

	function getDisplayName() {
		return Locale::translate('plugins.generic.nivoSlider.displayName');
	} 		

	function getDescription() {
		return Locale::translate('plugins.generic.nivoSlider.description');
	}

	/**
	 * Register the plugin, attaching to hooks as necessary.
	 * @param $category string
	 * @param $path string
	 * @return boolean
	 */
	function register($category, $path) {
		$success = parent::register($category, $path);

    if (!Config::getVar('general', 'installed') || defined('RUNNING_UPGRADE')) return true;

    if ($success && $this->getEnabled()) {
      HookRegistry::register('LoadHandler', array(&$this, 'callbackHandleContent'));
      HookRegistry::register('Templates::Common::Footer::PageFooter', array($this, 'insertJS'));
      HookRegistry::register('Templates::Article::Footer::PageFooter', array($this, 'insertJS'));
    }

    return $success;
	}

        
	function insertJS($hookName, $params) {
    $smarty = &$params[1];
    $output = &$params[2];
    $templateMgr = &TemplateManager::getManager();
    $currentJournal = $templateMgr->get_template_vars('currentJournal');

    if (!empty($currentJournal)) {
      $journal = &Request::getJournal();
      $journalId = $journal->getJournalId();

      $output .= $templateMgr->fetch($this->getTemplatePath() . 'nivoSlider.tpl'); 
    }
		return;
	}

	/**
	 * Declare the handler function to process the actual page PATH
	 */

	function callbackHandleContent($hookName, $args) {
		$templateMgr = &TemplateManager::getManager();

		$page =& $args[0];
		$op =& $args[1];

		if ( $page == 'slideshow' ) {
			define('HANDLER_CLASS', 'NivoSliderHandler');
			$this->import('NivoSliderHandler');
			return true;
		}
		return false;
	}

}

?>


