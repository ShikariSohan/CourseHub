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
<nav id="header" class="fixed w-full z-30 top-0 text-white bg-gray-700">
  <div class="w-full container mx-auto flex flex-wrap items-center justify-center mt-0 py-2">
    <div class="pl-4 flex items-center">
      <a class="toggleColour text-white no-underline hover:no-underline font-bold text-2xl lg:text-4xl" href="/coursehub">
        <svg class="h-12 fill-current inline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
          <image href="./book.svg" x="0" y="0" width="100%" height="100%" />
        </svg>
        CourseHub
      </a>
    </div>
  </div>
  <hr class="border-b border-gray-100 opacity-25 my-0 py-0" />
</nav>
<div class="min-h-screen flex items-center justify-center bg-gray-100 mt-[-2rem]">
  <div class="max-w-md w-full bg-white shadow-lg rounded-lg p-8">
    <h1 class="text-2xl font-bold mb-6">Login</h1>

    <form action="/coursehub/login" method="post">
      <div class="mb-4">
        <%
          String error = request.getParameter("error");
          if (error != null && error.equals("1")) {
        %>
        <p class="text-red-500">Invalid username or password</p>
        <% } %>

        <label for="username" class="block text-gray-700 font-bold mb-2">Username</label>
        <input name="username" id="username" class="w-full border border-gray-300 p-2 rounded-lg" required>
      </div>

      <div class="mb-6">
        <label for="password" class="block text-gray-700 font-bold mb-2">Password</label>
        <input type="password" name="password" id="password" class="w-full border border-gray-300 p-2 rounded-lg" required>
      </div>

      <div class="flex items-center justify-between">
        <button type="submit" class="bg-red-900 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
          Login
        </button>
      </div>
    </form>
  </div>
</div>
<footer class="bg-white mt-[-5rem]">
  <div class="container mx-auto px-8">
    <div class="w-full flex flex-col md:flex-row py-6">
      <div class="flex-1 mb-6 text-black">
        <a class="text-pink-600 no-underline hover:no-underline font-bold text-2xl lg:text-4xl" href="#">
            <svg class="h-12 fill-current inline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
              <image href="./book.svg" x="0" y="0" width="100%" height="100%" />
            </svg>
            CourseHub
        </a>
          <div class="container mx-auto text-center">
            <p>Copyright &#169; 2023 CourseHub</p>
          </div>
      </div>
    </div>
  </div>
</footer>
</body>
</html>
