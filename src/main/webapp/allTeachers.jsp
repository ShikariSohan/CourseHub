<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sohan.mongodbtutorial.model.User"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teacher List</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <!-- Header -->
   <jsp:include page="header.jsp" />

    <div class="mx-auto w-1/6">

</div>
    <!-- Content -->
    <div class="container mx-auto my-8">
        <div class="overflow-x-auto">
            <div class="inline-block min-w-full rounded-lg overflow-hidden">
                <table class="min-w-full leading-normal">
                    <thead>
                        <tr>
                            <th class="px-5 py-3 bg-gray-800 text-left text-xs font-semibold text-white uppercase tracking-wider">Name</th>
                            <th class="px-5 py-3 bg-gray-800 text-left text-xs font-semibold text-white uppercase tracking-wider">Username</th>
                            <th class="px-5 py-3 bg-gray-800 text-left text-xs font-semibold text-white uppercase tracking-wider">Department</th>
                            <th class="px-5 py-3 bg-gray-800 text-left text-xs font-semibold text-white uppercase tracking-wider">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                  <% for ( User student :  (List<User>) request.getAttribute("teachers")) { %>
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
   <% } %>        </tbody>
                </table>
            </div>
        </div>
        <!-- Modal -->
        <div class="hidden fixed z-50 inset-0 overflow-y-auto" id="myModal">
            <div class="flex items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                <div class="fixed inset-0 transition-opacity" aria-hidden="true">
                    <div class="absolute inset-0 bg-gray-500 opacity-75 backdrop-filter backdrop-blur-sm"></div>
                </div>

                <!-- Modal content -->
                <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full" role="dialog" aria-modal="true" aria-labelledby="modal-headline">
                    <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                        <div class="sm:flex sm:items-start">
                            <div class="mx-auto flex-shrink-0 flex items-center justify-center h-12 w-12 rounded-full bg-rose-100 sm:mx-0 sm:h-10 sm:w-10">
                                <!-- Add your icon here -->
                            </div>
                            <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                                <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-headline">
                                    Are you sure to delete this account?
                                </h3>
                                <div class="mt-2">
                                    <p class="text-sm text-gray-500">
                                        You cannot undo this action.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                        <button type="button" data-dismiss="modal" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-green-600 text-base font-medium text-white hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 sm:ml-3 sm:w-auto sm:text-sm" onclick="DeleteId()">
                            DELETE
                        </button>
                        <button type="button" class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm" onclick="closeModal()">
                            Cancel
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        let id;
        function openModal(teacherId) {
            id = teacherId
            console.log({id})
            document.getElementById("myModal").classList.remove("hidden");
        }
        function DeleteId() {
            console.log({id});
            document.getElementById("myModal").classList.add("hidden");
             let xhr = new XMLHttpRequest();
             xhr.open('POST', '/coursehub/allteacher', true);
             xhr.setRequestHeader('Content-Type', 'application/json');
             xhr.onreadystatechange = function() {
                 if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                     location.reload(true);
                 }
             };
             xhr.send(id);
        }
        function closeModal() {
            document.getElementById("myModal").classList.add("hidden");
        }
    </script>
</body>
</html>
