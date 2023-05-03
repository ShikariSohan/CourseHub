
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="sohan.mongodbtutorial.model.Course"%>
<%@page import="sohan.mongodbtutorial.model.User"%>
<%@page import="sohan.mongodbtutorial.utils.StringArrays"%>
<%@page import="java.util.List" %>
<html>
<head>
    <meta charset="UTF-8">
  	<title>Course List</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<jsp:include page="header.jsp" />

 <%
      Course course = (Course) request.getAttribute("course");
  %>
    <div class="bg-red-100 rounded-lg shadow-md p-4 mt-3">
      <h1 class="text-lg font-bold mb-2">Course Details : </h2>
      <h2 class="text-lg font-bold mb-2"><%= course.getName() %></h2>
      <p class="text-gray-600 text-sm mb-2"><%= course.getCourseCode() %></p>
      <p class="text-gray-600 text-sm">Taught by <%= course.getTeacher() %></p>
    </div>

    <%-- Table From all students page --%>
       <div class="inline-block min-w-full rounded-lg overflow-hidden">
                    <table class="min-w-full leading-normal">
                        <thead>
                            <tr>
                                <th class="px-5 py-3 bg-gray-800 text-left text-xs font-semibold text-white uppercase tracking-wider">Name</th>
                                <th class="px-5 py-3 bg-gray-800 text-left text-xs font-semibold text-white uppercase tracking-wider">Registration No.</th>
                                <th class="px-5 py-3 bg-gray-800 text-left text-xs font-semibold text-white uppercase tracking-wider">Department</th>
                                <th class="px-5 py-3 bg-gray-800 text-left text-xs font-semibold text-white uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                      <% for ( User student :  (List<User>) request.getAttribute("students")) { %>
                            <tr>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <div class="flex items-center">
                                        <div class="ml-3">
                                            <p class="text-gray-900 whitespace-no-wrap"><%= student.getName() %></p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-gray-900 whitespace-no-wrap"><%= student.getUsername() %></p>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-gray-900 whitespace-no-wrap"><%= student.getDept() %></p>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <button class=" hover:bg-red-200 text-white font-bold py-2 px-4 rounded" onclick="openModal('<%= student.getId()%>')">
                                        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"><style>@keyframes rotate-tr{0%{transform:rotate(0)}to{transform:rotate(20deg)}}</style><path fill="#0A0A30" d="M16.773 10.083a.75.75 0 00-1.49-.166l1.49.166zm-1.535 7.027l.745.083-.745-.083zm-6.198 0l-.745.083.745-.083zm-.045-7.193a.75.75 0 00-1.49.166l1.49-.166zm5.249 7.333h-4.21v1.5h4.21v-1.5zm1.038-7.333l-.79 7.11 1.491.166.79-7.11-1.49-.166zm-5.497 7.11l-.79-7.11-1.49.166.79 7.11 1.49-.165zm.249.223a.25.25 0 01-.249-.222l-1.49.165a1.75 1.75 0 001.739 1.557v-1.5zm4.21 1.5c.892 0 1.64-.67 1.74-1.557l-1.492-.165a.25.25 0 01-.248.222v1.5z"/><path fill="#9e0031" fill-rule="evenodd" d="M11 6a1 1 0 00-1 1v.25H7a.75.75 0 000 1.5h10a.75.75 0 000-1.5h-3V7a1 1 0 00-1-1h-2z" clip-rule="evenodd" style="animation:rotate-tr 1s cubic-bezier(1,-.28,.01,1.13) infinite alternate-reverse both;transform-origin:right center"/></svg>
                                    </button>
                                </td>
                            </tr>
       <% } %>                    </tbody>
                    </table>
                </div>

</body>
</html>
