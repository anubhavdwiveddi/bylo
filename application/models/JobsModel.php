<?php

Class JobsModel extends CI_Model
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
    public function fetch_two_table_job_data($table, $table1, $select, $JOIN, $where){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }
    public function fetch__two_table_job_data($table, $table1, $select, $JOIN, $where){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }
    public function fetch_page_data_join($table, $table1, $table2, $select, $JOIN, $JOIN1, $where){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN, 'left');
        $this->db->JOIN($table2, $JOIN1);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function update_all($table, $where, $data){
        $this->db->where($where);
        return $this->db->update($table, $data);
    }

    //Using JOIN to two table
    public function get_data_join($table, $table1, $table2, $table3, $table4, $table5, $table6,
                                  $select, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $JOIN5, $JOIN6, $where){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN1);
        $this->db->JOIN($table2, $JOIN2);
        $this->db->JOIN($table3, $JOIN3);
        $this->db->JOIN($table4, $JOIN4);
        $this->db->JOIN($table5, $JOIN5);
        $this->db->JOIN($table6, $JOIN6, 'LEFT');
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_data_order($table, $where, $order){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $this->db->order_by($order, 'ASC');
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_data_order_desc($table, $where, $order){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_data_order_multiple($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $where, $select){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN);
        $this->db->JOIN($table2, $JOIN1);
        $this->db->JOIN($table3, $JOIN2);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

}
