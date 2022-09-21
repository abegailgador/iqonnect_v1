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
      $this->load->database;
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


    public function updatepassword()
    {
      $data ['title'] = 'Update Password';

      $this->load->view('templates/header');
      $this->load->view('pages/auth/updatepassword',$data);
      $this->load->view('templates/footer');
    }



    public function sendEmail() 
    {
      $this->load->model("AuthModel");
      $data = $this->AuthModel->getStudents();

      $config = array(
        'useragent' => 'CodeIgniter',
        'protocol' => 'mail',
        'mailpath' => '/usr/sbin/sendmail',
        'smtp_host' => 'smtp.gmail.com',
        'smtp_user' => 'gdrabby1234@gmail.com',
        'smtp_pass' => 'abby1234gmailpass',
        'smtp_port' => 465,
        'smtp_timeout' => 60,
        'smtp_keepalive' => false,
        'smtp_crypto' => 'ssl',
        'wordwrap' => true,
        'wrapchars' => 76,
        'mailtype' => 'html',
        'charset' => 'utf-8',
        'validate' => false,
        'priority' => 3,
        'crlf' => "\r\n",
        'newline' => "\r\n",
        'bcc_batch_mode' => false,
        'bcc_batch_size' => 200,
      );

      
      
      foreach($data as $student) { 
        $this->load->library('email', $config);
        $this->email->set_newline("\r\n");
        $this->email->from('agador_ccs@uspf.edu.ph','USPF IT Admin');
        $this->email->to($student->email_address);
        $this->email->subject('ACTIVATE YOUR IQONNECT NOW'. $student->first_name);
        $this->email->message('Hi '.$student->first_name.' Welcome to University of Southern Philippines Foundation!

          To access your iQonnect: USPF Messaging App access, kindly click the link below to activate your account now.


          Once again, we welcome you to be part of USPian Community. Stay safe, co-Panther!

          Best regards,

          USPF IT Admin');
        $this->email->set_mailtype('html');

        if($this->email->send())
        {
          echo 'Email sent to ' . $student->email_address . '<br>';
        }
        else{
          echo 'Something went wrong ';
        }
       
        
        
        
      }
      
      // $this->email->to($emailaddress);
      // $this->load->library('email', $config);
      // $this->email->set_newline("\r\n");
      // $this->email->from('agador_ccs@uspf.edu.ph','USPF IT Admin');
      // $this >email->to($data['uEmail']);
      // $this->email->subject('ACTIVATE YOUR IQONNECT NOW'.$name);
      // $this->email->message('Hi '.$name.' Welcome to University of Southern Philippines Foundation!

      //   To access your iQonnect: USPF Messaging App access, kindly click the link below to activate your account now.


      //   Once again, we welcome you to be part of USPian Community. Stay safe, co-Panther!

      //   Best regards,

      //   USPF IT Admin');
      // $this->email->send();
    }
  }

?>