<?php

class Controller {
           /**
     * объект предназначенный для сбора верстки
     * @var Views 
     */
    protected $viewer;
    /**
     * объект для работы с данными
     * @var AbstractModel
     */
    protected $model;

    public function __construct() {
	$this->viewer = new Views();
    }

    
    public function __call($name, $arguments) {
	Router::notFound();
    }
        public function action_index() {
        $this->viewer->tasks = $this->model->new_tasks();
        $this->viewer->content_view = 'tasks_index_view.php';
        $this->viewer->show();
    }
}
