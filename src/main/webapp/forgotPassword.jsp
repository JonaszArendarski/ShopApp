<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Reset Password — Online Shop</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">
  <link rel="stylesheet" href="design/loginDesign.css">
</head>
<body>
  <header class="main-header" role="banner">
    <div class="header-inner">
      <i class="fa-solid fa-bag-shopping" aria-hidden="true"></i>
      <h1 class="brand">Online Shop</h1>
    </div>
  </header>

  <main class="page-main" role="main">
    <section class="card" aria-labelledby="forgot-title">
      <div class="card-side card-hero" aria-hidden="true">
        <div class="hero-text">
          <h2 id="forgot-title">Reset Password</h2>
          <p>Please provide your details to reset your password – email, phone number, and answer to your security question.</p>
        </div>
      </div>

      <div class="card-side card-form">
        <form action="forgotPasswordAction.jsp" method="post" novalidate>
          <div class="form-group">
            <label for="email" class="sr-only">Email</label>
            <div class="input-wrap">
              <i class="fa-regular fa-envelope input-icon" aria-hidden="true"></i>
              <input id="email" type="email" name="email" placeholder="Email" required autocomplete="email">
            </div>
          </div>

          <div class="form-group">
            <label for="phone" class="sr-only">Phone Number</label>
            <div class="input-wrap">
              <i class="fa-solid fa-phone input-icon" aria-hidden="true"></i>
              <input id="phone" type="tel" name="number" placeholder="Phone Number" required autocomplete="tel">
            </div>
          </div>

          <div class="form-group">
            <label for="securityQuestion" class="sr-only">Security Question</label>
            <div class="input-wrap" style="position:static;">
              <select id="securityQuestion" name="securityQuestion" required style="width:100%; padding:12px 14px; border-radius:10px; border:1px solid #e6edf7; background:#fbfdff; font-size:15px;">
                <option value="What is the name of your pet?">What is the name of your pet?</option>
                <option value="What is your favorite sport?">What is your favorite sport?</option>
                <option value="What was your childhood best friend's name?">What was your childhood best friend's name?</option>
                <option value="What was your first car?">What was your first car?</option>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="answer" class="sr-only">Answer</label>
            <div class="input-wrap">
              <i class="fa-regular fa-comment input-icon" aria-hidden="true"></i>
              <input id="answer" type="text" name="answer" placeholder="Answer" required>
            </div>
          </div>

          <div class="form-group">
            <label for="newPassword" class="sr-only">New Password</label>
            <div class="input-wrap">
              <i class="fa-solid fa-lock input-icon" aria-hidden="true"></i>
              <input id="newPassword" type="password" name="newPassword" placeholder="New Password" required autocomplete="new-password">
              <button type="button" class="show-pass" aria-pressed="false" title="Show/Hidd Password">
                <i class="fa-regular fa-eye" aria-hidden="true"></i>
              </button>
            </div>
          </div>

          <div class="form-actions">
            <button type="submit" class="btn-primary">Save</button>
          </div>

          <div class="form-links">
            <a href="login.jsp" class="link">Login</a>
            <a href="signUp.jsp" class="link">Sign Up</a>
          </div>

          <div class="server-message" aria-live="polite">
            <%
              String msg = request.getParameter("msg");
              if ("done".equals(msg)) {
            %>
              <div class="success">Password Changed Successfully</div>
            <%
              } else if ("wrong".equals(msg)) {
            %>
              <div class="error">Incorrect email , Phone Number or answer</div>
            <%
              }
            %>
          </div>
        </form>
      </div>
    </section>
  </main>
  <script>
    (function(){
      function togglePass(btn){
        var wrap = btn.closest('.input-wrap');
        if(!wrap) return;
        var input = wrap.querySelector('input[type="password"], input[type="text"]');
        if(!input) return;
        var icon = btn.querySelector('i');
        var wasPwd = input.type === 'password';
        input.type = wasPwd ? 'text' : 'password';
        btn.setAttribute('aria-pressed', String(wasPwd));
        if(icon){
          if(wasPwd){
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
          } else {
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
          }
        }
      }

      document.addEventListener('click', function(e){
        var btn = e.target.closest('.show-pass');
        if(btn) togglePass(btn);
      });
    })();
  </script>
</body>
</html>
