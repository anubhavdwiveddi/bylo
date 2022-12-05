<?php

Class VideoModel extends CI_Model
{

    public function insert_all($table, $data)
    {
        $this->db->insert($table, $data);
        return $this->db->insert_id();
    }

    public function fetch_data_two_with_order($table, $table1, $table2, $JOIN1, $JOIN2, $JOIN_type, $select, $where, $order){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN1);
        $this->db->JOIN($table2, $JOIN2, $JOIN_type);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_data_two_order($table, $table1, $table2, $table3, $JOIN1, $JOIN2, $JOIN3, $select, $where, $JOIN_type){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN1, $JOIN_type);
        $this->db->JOIN($table2, $JOIN2, $JOIN_type);
        $this->db->JOIN($table3, $JOIN3, $JOIN_type);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function fetch_data_two_order_row($table, $table1, $JOIN1, $select, $where){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN1);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function fetch_data_two_order_result($table, $table1, $table2, $table3, $JOIN1, $JOIN2, $JOIN3, $select, $where, $JOIN_type, $order, $order_type){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN1, $JOIN_type);
        $this->db->JOIN($table2, $JOIN2, $JOIN_type);
        $this->db->JOIN($table3, $JOIN3, $JOIN_type);
        $this->db->where($where);
           $this->db->order_by($order, $order_type);
        $query = $this->db->get();
        return $query->result();
    }

    public function check_data($table, $where, $order){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function two_table_join($table, $table1, $JOIN, $select, $where, $order, $JOIN_Type){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN, $JOIN_Type);
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

    public function count_user($table, $where, $select){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }
}