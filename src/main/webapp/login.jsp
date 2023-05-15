<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body >
<div class="min-h-screen flex items-center justify-center bg-gray-100 mt-[-2rem]">
  <div class="max-w-md w-full bg-white shadow-lg rounded-lg p-8 flex flex-col justify-center item-center">
      <svg class="h-12 fill-current inline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
        <image href="./owl.png" x="0" y="0" width="100%" height="100%" />
      </svg>
    <form action="/coursehub/login" method="post">

      <div class="mb-4">
        <%
          String error = request.getParameter("error");
          if (error != null && error.equals("1")) {
        %>
        <p class="text-red-500">Invalid username or password</p>
        <% } %>

        <label for="username" class="block text-gray-700 font-bold mb-2">Username/Reg. no.</label>
        <input name="username" id="username" class="w-full border border-gray-300 p-2 rounded-lg" required>
      </div>

      <div class="mb-6">
        <label for="password" class="block text-gray-700 font-bold mb-2">Password</label>
        <input type="password" name="password" id="password" class="w-full border border-gray-300 p-2 rounded-lg" required>
      </div>

      <div class="flex items-center justify-between w-full">
        <button type="submit" class="bg-red-900 hover:bg-red-700 text-white font-bold py-2 px-4 rounded w-full h-9">
          Login
        </button>
      </div>
      <div class="text-center mt-6">
        <p class="mt-4 text-sm">Do not have an account? <span class="underline cursor-pointer"> <a href="/coursehub/register">Sign Up </a></span>
        </p>
      </div>
    </form>
  </div>
</div>
<footer class="bg-gray-100 mt-[-5rem]">
  <div class="container mx-auto px-8">
    <div class="w-full flex flex-col md:flex-row py-6">
      <div class="flex-1 mb-6 text-black">
          <div class="container mx-auto text-center">
            <p>Copyright &#169; 2023 CourseHub</p>
          </div>
      </div>
    </div>
  </div>
</footer>
</body>
</html>
