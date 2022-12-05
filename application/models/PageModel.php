<?php

Class PageModel extends CI_Model
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
    public function get_data_join_1($table, $table1, $table2, $table3, $table4, $table5, $table6,
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

    public function fetch_page_data_limit($table, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $this->db->limit(9);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_data_join($table, $table1, $table2, $table3, $select, $JOIN1, $JOIN2, $JOIN3, $where){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN1);
        $this->db->JOIN($table2, $JOIN2);
        $this->db->JOIN($table3, $JOIN3);
        if(!empty($where)) {
            $this->db->where($where);
        }
        $query = $this->db->get();
        return $query->result();
    }

    public function get_data_join_limit($table, $table1, $table2, $table3, $select, $JOIN1, $JOIN2, $JOIN3, $where, $limit){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN1);
        $this->db->JOIN($table2, $JOIN2);
        $this->db->JOIN($table3, $JOIN3);
        if(!empty($where)) {
            $this->db->where($where);
        }if(!empty($limit)) {
            $this->db->limit($limit);
        }
        $query = $this->db->get();
        return $query->result();
    }

    public function get_data_join_limit_or($table, $table1, $table2, $table3, $select, $JOIN1, $JOIN2, $JOIN3, $where, $limit, $order, $order_by){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN1);
        $this->db->JOIN($table2, $JOIN2);
        $this->db->JOIN($table3, $JOIN3);
        if(!empty($where)) {
            $this->db->where($where);
        }if(!empty($limit)) {
            $this->db->limit($limit);
        }
        $this->db->Order_by($order, $order_by);
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

    public function fetch_data_two_order($table, $table1, $JOIN1, $select, $where){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN1);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }
    public function fetch_data_two_with_order($table, $table1, $JOIN1, $select, $where, $order){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN1);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function get_two_table_join($table, $table1, $table2, $table3, $table4,
                                       $select, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $where){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN1);
        $this->db->JOIN($table2, $JOIN2);
        $this->db->JOIN($table3, $JOIN3);
        $this->db->JOIN($table4, $JOIN4);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function count_query($table ,$where){
        $sql = "SELECT COUNT(id) as review FROM $table where page_id = $where And status = 1";
        $query = $this->db->query($sql);
        $result = $query->result_array();
        //echo $this->db->last_query();die;
        if ($query->result() != null)
            return $query->result();
        else
            return false;
    }


    public function count_user($table, $where, $select){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function total_review($table, $star, $where){
        $this->db->select_sum('star');
        $this->db->from('tr02_user_page_review');
        $this->db->where('status', 1);
        $query= $this->db->get();
        return $query->row();
    }

    public function review_user($table, $select, $where, $group, $order){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $this->db->GROUP_by($group);
        $this->db->order_by($order, 'DESC');
        $query= $this->db->get();
        return $query->result();
    }
    

}
