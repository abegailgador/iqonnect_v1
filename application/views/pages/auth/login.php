<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <h5 class="card-title"><?php echo $title; ?></h5>
        </div>
        <div class="card-body">
          <form action="<?php echo base_url('iqonnect')?>" method="POST">
            <div class="form-group">
              <label for="email" class="col-sm-2 col-form-label">Email</label>
              <input type="text" name="email" class="form-control">
              <small><?php echo form_error('email'); ?></small>
            </div>

            <div class="form-group">
              <label for="password" class="col-sm-2 col-form-label">Password</label>
              <input type="password" name="password" class="form-control">
              <small><?php echo form_error('password'); ?></small>
            </div>

            <br>
            <div class="form-group">
              <button type="submit" class="btn btn-primary">Login</button>
            </div>
          </form>
        </div>
      </div>
    </div>  
  </div>
</div>

<br><br><br>
<div class="container text-center">
  <div class="row">
    <div class="col-md-6 offset-md-3">
      <a href="#">Forgot Password</a>
    </div>
  </div>
</div>

<br><br><br>
<div class="container text-center">
  <div class="row">
    <div class="col-md-6 offset-md-3">
      <p>Don't have an account yet?</p>
      <a href="<?php echo base_url('user/usertype')?>">Sign Up</a>
    </div>
  </div>
</div>