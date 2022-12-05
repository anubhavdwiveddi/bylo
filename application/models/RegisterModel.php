<?php

class RegisterModel extends CI_Model
{
    public function insert_all($table, $data)
    {
        $this->db->insert($table, $data);
        return $this->db->insert_id();
    }

    public function checkvalidation($table, $where)
    {
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function check_validation($table, $table1, $where, $select, $Join, $Join_type)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $this->db->join($table1, $Join, $Join_type);
        $query = $this->db->get();
        return $query->row();
    }

    public function update_all($table, $where, $data)
    {
        $this->db->where($where);
        return $this->db->update($table, $data);
    }

    public function delete_record($table, $where)
    {
        $this->db->where($where);
        return $this->db->delete($table);
    }

    public function fetch_page_data($table, $where)
    {
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_page($table, $where, $order)
    {
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_page_data_limit($table, $where)
    {
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $this->db->limit(9);
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_join_data($table, $table1, $table2, $table3, $table4, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $JOIN_type, $where, $select)
    {
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

    public function check_data($table, $where)
    {
        $this->db->select('*');
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function delete_all($table, $where)
    {
        $this->db->where($where);
        $this->db->delete($table);
    }

    public function Fetch_data_using_two_table($table, $table1, $table2, $table3, $table4, $table5, $JOIN, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $Join_type, $select, $where)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN);
        $this->db->JOIN($table2, $JOIN1, $Join_type);
        $this->db->JOIN($table3, $JOIN2, $Join_type);
        $this->db->JOIN($table4, $JOIN3, $Join_type);
        $this->db->JOIN($table5, $JOIN4, $Join_type);
        if (!empty($where)) {
            $this->db->where($where);
        }
        $query = $this->db->get();
        return $query->row();
    }

    public function Fetch_data_using_three_table($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $Join_type, $select, $where)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN);
        $this->db->JOIN($table2, $JOIN1, $Join_type);
        $this->db->JOIN($table3, $JOIN2, $Join_type);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    public function Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where)
    {
        $this->db->select($select);
        $this->db->from($table1);
        $this->db->JOIN($table, $JOIN);
        $this->db->where($where);
        $this->db->order_by('id', 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function Fetch__data_using_two_table_order_by($table, $table1, $JOIN, $select, $where, $order_by, $order)
    {
        $this->db->select($select);
        $this->db->from($table1);
        $this->db->JOIN($table, $JOIN);
        $this->db->where($where);
        $this->db->order_by($order, $order_by);
        $query = $this->db->get();
        return $query->result();
    }

    public function Fetch__data_using_three_table($table, $table1, $table2, $table3, $table4, $JOIN, $JOIN1, $JOIN2, $JOIN3, $select, $where)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN);
        $this->db->JOIN($table2, $JOIN1);
        $this->db->JOIN($table3, $JOIN2);
        $this->db->JOIN($table4, $JOIN3);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->result();
    }

    public function is_alerady_register($id)
    {
        $this->db->where('login_oauth_uid', $id);
        $query = $this->db->get('tr01_user');
        if ($query->num_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function count_query($table, $where)
    {
        $sql = "SELECT COUNT(id) as review FROM $table where page_id = $where And status = 1";
        $query = $this->db->query($sql);
        $result = $query->result_array();
        //echo $this->db->last_query();die;
        if ($query->result() != null)
            return $query->result();
        else
            return false;
    }

    public function update_user_data($data, $id)
    {
        $this->db->where('login_oauth_uid', $id);
        $this->db->update('tr01_user', $data);
    }

    public function insert_user_data($data)
    {
        $this->db->insert('tr01_user', $data);

    }

    function fetch_data($table, $table1, $table2, $JOIN, $JOIN1, $JOIN_type, $where, $perPage, $start, $select)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $this->db->Join($table1, $JOIN);
        $this->db->Join($table2, $JOIN1, $JOIN_type);
        $this->db->limit($start, $perPage);
        $this->db->order_by("id", "DESC");
        $query = $this->db->get();
        return $query->result();
    }

    function fetch_data_limit($table, $table1, $table2, $JOIN, $JOIN1, $JOIN_type, $where, $start, $limit, $select)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $this->db->Join($table1, $JOIN);
        $this->db->Join($table2, $JOIN1, $JOIN_type);
        $this->db->limit($limit, $start);
        $this->db->order_by("id", "DESC");
        $query = $this->db->get();
        return $query->result();
    }

    function fetch_data1($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $JOIN_type, $where, $start, $limit, $select)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $this->db->Join($table1, $JOIN);
        $this->db->Join($table2, $JOIN1, $JOIN_type);
        $this->db->Join($table3, $JOIN2, $JOIN_type);
        $this->db->limit($limit, $start);
        $this->db->order_by("id", "DESC");
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_page_table($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $where, $order, $select)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $JOIN);
        $this->db->Join($table2, $JOIN1);
        $this->db->Join($table3, $JOIN2);
        $this->db->where($where);
        $this->db->order_by($order, "DESC");
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_page_table_limit($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $where, $order, $select, $limit)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $JOIN);
        $this->db->Join($table2, $JOIN1);
        $this->db->Join($table3, $JOIN2);
        $this->db->where($where);
        $this->db->order_by($order, "DESC");
        $this->db->limit($Limit);
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_page_table_join($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $where, $order, $select, $join_type)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->Join($table1, $JOIN);
        $this->db->Join($table2, $JOIN1);
        $this->db->Join($table3, $JOIN2, $join_type);
        $this->db->where($where);
        $this->db->order_by($order, "DESC");
        $query = $this->db->get();
        return $query->result();
    }

    public function join_two_table($table, $table1, $where, $JOIN, $select, $order)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN);
        $this->db->where($where);
        $this->db->order_by($order, 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function join_two_table_limit($table, $table1, $select, $JOIN, $order, $order_by, $Limit, $where)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->JOIN($table1, $JOIN);
        $this->db->where($where);
        $this->db->order_by($order, $order_by);
        if (!empty($Limit)) {
            $this->db->limit($Limit);
        }
        $query = $this->db->get();
        return $query->result();
    }

    public function count_user($table, $where, $select)
    {
        $this->db->select($select);
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        return $query->row();
    }

    function get_feed($table, $table1, $table2, $JOIN, $JOIN1, $Join_type, $select, $where)
    {
        $this->db->select($select);
        $this->db->from($table1);
        $this->db->JOIN($table, $JOIN);
        $this->db->JOIN($table2, $JOIN1, $Join_type);
        $this->db->where($where);
        $this->db->order_by('id', 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    function get_feed_result($table, $table1, $table2, $table3, $table4, $JOIN, $JOIN1, $JOIN2, $JOIN3, $Join_type, $select, $where)
    {
        $this->db->select($select);
        $this->db->from($table1);
        $this->db->JOIN($table, $JOIN);
        $this->db->JOIN($table2, $JOIN1, $Join_type);
        $this->db->JOIN($table3, $JOIN2, $Join_type);
        $this->db->JOIN($table4, $JOIN3, $Join_type);
        $this->db->where($where);
        $this->db->order_by('id', 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

}
