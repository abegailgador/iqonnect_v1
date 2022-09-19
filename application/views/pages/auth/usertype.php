<div class="container">
  <div class="row">
    <div class="col-md-12">
      <h5 class="card-title"><?php echo $title; ?></h5>

      <form action="<?php echo base_url('user/signup/student')?>" method="POST">
        <div class="form-check">
          <input class="form-check-input" type="radio" name="user_type" id="student" checked>
          <label class="form-check-label" for="student">
            Student
          </label>
        </div>
        
        <div class="form-check">
          <input class="form-check-input" type="radio" name="user_type" id="instructor">
          <label class="form-check-label" for="instructor">
            Instructor
          </label>
        </div>

        <div class="form-group">
          <button type="submit" class="btn btn-primary">Proceed</button>
        </div>
      </form>
    </div>  
  </div>
</div>
