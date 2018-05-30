<?php


class Price {

    /**
     *
     * @var mysqli
     */
    protected $db;

    /**
     *
     * @var string 
     */
    public $table;

    public function __construct() {
        $this->db = new mysqli('localhost', 'root', '', 'tasklist');
        $this->db->set_charset("utf8");
    }

    public function all() {
        $query = "SELECT * FROM " . $this->table;
        $result = $this->db->query($query);
        if ($result) {
            return $result->fetch_all(MYSQLI_ASSOC);
        }
        return false;
    }

    public function selectByName($name) {
        $query = "SELECT * FROM " . $this->table . " WHERE login='" . $name . "' LIMIT 1";
        $result = $this->db->query($query);
        if ($result) {
            return $result->fetch_object();
        }
        return false;
    }
}
