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
  <title>Student Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body>
    <jsp:include page="header.jsp" />


    <div class="w-full flex flex-col justify-center items-center">
     <%-- Error Message --%>
      <%
           String error = request.getParameter("q");
           System.out.println("drddrdtgdtgddr");
           if (error != null && error.equals("2")) {
           %>
             <div class="fixed bottom-2 right-2 z-50">
                 <div role="alert" class="relative">
                     <div class="bg-red-500 text-white font-bold rounded-t px-4 py-2">
                         <div class="flex justify-content">
                             <text class="mr-auto">Error</text>
                             <button type="button" class="ml-auto" onclick="closeError(this)">
                                 <svg class="h-6 w-6 text-white" viewBox="0 0 20 20" fill="currentColor">
                                     <path fill-rule="evenodd" d="M17.707 3.293a1 1 0 00-1.414 0L10 8.586 4.707 3.293a1 1 0 00-1.414 1.414L8.586 10l-5.293 5.293a1 1 0 000 1.414 1 1 0 001.414 0L10 11.414l5.293 5.293a1 1 0 001.414-1.414L11.414 10l5.293-5.293a1 1 0 000-1.414z" clip-rule="evenodd" />
                                 </svg>
                             </button>
                         </div>

                     </div>
                     <div class="border border-t-0 border-red-400 rounded-b bg-red-100 px-4 py-3 text-red-700">
                         <p>It is not a valid course code.</p>
                     </div>
                 </div>
             </div>
         <%
           }
           %>

     <%-- Success Message --%>
       <%
            if (error != null && error.equals("1")) {
            %>
         <div class="fixed bottom-2 right-2 z-50">
             <div role="alert" class="relative">
                 <div class="bg-green-500 text-white font-bold rounded-t px-4 py-2">
                     <div class="flex justify-content">
                         <text class="mr-auto">Success!</text>
                         <button type="button" class="ml-auto" onclick="closeError(this)">
                             <svg class="h-6 w-6 text-white" viewBox="0 0 20 20" fill="currentColor">
                                 <path fill-rule="evenodd" d="M17.707 3.293a1 1 0 00-1.414 0L10 8.586 4.707 3.293a1 1 0 00-1.414 1.414L8.586 10l-5.293 5.293a1 1 0 000 1.414 1 1 0 001.414 0L10 11.414l5.293 5.293a1 1 0 001.414-1.414L11.414 10l5.293-5.293a1 1 0 000-1.414z" clip-rule="evenodd" />
                             </svg>
                         </button>
                     </div>

                 </div>
                 <div class="border border-t-0 border-green-400 rounded-b bg-green-100 px-4 py-3 text-green-700">
                     <p>You have successfully joined the course.</p>
                 </div>
             </div>
         </div>
            <%
            }
            %>


      <button class="bg-gray-800 text-white font-bold py-1 px-4 my-2 rounded ml-auto mx-2" onclick="openModalCourse()">
        <div class="flex justify-center items-center">
          <text>Join a Course</text>
          <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="none">
            <style>@keyframes slide-5{to{transform:translateX(2px)}}</style>
            <g style="animation:slide-5 1s infinite alternate both cubic-bezier(1,-.01,0,.98)">
              <path fill="#5877d6" d="M7.666 12.75a.75.75 0 010-1.5v1.5zm4.09-1.5h.75v1.5h-.75v-1.5zm-4.09 0h4.09v1.5h-4.09v-1.5z"/>
              <path stroke="#FFFFFF" stroke-width="1.5" d="M16.438 11.614l-2.87-2.144a.476.476 0 00-.762.382l.012 4.296a.479.479 0 00.766.382l2.857-2.153a.477.477 0 00-.003-.763z"/>
            </g>
          </svg></div>

      </button>
      <%
         List<Course> courses = (List<Course>)request.getAttribute("courses");
         if(courses.isEmpty()) {
      %>
         <div class="flex items-center justify-center">
             <div class="text-center">
                 <svg class="h-24 w-24 text-gray-400 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                     <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 20l4-16m2 16l4-16M6 9h14M4 15h14"/>
                 </svg>
                 <h2 class="mt-2 text-lg font-bold text-gray-900">No Courses Available</h2>
                 <p class="mt-1 text-gray-500">Sorry, there are no courses available to display.</p>
             </div>
         </div>
      <%
         } else {
      %>
          <jsp:include page="allCourseStudent.jsp" />
          <%
             }
          %>
    </div>
    <%--modal--%>
    <div class="hidden fixed z-50 inset-0 overflow-y-auto" id="joinCourse">
      <div class="flex items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
        <div class="fixed inset-0 transition-opacity" aria-hidden="true">
          <div class="absolute inset-0 bg-gray-500 opacity-75 backdrop-filter backdrop-blur-sm"></div>
        </div>

        <!-- Modal content -->
        <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full" role="dialog" aria-modal="true" aria-labelledby="modal-headline">
          <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-headline">
                  Enter the code of the course that you want to join.
                </h3>
                <form  action="/coursehub/dashboard" method="POST">
                    <input class="mt-2 shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight leading-tight focus:outline-none focus:border-blue-500"
                           id="courseCode"
                           type="text"
                           placeholder="Enter course code"
                           name="courseCode" required/>
                  <p class="text-xs text-gray-500 mt-2">Get the code from your teacher.</p>
                  <div class="px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                    <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline m-2"
                            type="submit">
                      Join Course
                    </button>
                    <button class="font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline m-2" onclick="closeModalCourse()">
                      Cancel
                    </button>
                  </div>
                </form>


              </div>
          </div>

      </div>
    </div>
    <footer class="bg-white py-4">
      <div class="container mx-auto text-center">
        <p class="text-gray-500 text-sm">© 2023 CourseHub. All rights reserved.</p>
      </div>
    </footer>

    <script>
      function openModalCourse() {
        document.getElementById("joinCourse").classList.remove("hidden");
      }
      function closeModalCourse() {
        document.getElementById("joinCourse").classList.add("hidden");
      }
      function closeError(errorBox) {
          errorBox.parentNode.parentNode.parentNode.parentNode.removeChild(errorBox.parentNode.parentNode.parentNode);
          window.location.href = "http://localhost:8080/coursehub/dashboard";
      }
    </script>
  </body>

</html>
