<?php

Class SettingModel extends CI_Model
{

    public function insert_all($table, $data)
    {
        $this->db->insert($table, $data);
        return $this->db->insert_id();
    }

    public function checkvalidation($table, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function check_data($table, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function Fetch_data($table, $where, $select){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_page_data($table, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    // LEFT Join data fetch sql query
    public function fetch_page_data_join($table, $table1, $JOIN, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->join($table1 ,$JOIN, 'left');
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function update_all($table, $where, $data){
        $this->db->where($where);
        return $this->db->update($table, $data);
    }

    public function fetch_data_order($table, $where, $order){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $this->db->order_by($order, 'ASC');
        $query = $this->db->get();
        return $query->result();
    }

//    public function serachbox($table, $where){
//        $this->db->select("*");
//        $this->db->from($table);
//        $this->db->like($where);
//        $query = $this->db->get();
//        return $query->result();
//    }

    public function serachbox($table, $where){
        $this->db->select("first_name, last_name, user_code, profile_image, avatar_image");
        $this->db->from($table);
        $this->db->where('first_name', $where);
        $this->db->limit('15');
        $query = $this->db->get();
        return $query->result();
    }

    public function search_box_multiple($table, $table1, $where){
        $this->db->select("*");
        $this->db->from($table);
        $this->db->from($table1);
        $this->db->like($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function pc($search_data)
    {
        $this->db->query("CALL search_data($search_data)");
        $call_total = 'SELECT '.$search_data.' as Parameter';
        $query = $this->db->query($call_total);
        echo $this->db->last_query();
        die();
        return $query->result();
    }


}
