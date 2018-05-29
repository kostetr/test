<?php

class View {
      
    /**
     * Имя файла основного шаблона
     * @var string 
     */
    public $template='main.php';
    /**
     * Имя файла отображения контента
     * @var string
     */
    public $content_view;


    public function show() {
	include_once 'template/'. $this->template;
    }
}
