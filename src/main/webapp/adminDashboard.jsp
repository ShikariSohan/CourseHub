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

<body>
    <jsp:include page="header.jsp" />
    <!-- Content -->
    <div class="container mx-auto my-8">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <!-- Total Students -->
            <div class="bg-white shadow rounded-lg p-6">
                <div class="text-gray-500 text-sm uppercase mb-2">Total Students</div>
                <div class="text-3xl font-bold"><%= request.getAttribute("totalStudents") %></div>
            </div>

            <!-- Total Teachers -->
            <div class="bg-white shadow rounded-lg p-6">
                <div class="text-gray-500 text-sm uppercase mb-2">Total Teachers</div>
                <div class="text-3xl font-bold"><%= request.getAttribute("totalTeachers") %></div>
            </div>

            <!-- Running Courses -->
            <div class="bg-white shadow rounded-lg p-6">
                <div class="text-gray-500 text-sm uppercase mb-2">Running Courses</div>
                <div class="text-3xl font-bold"><%= request.getAttribute("runningCourses") %></div>
            </div>

            <!-- Total Courses -->
            <div class="bg-white shadow rounded-lg p-6">
                <div class="text-gray-500 text-sm uppercase mb-2">Total Courses</div>
                <div class="text-3xl font-bold"><%= request.getAttribute("totalCourses") %></div>
            </div>
        </div>

            <%-- stepper--%>
        <div class="p-5">
            <div class="mx-4 p-4">
                <div class="flex items-center">

                    <div class="flex items-center relative text-red-900">
                        <a href="/coursehub/allstudent">
                            <div class="rounded-full transition duration-500 ease-in-out h-12 w-12 py-3 border-2 border-red-800">
                                <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users">
                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                </svg>
                            </div>
                        </a>
                        <div class="absolute top-0 -ml-10 text-center mt-16 w-32 text-xs font-medium uppercase text-red-800">Student List</div>
                    </div>


                    <div class="flex-auto border-t-2 transition duration-500 ease-in-out border-red-800"></div>

                    <div class="flex items-center text-white relative">
                        <a href="/coursehub/allteacher">
                            <div class="rounded-full transition duration-500 ease-in-out h-12 w-12 py-3 border-2 bg-red-900 border-red-900">
                                <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users">
                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                    <path d="M23 21H1"></path>
                                </svg>

                            </div>
                        </a>
                        <div class="absolute top-0 -ml-10 text-center mt-16 w-32 text-xs font-medium uppercase text-red-800">Teacher List</div>
                    </div>



                    <div class="flex-auto border-t-2 transition duration-500 ease-in-out border-red-800"></div>

                    <div class="flex items-center relative text-red-900">
                        <a href="/coursehub/currentcourses">
                            <div class="rounded-full transition duration-500 ease-in-out h-12 w-12 py-3 border-2 border-red-800">
                                <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 6a2.5 2.5 0 0 1 2.5-2.5h11v14H6.5V6z"></path>
                                </svg>

                            </div>
                        </a>
                        <div class="absolute top-0 -ml-10 text-center mt-16 w-32 text-xs font-medium uppercase text-red-800">Course List</div>
                    </div>

                    <div class="flex-auto border-t-2 transition duration-500 ease-in-out border-red-800"></div>

                    <div class="flex items-center text-white relative">
                        <a href="/coursehub/createcourse">
                            <div class="rounded-full transition duration-500 ease-in-out h-12 w-12 py-3 border-2 bg-red-900 border-red-900">
                                <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <line x1="12" y1="8" x2="12" y2="16"></line>
                                    <line x1="8" y1="12" x2="16" y2="12"></line>
                                </svg>

                            </div>
                        </a>
                        <div class="absolute top-0 -ml-10 text-center mt-16 w-32 text-xs font-medium uppercase text-red-800">Create New Course</div>
                    </div>

                </div>
            </div>

        </div>

        <div class="flex flex-col">
            <div class="flex-1 mb-8">
                <h2 class="text-2xl font-bold my-8">New Courses</h2>
                <table class="min-w-full divide-y divide-gray-200 rounded-lg">
                    <thead class="bg-gray-50">
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
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Registration No</th>
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
                </table>
            </div>
        </div>
    </div>

</body>
</html>
