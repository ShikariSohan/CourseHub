<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="min-h-screen flex items-center justify-center">
  <div class="max-w-md w-full bg-white shadow-lg rounded-lg p-8">
    <h1 class="text-2xl font-bold mb-6">Login</h1>

    <form action="/coursehub/login" method="post">
      <div class="mb-4">
      <%
      String error = request.getParameter("error");
      System.out.println("drddrdtgdtgddr");
      if (error != null && error.equals("1")) {
      %>
          <p class="text-rose-400">Invalid username or password</p>
      <%
      }
      %>

        <label for="email" class="block text-gray-700 font-bold mb-2">Username</label>
        <input name="username" id="email" class="w-full border border-gray-300 p-2 rounded-lg" required>
      </div>
      <div class="mb-6">
        <label for="password" class="block text-gray-700 font-bold mb-2">Password</label>
        <input type="password" name="password" id="password" class="w-full border border-gray-300 p-2 rounded-lg" required>
      </div>
      <div class="flex items-center justify-between">
        <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
          Login
        </button>
        <a href="#" class="text-gray-600 hover:text-gray-800">Forgot Password?</a>
      </div>
    </form>
  </div>
</div>
</body>
</html>
