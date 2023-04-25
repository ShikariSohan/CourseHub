<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="sohan.mongodbtutorial.model.User"%>
<%@page import="sohan.mongodbtutorial.model.Course"%>
<%@page import="sohan.mongodbtutorial.utils.StringArrays"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class=" bg-purple-500">
<jsp:include page="header.jsp" />


    <!-- Content -->
    <div class="container mx-auto my-8">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <!-- Total Students -->
            <div class="bg-white shadow rounded-lg p-6">
                <div class="text-gray-500 text-sm uppercase mb-2">Total Students</div>
                <div class="text-3xl font-bold">1,000</div>
            </div>

            <!-- Total Teachers -->
            <div class="bg-white shadow rounded-lg p-6">
                <div class="text-gray-500 text-sm uppercase mb-2">Total Teachers</div>
                <div class="text-3xl font-bold">100</div>
            </div>

            <!-- Running Courses -->
            <div class="bg-white shadow rounded-lg p-6">
                <div class="text-gray-500 text-sm uppercase mb-2">Running Courses</div>
                <div class="text-3xl font-bold">50</div>
            </div>

            <!-- Total Courses -->
            <div class="bg-white shadow rounded-lg p-6">
                <div class="text-gray-500 text-sm uppercase mb-2">Total Courses</div>
                <div class="text-3xl font-bold"><%= request.getAttribute("totalCourses") %></div>
            </div>
        </div>

        <div class="mt-8">
            <!-- See Student List -->
            <a href="/coursehub/allstudent" class="inline-block bg-gray-800 hover:bg-gray-900 text-white py-2 px-4 rounded">See Student List</a>
   <!-- See Teacher List -->
            <a href="/coursehub/allteacher" class="inline-block bg-gray-800 hover:bg-gray-900 text-white py-2 px-4 rounded">See Teacher List</a>

            <!-- See Current Course List -->
            <a href="/coursehub/currentcourses" class="inline-block bg-gray-800 hover:bg-gray-900 text-white py-2 px-4 rounded ml-4">See Current Course List</a>

            <!-- See Archive Course List -->
            <a href="#" class="inline-block bg-gray-800 hover:bg-gray-900 text-white py-2 px-4 rounded ml-4">See Archive Course List</a>

            <!-- Create New Course -->
            <a href="/coursehub/createcourse" class="inline-block bg-green-500 hover:bg-green-600 text-white py-2 px-4 rounded ml-4">Create New Course</a>
        </div>






        <div class="flex flex-col">
          <div class="flex-1 mb-8">
             <h2 class="text-2xl font-bold my-8">New Courses</h2>
                      <table class="min-w-full divide-y divide-gray-200 rounded-lg">
                        <thead class="bg-gray-50">
                          <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Course ID</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Course Name</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Assigned Teacher</th>
                          </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                           <% for ( Course course :  (List<Course>) request.getAttribute("courses")) { %>
                          <tr>
                            <td class="px-6 py-4 whitespace-nowrap"><%= course.getCourseCode() %></td>
                            <td class="px-6 py-4 whitespace-nowrap"><%= course.getName() %></td>
                            <td class="px-6 py-4 whitespace-nowrap"><%= course.getTeacher() %></td>
                          </tr>
                             <% } %>
                        </tbody>
                      </table>
          </div>
 <div class="flex-1">
             <table class="min-w-full divide-y divide-gray-200 rounded-lg">
                     <h2 class="text-2xl font-bold my-8">New Students</h2>
                      <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                          <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Username</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Dept</th>
                          </tr>
                        </thead>
                      <% for ( User student :  (List<User>) request.getAttribute("students")) { %>
                        <tbody class="bg-white divide-y divide-gray-200">
                          <tr>
                            <td class="px-6 py-4 whitespace-nowrap"><%= student.getName() %></td>
                            <td class="px-6 py-4 whitespace-nowrap"><%= student.getUsername() %></td>
                            <td class="px-6 py-4 whitespace-nowrap"><%= student.getDept() %></td>
                          </tr>
                        <% } %>
                          <tr>
                        </tbody>
                      </table>
           </div>
          <div class="flex-1">
            <table class="min-w-full divide-y divide-gray-200 rounded-lg">
                    <h2 class="text-2xl font-bold my-8">New Teachers</h2>
                     <table class="min-w-full divide-y divide-gray-200">
                       <thead class="bg-gray-50">
                         <tr>
                           <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                           <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Username</th>
                           <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Dept</th>
                         </tr>
                       </thead>
                     <% for ( User student :  (List<User>) request.getAttribute("teachers")) { %>
                       <tbody class="bg-white divide-y divide-gray-200">
                         <tr>
                           <td class="px-6 py-4 whitespace-nowrap"><%= student.getName() %></td>
                           <td class="px-6 py-4 whitespace-nowrap"><%= student.getUsername() %></td>
                           <td class="px-6 py-4 whitespace-nowrap"><%= student.getDept() %></td>
                         </tr>
                       <% } %>
                         <tr>
                       </tbody>
                     </table>
          </div>
        </div>


    </div>
</body>
</html>
