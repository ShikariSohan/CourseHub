<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Current Courses</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <style>
        .tab-btn {
            color: gray;
            padding: 1rem 1.5rem;
            display: block;
            justify-content: center;
            border-bottom: 2px solid white;
            font-weight: 500;
            cursor: pointer;
            transition: transform 0.2s ease-in-out;
            position: relative;
        }

        .tab-btn::after {
            content: "";
            display: block;
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 2px;
            background-color: #9e0031;
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.2s ease-in-out;
        }
        .tab-btn.current {
            font-weight: bold;
            color: #9e0031;
        }
        .tab-btn.current::after {
            transform: scaleX(1);
        }

        .tabcontent {
            display: none;
            background-color: #fff;
            padding: 1rem;
            border: 1px solid #e2e8f0;
            border-top: none;
        }
        #tab1 {
            display: block;
        }

        #tab2 {
            display: none;
        }

        .tab-btn.current[data-tab="tab1"] ~ #tab1,
        .tab-btn.current[data-tab="tab2"] ~ #tab2 {
            display: block;
        }
        @media (min-width: 768px) {
            .tabcontent:first-child {
                display: block;
            }
        }
    </style>
    <body>
        <jsp:include page="header.jsp" />
        <div class="w-full flex flex-col justify-center items-center">
            <div class="flex">
                <button class="tab-btn current" onclick="openTab(event,'tab1')">Active Courses</button>
                <button class="tab-btn" onclick="openTab(event,'tab2')">Archived Courses</button>
            </div>

            <div class="bg-gray-100 w-full">
                <div id="tab1" class="tabcontent">
                    <jsp:include page="activeCourseAdmin.jsp" />
                </div>
            </div>
            <div class="bg-gray-100 w-full">
                <div id="tab2" class="tabcontent">
                    <jsp:include page="archivedCourseAdmin.jsp" />
                </div>
            </div>

        </div>
<footer class="bg-white py-4">
      <div class="container mx-auto text-center">
        <p class="text-gray-500 text-sm">© 2023 CourseHub. All rights reserved.</p>
      </div>
    </footer>
        <script>
            function openTab(evt, tabName) {
                let i, tabcontent, tablinks;

//               Hide all tab content
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }

                // Remove 'current' class from all tab buttons
                tablinks = document.getElementsByClassName("tab-btn");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].classList.remove("current");
                }

                // Show the clicked tab content and set 'current' class on clicked tab button
                document.getElementById(tabName).style.display = "block";

                evt.currentTarget.classList.add("current");
                console.log({tab1: document.getElementById("tab1").style.display,tab2: document.getElementById("tab2").style.display})
            }
        </script>
    </body>
</html>
