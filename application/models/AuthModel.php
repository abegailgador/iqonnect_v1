<?php

class AuthModel extends CI_Model {
  public function getUsers() {
    $query = $this->db->get('users');
    return $query->result();
  }

  public function getStudents() {
    $query = $this->db->query("SELECT student.student_id, student.email_address, student.first_name, student.last_name FROM Users INNER JOIN Student ON users.student_id=student.student_id");
    return $query->result();
  }
}  