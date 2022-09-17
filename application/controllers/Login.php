<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {
	public function view()
	{
		$page = "login";
		// $this->load->view('index');
		if ( ! file_exists(APPPATH.'views/pages/'.$page.'.php'))
		{
						// Whoops, we don't have a page for that!
						show_404();
		}

		$data['title'] = "Login Page";

		// $this->load->view('templates/header', $data);
		$this->load->database();
	  $this->load->view('pages/'.$page, $data);
		// $this->load->view('templates/footer', $data);
	}
}
