<?php

Class BlogModel extends CI_Model
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
    public function update_all($table, $where, $data){
        $this->db->where($where);
        return $this->db->update($table, $data);
    }

    public function delete_record($table, $where)
    {
        $this->db->where($where);
        return $this->db->delete($table);
    }

    public function fetch_page_data($table, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_join_data($table, $table1, $table2, $table3, $table4, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $JOIN_type, $where, $select){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->join($table1, $JOIN1, $JOIN_type);
        $this->db->join($table2, $JOIN2, $JOIN_type);
        $this->db->join($table3, $JOIN3, $JOIN_type);
        $this->db->join($table4, $JOIN4, $JOIN_type);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function check_data($table, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function delete_all($table, $where) {
        $this->load->model($table);
        $this->model_admin->did_delete_row($where);
    }

    public function fetch_post_join_data($table, $table1, $table2, $table3, $where, $JOIN1, $JOIN2, $JOIN3, $select, $order, $join_position){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->join($table1, $JOIN1);
        $this->db->join($table2, $JOIN2, $join_position);
        $this->db->join($table3, $JOIN3, $join_position);
        $this->db->group_by('id');
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_post_join_data_with_order($table, $table1, $table2, $table3, $where, $JOIN1, $JOIN2, $JOIN3, $select, $order, $join_position){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->join($table1, $JOIN1, $join_position);
        $this->db->join($table2, $JOIN2);
        $this->db->join($table3, $JOIN3);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_post_join_data_with_order_limit($table, $table1, $table2, $table3, $where, $JOIN1, $JOIN2, $JOIN3, $select, $order, $join_position, $limit){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->join($table1, $JOIN1, $join_position);
        $this->db->join($table2, $JOIN2);
        $this->db->join($table3, $JOIN3);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $this->db->limit($limit);
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_post_join_data_with_order1($table, $table1, $table2, $table3, $where, $JOIN1, $JOIN2, $JOIN3, $select, $order, $join_position){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->join($table1, $JOIN1, $join_position);
        $this->db->join($table2, $JOIN2);
        $this->db->join($table3, $JOIN3);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->row();
    }

    public function join_two_table($table, $table1, $where, $JOIN, $select, $order){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->join($table1, $JOIN);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function join_two_table_two_join($table, $table1, $where, $JOIN, $JOIN1, $select, $order){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->join($table1, $JOIN);
        $this->db->join($table1, $JOIN1);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function table_join($table, $table1, $table2, $JOIN, $JOIN1, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->join($table1, $JOIN);
        $this->db->join($table2, $JOIN1, 'LEFT');
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }
    public function fetch_post_join_with_order($table, $table1, $table2, $where, $JOIN1, $JOIN2, $select, $order){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->join($table1, $JOIN1);
        $this->db->join($table2, $JOIN2);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->row();
    }

    public function selectAllByWhere1li($table, $where, $limit){
        $this->db->select("*");
        $this->db->from($table);
        $this->db->where($where);
        $this->db->order_by('id','DESC');
        $this->db->limit($limit);
        $query = $this->db->get();
        //echo $this->db->last_query();die;
        if ($query->result() != null)
            return $query->result();
        else
            return false;
    }

    public function Count_blog($table, $where, $select){
        $this->db->select($select);
        $this->db->from($table);
        if(!empty($where)){
            $this->db->where($where);
        }
        $query = $this->db->get();
        return $query->row();
    }

}
