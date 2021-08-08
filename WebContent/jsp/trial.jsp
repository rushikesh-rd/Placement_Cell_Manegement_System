<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Form</title>
    <link rel="stylesheet" href="../css/contactus.css" />
    <script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div class="container">
      <span class="big-circle"></span>
      <img src="../imeges/shape.png" class="square" alt="" />
      <div class="form">
        <div class="contact-info">
          <h3 class="title">Let's get in touch</h3>
          <p class="text">If you don't ask, You don't get it.
          </p>

          <div class="info">
            <div class="information">
              <img src="../imeges/location.png" class="icon" alt="" />
              <p>Kothurud Pune, MH 411038</p>
            </div>
            <div class="information">
              <img src="../imeges/email.png" class="icon" alt="" />
              <p>help@pcell.com</p>
            </div>
            <div class="information">
              <img src="../imeges/phone.png" class="icon" alt="" />
              <p>123-456-789</p>
            </div>
          </div>

          <div class="social-media">
            <p>Connect with us :</p>
            <div class="social-icons">
              <a href="#">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#">
                <i class="fab fa-instagram"></i>
              </a>
              <a href="#">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
          </div>
        </div>

        <div class="contact-form">
          <span class="circle one"></span>
          <span class="circle two"></span>

          <form action="../ServletControler" method="post" autocomplete="off">
					<h3 class="title">Contact us</h3>
					<div class="input-container">
						<input type="text" name="ccname" class="input"/> <label
							for="">Name</label> <span>Username</span>
					</div>
					<div class="input-container">
						<input type="email" name="cemail" class="input" /> <label for="">Email</label>
						<span>Email</span>
					</div>
					<div class="input-container">
						<input type="tel" name="cphone" class="input" /> <label for="">Phone</label>
						<span>Phone</span>
					</div>
					<div class="input-container textarea">
						<textarea name="cmessage" class="input"></textarea>
						<label for="">Message</label> <span>Message</span>
					</div>
					<input type="submit" value="Send" class="btn" /> <input
						type="hidden" name="action" value="contactus">
				</form>
        </div>
      </div>
    </div>

    <script src="../js/contactus.js"></script>
  </body>
</html>