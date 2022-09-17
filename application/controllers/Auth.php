<?php
  defined('BASEPATH') OR exit('No direct script access allowed');

  class Auth extends CI_Controller {
    public function index()
    {
      $data['title'] = "iQonnect";

      $this->load->view('templates/header');
      $this->load->view('pages/login', $data);
      $this->load->view('templates/footer');
    }

    public function login()
    {
      $this->form_validation->set_rules('email', 'Email', 'required');
      $this->form_validation->set_rules('password', 'Password', 'required');

      if ($this->form_validation->run()) {
        $data = [
          'email' => $this->input->post('email'),
          'password' => $this->input->post('password'),
        ];
      }
      else {
        $this->index();
      }
    }
  }