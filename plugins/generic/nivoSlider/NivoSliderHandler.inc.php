<?php

/**
 * @file NivoSliderHandler.inc.php
 *
 * AJAX handler for slideshow requests. 
 *
 */

import('classes.handler.Handler');

class NivoSliderHandler extends Handler {
  function index( $args ) {
    Request::redirect(null, null, 'view', Request::getRequestedOp());
  }
  
  function view ($args) {
    $slideshow = '';

    if(isset($_GET['s']) && ctype_alnum($_GET['s'])) {
      $slideshow = $_GET['s'];
    }
    if (count($args) > 0 ) {
      $journal = &Request::getJournal();
      $journalId = $journal->getJournalId();
      $path = $args[0];

      $nivoSliderPlugin = &PluginRegistry::getPlugin('generic', 'NivoSliderPlugin');
      $templateMgr = &TemplateManager::getManager();

      //Get the list of images in the slideshow directory and pass them to the template as JSON.
      if(!empty($slideshow)) {
        $journalFilesDir = '/public/slideshows/journal/' . $journalId . '/' . $slideshow . '/';
      }
      else {
        $journalFilesDir = '/public/slideshows/journal/' . $journalId . '/' ;
      }
      $localJournalFilesDir = '.' . $journalFilesDir ; 
      $files = self::buildGallery($localJournalFilesDir, $journalFilesDir);      
 
      //If we were on PHP >= 5.2 we wouldn't need to include this library.
      import('plugins.generic.nivoSlider.vendor.jsonwrapper.jsonwrapper');
      $json_images = json_encode($files);

      // and assign the template vars needed
      $templateMgr->assign('json_images', $json_images);
      $templateMgr->display($nivoSliderPlugin->getTemplatePath().'content.tpl');
    }
  }

  /**
   * List files in a directory that have valid extensions.
   *
   * @param $dir
   *   The filesystem directory where the files are stored. 
   *
   * @param $valid_extensions
   *   An array of valid extensions with no preceding '.' prefix. Eg array('jpg').
   *
   * @return 
   *   An array of valid images.  
   */

  private static function listImages($dir, array $valid_extensions = array('jpg', 'jpeg', 'png', 'gif')) {
    if(!file_exists($dir)) {
      return array();
    }
    $files = scandir($dir);

    $images = array();
    foreach($files as $key => $file) {
      $tmp = explode(".", $file);
      $ext = $tmp[count($tmp) - 1];

      if(in_array($ext, $valid_extensions)) {
        $images[] = $files[$key];
      }
    }

    return $images;
  }

  /**
   * Returns a caption for an image.
   *
   * @param $dir
   *   The filesystem directory where the caption files are stored. 
   *
   * @param $image
   *   The image name that you're getting the caption for.
   *
   * @return 
   *   A string containing the escaped caption for the image.  
   */
  private static function getCaption($dir, $image) {
    $exp_image = explode('.', $image);
    unset($exp_image[count($exp_image) - 1]);
    $image = implode('.', $exp_image);
    $caption_file_dir = $dir . $image . '.html';
    
    if(!file_exists($caption_file_dir)) {
      return '';
    }
  
    $caption = htmlentities(file_get_contents($caption_file_dir));
    return $caption;
  }
   
  /**
   * Get a list of images along with their respective captions.
   *
   * @param $localJournalFilesDir
   *   The filesystem directory where the image and caption files are stored. 
   *
   * @param $publicFilesDir
   *   The path from the base url to the public files directory.
   *
   * @return 
   *   An array of associative arrays with two keys:
   *     file: The URI to the image file.
   *     caption: The caption associated with that file.
   */

  private static function buildGallery($localJournalFilesDir, $publicFilesDir) {
    $files = self::listImages($localJournalFilesDir);

    $gallery = array();
    foreach($files as $file) {
      $caption = self::getCaption($localJournalFilesDir, $file);
      $gallery[] = array('file' => $file, 'caption' =>  $caption);
    }

    foreach($gallery as &$image) {
      $image['file'] = Request::getBaseUrl() . '/'. $publicFilesDir . $image['file'];
    }
  
    return $gallery;
  }

}

?>
