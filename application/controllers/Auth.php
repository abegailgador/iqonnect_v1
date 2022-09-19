<?php
  defined('BASEPATH') OR exit('No direct script access allowed');

  class Auth extends CI_Controller {
    public function index()
    {
      $data['title'] = "iQonnect Login";

      $this->load->view('templates/header');
      $this->load->view('pages/auth/login', $data);
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

    public function signup() 
    {
      $data['title'] = "Sign Up Page";

      $this->load->view('templates/header');
      $this->load->view('pages/auth/signup', $data);
      $this->load->view('templates/footer');
    }

    public function usertype()
    {
      $data['title'] = "What are you??";

      $this->load->view('templates/header');
      $this->load->view('pages/auth/signup', $data);
      $this->load->view('templates/footer');
      // $this->form_validation->set_rules('email', 'Email', 'required');
      // $this->form_validation->set_rules('password', 'Password', 'required');

      // if ($this->form_validation->run()) {
      //   $data = [
      //     'email' => $this->input->post('email'),
      //     'password' => $this->input->post('password'),
      //   ];
      // }
      // else {
      //   $this->index();
      // }
    }
    
    // public function signup($user_type="")
    // {
    //   $data['user_type'] = $this->usertype();

    //   echo $data;
    //   // $this->form_validation->set_rules('email', 'Email', 'required');
    //   // $this->form_validation->set_rules('password', 'Password', 'required');

    //   // if ($this->form_validation->run()) {
    //   //   $data = [
    //   //     'email' => $this->input->post('email'),
    //   //     'password' => $this->input->post('password'),
    //   //   ];
    //   // }
    //   // else {
    //   //   $this->index();
    //   // }
    // }
  }