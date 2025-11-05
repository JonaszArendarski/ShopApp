<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Register — Online Shop</title>
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
    <section class="card" aria-labelledby="signup-title">
      <div class="card-side card-hero" aria-hidden="true">
        <div class="hero-text">
          <h2 id="signup-title">Create your account</h2>
          <p>Join us to enjoy fast checkout and order tracking.</p>
        </div>
      </div>

      <div class="card-side card-form">
        <form action="signUpAction.jsp" method="post" novalidate>
          <div class="form-group">
            <label for="name" class="sr-only">Name</label>
            <div class="input-wrap">
              <i class="fa-regular fa-user input-icon" aria-hidden="true"></i>
              <input id="name" type="text" name="name" placeholder="Name" required autocomplete="name">
            </div>
          </div>

          <div class="form-group">
            <label for="email" class="sr-only">Email</label>
            <div class="input-wrap">
              <i class="fa-regular fa-envelope input-icon" aria-hidden="true"></i>
              <input id="email" type="email" name="email" placeholder="Email" required autocomplete="email">
            </div>
          </div>

          <div class="form-group">
            <label for="phoneNum" class="sr-only">Phone Number</label>
            <div class="input-wrap">
              <i class="fa-solid fa-phone input-icon" aria-hidden="true"></i>
              <input id="phoneNum" type="tel" name="phoneNum" placeholder="Mobile Number" required autocomplete="tel">
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
            <label for="signup-password" class="sr-only">Password</label>
            <div class="input-wrap">
              <i class="fa-solid fa-lock input-icon" aria-hidden="true"></i>
              <input id="signup-password" type="password" name="password" placeholder="Password" required autocomplete="new-password">
              <button type="button" class="show-pass" aria-pressed="false" title="Show/Hidd password">
                <i class="fa-regular fa-eye" aria-hidden="true"></i>
              </button>
            </div>
          </div>

          <div class="form-actions">
            <button type="submit" class="btn-primary">Sign Up</button>
          </div>

          <div class="form-links">
            <a href="login.jsp" class="link">Login</a>
          </div>

          <div class="server-message" aria-live="polite">
            <%
              String msg = request.getParameter("msg");
              if ("valid".equals(msg)) {
            %>
              <div class="error" style="color:#065f46; background: rgba(16,185,129,0.06);">Register successfully.</div>
            <%
              } else if ("invalid".equals(msg)) {
            %>
              <div class="error">User with this email already exist , Login</div>
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
        var isPwd = input.type === 'password';
        input.type = isPwd ? 'text' : 'password';
        btn.setAttribute('aria-pressed', String(isPwd));
        if(icon){
          icon.classList.toggle('fa-eye', !isPwd);
          icon.classList.toggle('fa-eye-slash', isPwd);
          if(isPwd){
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
        if(btn) {
          togglePass(btn);
        }
      });
    })();
  </script>
</body>
</html>
