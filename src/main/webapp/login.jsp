<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Login — Online Shop</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="" crossorigin="anonymous">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/design/loginDesign.css">
</head>
<body>
  <header class="main-header" role="banner">
    <div class="header-inner">
      <i class="fa-solid fa-bag-shopping" aria-hidden="true"></i>
      <h1 class="brand">Online Shop</h1>
    </div>
  </header>

  <main class="page-main" role="main">
    <section class="card" aria-labelledby="login-title">
      <div class="card-side card-hero" aria-hidden="true">
        <div class="hero-text">
          <h2 id="login-title">Welcome Back!</h2>
          <p>Log in to continue shopping and manage your account.</p>
        </div>
      </div>

      <div class="card-side card-form">
        <form action="loginAction.jsp" method="post" novalidate>
          <div class="form-group">
            <label for="email" class="sr-only">Email</label>
            <div class="input-wrap">
              <i class="fa-regular fa-envelope input-icon" aria-hidden="true"></i>
              <input id="email" type="email" name="email" placeholder="Email" required autocomplete="email">
            </div>
          </div>

          <div class="form-group">
  <label for="password" class="sr-only">Password</label>
  <div class="input-wrap">
    <i class="fa-solid fa-lock input-icon" aria-hidden="true"></i>
    <input id="password" type="password" name="password" placeholder="Password" required autocomplete="current-password">
    <button type="button" class="show-pass" aria-pressed="false" title="Show/hidde password">
      <i class="fa-regular fa-eye" aria-hidden="true"></i>
    </button>
  </div>
</div>

          <div class="form-actions">
            <button type="submit" class="btn-primary">Login</button>
          </div>

          <div class="form-links">
            <a href="signUp.jsp" class="link">Sign Up</a>
            <a href="forgotPassword.jsp" class="link">Forgot Password?</a>
          </div>

          <div class="server-message" aria-live="polite">
            <%
              String msg = request.getParameter("msg");
              if ("notexist".equals(msg)) {
            %>
              <div class="error">User already exists</div>
            <%
              } else if ("invalid".equals(msg)) {
            %>
              <div class="warning">Something went wrong</div>
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
