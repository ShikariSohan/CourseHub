<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sohan.mongodbtutorial.model.User"%>
<%@page import="sohan.mongodbtutorial.utils.StringArrays"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <!-- Header -->

   <jsp:include page="header.jsp" />

    <div class="mx-auto w-1/6">

<h1 class="font-sans text-3xl font-semibold leading-tight text-white tracking-normal  mt-2">Student List</h1>
</div>
    <!-- Content -->
    <div class="container mx-auto my-8">
        <div class="overflow-x-auto">
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
                                <a href="#" class="text-blue-500 hover:text-blue-700">Edit</a>
                                <a href="#" class="text-red-500 hover:text-red-700 ml-3">Delete</a>
                            </td>
                        </tr>
   <% } %>                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
