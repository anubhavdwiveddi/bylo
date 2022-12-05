<?php

Class PublicMediaModel extends CI_Model
{
    public function insert_all($table, $data)
    {
        $this->db->insert($table, $data);
        return $this->db->insert_id();
    }

    public function check_data($table, $where, $order){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function two_table_join($table, $table1, $table2, $table3, $table4, $table5, $JOIN, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $select, $where, $order, $JOIN_Type){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN, $JOIN_Type);
        $this->db->JOIN($table2, $JOIN1, $JOIN_Type);
        $this->db->JOIN($table3, $JOIN2, $JOIN_Type);
        $this->db->JOIN($table4, $JOIN3, $JOIN_Type);
        $this->db->JOIN($table5, $JOIN4, $JOIN_Type);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function check_already_exist($table, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function update_all($table, $where, $data){
        $this->db->where($where);
        return $this->db->update($table, $data);
    }

    public function join_two_table($table, $table1, $where, $JOIN, $select, $order){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }
}