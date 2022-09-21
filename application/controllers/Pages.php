<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends CI_Controller {
	public function view()
	{
		$page = "home";
		if ( ! file_exists(APPPATH.'views/pages/'.$page.'.php'))
		{
			show_404();
		}

		$data['title'] = "sample";

		$this->load->view('templates/header');
		// $this->load->database();
	  $this->load->view('pages/'.$page, $data);
		$this->load->view('templates/footer', $data);
	}

	function index(){
		//for students and faculty access
			if($this->session->userdata('level')==='1'){
					$this->load->view('auth/login');
			}else{
					echo "Access Denied";
			}

	}

	function admin(){
		//for admin access only
		if($this->session->userdata('level')==='2'){
			$this->load->view('auth/admin/login');
		}else{
				echo "Access Denied";
		}
	}
}
	