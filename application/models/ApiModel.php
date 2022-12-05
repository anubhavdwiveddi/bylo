<?php

class ApiModel extends CI_Model {

    public function check_validation($table, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }
    public function check_validation_result($table, $where){
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function check_validation_result_with_select($table, $where, $select){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function insert_all($table, $data)
    {
        $this->db->insert($table, $data);
        return $this->db->insert_id();
    }

    public function update_all($table, $where, $data){
        $this->db->where($where);
        return $this->db->update($table, $data);
    }

    public function Join_query_two_table($table, $table1, $Join, $select, $where){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $Join);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function Join_query_two_table_type($table, $table1, $Join, $select, $where, $Join_Type){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $Join);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function Join_query_two_table_result($table, $table1, $Join, $select, $where){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $Join);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function Join_query_two_table_result_limit($table, $table1, $Join, $select, $where, $start, $perPage){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $Join);
        $this->db->where($where);
        if(empty($start)){
            $this->db->limit($perPage, $perPage);
        }else {
            $this->db->limit($start, $perPage);
        }
        $query = $this->db->get();
        return $query->result();
    }

    public function Join_query_two_table_result_group($table, $table1, $Join, $select, $where, $Group, $join_type){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $Join, $join_type);
        $this->db->where($where);
        if($Group){
            $this->db->group_by($Group);
        }
        $query = $this->db->get();
        return $query->result();
    }

    public function Join_query_two_table_with_result($table, $table1, $Join, $Join1, $select, $where){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $Join);
        $this->db->Join($table1, $Join1);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function Join_query_three_table_with_result($table, $table1, $table2, $Join, $Join1, $select, $where, $Group, $join_type){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $Join);
        $this->db->Join($table2, $Join1);
        $this->db->where($where);
        if($Group){
            $this->db->group_by($Group);
        }
        $query = $this->db->get();
        return $query->result();
    }

    public function delete_record($table, $where)
    {
        $this->db->where($where);
        return $this->db->delete($table);
    }

    public function get_data($table, $table1, $table2, $table3, $Join1, $Join2, $Join3, $select, $where, $Join_type, $order_by, $order, $Group_by){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $Join1, $Join_type);
        $this->db->Join($table2, $Join2, $Join_type);
        $this->db->Join($table3, $Join3, $Join_type);
        $this->db->where($where);
        if($Group_by){
            $this->db->group_by($Group_by);
        }
        $this->db->order_by($order_by, $order);
        $query = $this->db->get();
        return $query->result();
    }
    public function get_data_three($table, $table1, $table2, $table3, $Join1, $Join2, $Join3, $select, $where, $Join_type, $order_by, $order){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $Join1, $Join_type);
        $this->db->Join($table2, $Join2, $Join_type);
        $this->db->Join($table3, $Join3, $Join_type);
        $this->db->where($where);
        $this->db->order_by($order_by, $order);
        $query = $this->db->get();

        return $query->result();
    }

    public function get_Count($table, $where, $select){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function json_data_fetch($table, $where, $select){
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return json_encode($query->result());
    }

}