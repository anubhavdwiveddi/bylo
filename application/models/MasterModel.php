<?php

Class MasterModel extends CI_Model
{
    public function fetch_page_data_result($table, $where, $order_by){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $this->db->order_by($order_by, 'ASC');
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_page_data_row($table, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function check_validation($table, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

}