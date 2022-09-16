<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends CI_Controller {
	public function view()
	{
		$page = "home";
		// $this->load->view('index');
		if ( ! file_exists(APPPATH.'views/pages/'.$page.'.php'))
		{
						// Whoops, we don't have a page for that!
						show_404();
		}

		$data['title'] = "Welcome to Mobile Legends";

		// $this->load->view('templates/header', $data);
		$this->load->database();
	  $this->load->view('pages/'.$page, $data);
		// $this->load->view('templates/footer', $data);
	}
}
