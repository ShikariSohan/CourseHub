<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--    <head>--%>
<%--        <meta charset="UTF-8">--%>
<%--        <title>Register</title>--%>
<%--        <script src="https://cdn.tailwindcss.com"></script>--%>
<%--    </head>--%>
<%--    <script>--%>
<%--        let isDiv2Visible = false; // Keep track of whether div2 is currently visible--%>

<%--        function replaceDivs() {--%>
<%--          const div1 = document.getElementById('div1');--%>
<%--          const div2 = document.getElementById('div2');--%>

<%--          if (isDiv2Visible) {--%>
<%--            // Fade out div2--%>
<%--            div2.style.opacity = '0';--%>
<%--            div2.style.pointerEvents = 'none';--%>

<%--            // Wait for the transition to finish before hiding div2 and showing div1--%>
<%--            setTimeout(() => {--%>
<%--              div2.style.display = 'none';--%>
<%--              div1.style.display = 'block';--%>
<%--              div1.style.opacity = '1';--%>
<%--              div1.style.pointerEvents = 'auto';--%>
<%--            }, 500);--%>

<%--            isDiv2Visible = false;--%>
<%--          } else {--%>
<%--            // Set div2 to be visible--%>
<%--            div2.style.display = 'block';--%>
<%--            div2.style.opacity = '1';--%>
<%--            div2.style.pointerEvents = 'auto';--%>

<%--            // Fade out div1--%>
<%--            div1.style.opacity = '0';--%>
<%--            div1.style.pointerEvents = 'none';--%>

<%--            // Wait for the transition to finish before hiding div1--%>
<%--            setTimeout(() => {--%>
<%--              div1.style.display = 'none';--%>
<%--            }, 700);--%>

<%--            isDiv2Visible = true;--%>
<%--          }--%>
<%--        }--%>



<%--    </script>--%>
<%--    <body>--%>
<%--        <div class="relative" id="container">--%>

<%--                <div class="flex justify-center items-center">--%>
<%--                                <button onclick="replaceDivs()" class="text-center py-2 w-64 text-sm text-black bg-gray-300 rounded-2xl">Register As Teacher?</button>--%>
<%--                            </div>--%>
<%--                   <form action="/coursehub/register" method="post">--%>

<%--                    <div class="py-12 px-12 bg-white rounded-2xl shadow-xl z-20 mt-2">--%>
<%--                        <div>--%>
<%--                            <h1 class="text-3xl font-bold text-center mb-4 cursor-pointer">Create An Student Account</h1>--%>
<%--                        </div>--%>
<%--                        <div class="space-y-4">--%>
<%--                            <input type="hidden" name="role" value="student">--%>
<%--                            <input type="text" name="username" placeholder="Registration No" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required />--%>
<%--                            <input type="text" name="name" placeholder="Name" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required />--%>
<%--                            <input type="email" name="email" placeholder="Email" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required/>--%>
<%--                            <input type="password" name="password" placeholder="Password" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required />--%>
<%--                            <div class="relative">--%>
<%--                                <select name="dept" class="block appearance-none w-full py-3 px-4 pr-8 rounded-lg border outline-none text-gray-700 leading-tight focus:outline-none focus:border-blue-500">--%>
<%--                                    <option value="" disabled selected>Select your department</option>--%>
<%--                                    <% for (String dept : (String[]) request.getAttribute("depts")) { %>--%>
<%--                                    <option value="<%= dept %>"><%= dept %></option>--%>
<%--                                    <% } %>--%>
<%--                                </select>--%>
<%--                                <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">--%>
<%--                                    <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">--%>
<%--                                        <path d="M10 12a.997.997 0 0 1-.707-.293l-3.999-3.999a.999.999 0 1 1 1.414-1.414L10 9.586l3.292-3.292a.999.999 0 1 1 1.414 1.414l-3.999 3.999A.997.997 0 0 1 10 12z"/>--%>
<%--                                    </svg>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="text-center mt-6">--%>
<%--                            <button type="submit" class="py-3 w-64 text-xl text-white bg-purple-400 rounded-2xl">Register</button>--%>
<%--                            <p class="mt-4 text-sm">Already Have An Account? <span class="underline cursor-pointer"> <a href="/coursehub/login">Log In </a></span>--%>
<%--                            </p>--%>
<%--                        </div>--%>

<%--                    </div>--%>

<%--                          </form>--%>


<%--                <! newdiv with diff text>--%>
<%--                <div id="div2" class="absolute transition-opacity ml-10 duration-500 opacity-0 pointer-events-none">--%>
<%--                <div class="flex justify-center items-center">--%>
<%--                                <button onclick="replaceDivs()" class="text-center py-2 w-64 text-sm text-black bg-gray-300 rounded-2xl mt-2">Register As Student?</button>--%>
<%--                            </div>--%>
<%--                <form action="/coursehub/register" method="post">--%>

<%--                    <div class="py-12 px-12 bg-rose-500 rounded-2xl shadow-xl z-20 mt-2">--%>
<%--                        <div>--%>
<%--                            <h1 class="text-3xl font-bold text-center mb-4 text-white cursor-pointer">Create A Teacher account</h1>--%>
<%--                        </div>--%>
<%--                        <div class="space-y-4">--%>
<%--                          <input type="hidden" name="role" value="teacher">--%>
<%--                            <input type="text" name="username" placeholder="Username" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required/>--%>
<%--                            <input type="text" name="name" placeholder="Name" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required/>--%>
<%--                            <input type="email" name="email" placeholder="Email" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required/>--%>
<%--                            <input type="password" name="password" placeholder="Password" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required/>--%>
<%--                            <div class="relative">--%>
<%--                                <select name="dept" class="block appearance-none w-full py-3 px-4 pr-8 rounded-lg border outline-none text-gray-700 leading-tight focus:outline-none focus:border-blue-500">--%>
<%--                                    <option value="" disabled selected>Select your department</option>--%>
<%--                                    <% for (String dept : (String[]) request.getAttribute("depts")) { %>--%>
<%--                                    <option value="<%= dept %>"><%= dept %></option>--%>
<%--                                    <% } %>--%>
<%--                                </select>--%>
<%--                                <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">--%>
<%--                                    <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">--%>
<%--                                        <path d="M10 12a.997.997 0 0 1-.707-.293l-3.999-3.999a.999.999 0 1 1 1.414-1.414L10 9.586l3.292-3.292a.999.999 0 1 1 1.414 1.414l-3.999 3.999A.997.997 0 0 1 10 12z"/>--%>
<%--                                    </svg>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="text-center mt-6">--%>
<%--                            <button onclick="replaceDivs()" class="py-3 w-64 text-xl text-black bg-green-300 rounded-2xl">Register</button>--%>
<%--                          <p class="mt-4 text-white text-sm">Already Have An Account? <span class="underline cursor-pointer"><a href="/coursehub/login">Log In</a></span>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                   </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--    </body>--%>
<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="sohan.mongodbtutorial.model.User"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Course</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<style>
    .toggle-checkbox:checked + .toggle-label {
        transform: translateX(100%);
        background-color: #48bb78;
    }

    .toggle-label {
        transition: background-color 0.2s ease-in-out;
    }

    .toggle-checkbox:checked ~ #toggle-label-text::after {
        content: "Student";
    }

    #toggle-label-text::after {
        content: "Teacher";
        margin-left: 0.5rem;
    }

</style>
<body class="bg-gray-200">



<div class="container mx-auto p-8">
    <div class="flex items-center justify-center">
        <label for="register-toggle" class="mr-4">Register as a <span id="register-label">teacher</span>?</label>
        <div class="relative inline-block w-10 align-middle select-none transition duration-200 ease-in">
            <input type="checkbox" name="register-toggle" id="register-toggle" class="toggle-checkbox absolute block w-6 h-6 rounded-full bg-white border-4 appearance-none cursor-pointer"/>
            <label for="register-toggle" class="toggle-label block overflow-hidden h-6 rounded-full bg-gray-300 cursor-pointer"></label>
        </div>
    </div>

    <script>
        const toggle = document.getElementById('toggle');
        const toggleLabelText = document.getElementById('toggle-label-text');

        toggle.addEventListener('change', (e) => {
            if (e.target.checked) {
                toggleLabelText.textContent = 'Register as a student?';
            } else {
                toggleLabelText.textContent = 'Register as a teacher?';
            }
        });

    </script>


    <script>
        const toggleSwitch = document.querySelector('#register-toggle');
        const registerLabel = document.querySelector('#register-label');

        toggleSwitch.addEventListener('change', function() {
            if (this.checked) {
                registerLabel.textContent = 'student';
            } else {
                registerLabel.textContent = 'teacher';
            }
        });
    </script>


    <form action="/coursehub/register" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
        <div class="mb-4">
            <input type="hidden" name="role" value="student">
            <label class="block text-gray-700 font-bold mb-2" for="regno">
                Registration No
            </label>
            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:border-blue-500 mb-3"
                   id="regno"
                   type="text"
                   placeholder="Enter your registration No"
                   name="username" required/>
            <label class="block text-gray-700 font-bold mb-2" for="fullname">
                Name
            </label>
            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:border-blue-500 mb-3"
                   id="fullname"
                   type="text"
                   placeholder="Enter your full name"
                   name="name" required/>
            <label class="block text-gray-700 font-bold mb-2" for="email">
                Email
            </label>
            <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:border-blue-500 mb-3"
                   id="email"
                   type="email"
                   name="email"
                   placeholder="Email"
                   required/>
            <label class="block text-gray-700 font-bold mb-2" for="dept">
                Department
            </label>
            <select id="dept" name="dept" class="block appearance-none w-full py-3 px-4 pr-8 rounded-lg border outline-none text-gray-700 leading-tight focus:outline-none focus:border-blue-500 mb-3">
                <option value="" disabled selected>Select your department</option>
                <% for (String dept : (String[]) request.getAttribute("depts")) { %>
                <option value="<%= dept %>"><%= dept %></option>
                <% } %>
            </select>
        <label class="block text-gray-700 font-bold mb-2" for="pass">
            Password
        </label>
        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:border-blue-500 mb-3"
               id="pass"
               type="password"
               name="password"
               placeholder="Enter your password here"
               required/>
        <div class="flex items-center justify-between my-2">
            <button class="text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" style="background-color: #9e0031;"
                    type="submit">
                Register
            </button>
        </div>
        <div class="text-center mt-6">
            <p class="mt-4 text-sm">Already Have An Account? <span class="underline cursor-pointer"> <a href="/coursehub/login">Log In </a></span>
            </p>
        </div>
        </div>
    </form>
</div>
<div class="flex flex-row-reverse mr-[150px]">

    <div class="flex flex-row-reverse h-[380px] w-[380px]">
        <svg class="animated" id="freepik_stories-work-time" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 500" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs"><style>svg#freepik_stories-work-time:not(.animated) .animable {opacity: 0;}svg#freepik_stories-work-time.animated #freepik--background-complete--inject-356 {animation: 1s 1 forwards cubic-bezier(.36,-0.01,.5,1.38) zoomIn;animation-delay: 0s;}svg#freepik_stories-work-time.animated #freepik--Shadow--inject-356 {animation: 1s 1 forwards cubic-bezier(.36,-0.01,.5,1.38) slideLeft;animation-delay: 0s;}svg#freepik_stories-work-time.animated #freepik--Hourglass--inject-356 {animation: 1s 1 forwards cubic-bezier(.36,-0.01,.5,1.38) fadeIn;animation-delay: 0s;}svg#freepik_stories-work-time.animated #freepik--Character--inject-356 {animation: 1s 1 forwards cubic-bezier(.36,-0.01,.5,1.38) lightSpeedRight,1.5s Infinite  linear floating;animation-delay: 0s,1s;}            @keyframes zoomIn {                0% {                    opacity: 0;                    transform: scale(0.5);                }                100% {                    opacity: 1;                    transform: scale(1);                }            }                    @keyframes slideLeft {                0% {                    opacity: 0;                    transform: translateX(-30px);                }                100% {                    opacity: 1;                    transform: translateX(0);                }            }                    @keyframes fadeIn {                0% {                    opacity: 0;                }                100% {                    opacity: 1;                }            }                    @keyframes lightSpeedRight {              from {                transform: translate3d(50%, 0, 0) skewX(-20deg);                opacity: 0;              }              60% {                transform: skewX(10deg);                opacity: 1;              }              80% {                transform: skewX(-2deg);              }              to {                opacity: 1;                transform: translate3d(0, 0, 0);              }            }                    @keyframes floating {                0% {                    opacity: 1;                    transform: translateY(0px);                }                50% {                    transform: translateY(-10px);                }                100% {                    opacity: 1;                    transform: translateY(0px);                }            }        </style><g id="freepik--background-complete--inject-356" class="animable" style="transform-origin: 250px 228.23px;"><rect y="382.4" width="500" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 250px 382.525px;" id="el5fmexkqk93" class="animable"></rect><rect x="416.78" y="398.49" width="33.12" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 433.34px 398.615px;" id="elge8u1m51kxc" class="animable"></rect><rect x="322.53" y="401.21" width="8.69" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 326.875px 401.335px;" id="elzkatl6hp3ci" class="animable"></rect><rect x="396.59" y="389.21" width="19.19" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 406.185px 389.335px;" id="elrhbqs98yqjb" class="animable"></rect><rect x="52.46" y="390.89" width="43.19" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 74.055px 391.015px;" id="eln7lh4w5w4ob" class="animable"></rect><rect x="104.56" y="390.89" width="6.33" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 107.725px 391.015px;" id="elpijxfv7sp2" class="animable"></rect><rect x="131.47" y="395.11" width="93.68" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 178.31px 395.235px;" id="eldh0w1bioot" class="animable"></rect><path d="M237,337.8H43.91a5.71,5.71,0,0,1-5.7-5.71V60.66A5.71,5.71,0,0,1,43.91,55H237a5.71,5.71,0,0,1,5.71,5.71V332.09A5.71,5.71,0,0,1,237,337.8ZM43.91,55.2a5.46,5.46,0,0,0-5.45,5.46V332.09a5.46,5.46,0,0,0,5.45,5.46H237a5.47,5.47,0,0,0,5.46-5.46V60.66A5.47,5.47,0,0,0,237,55.2Z" style="fill: rgb(235, 235, 235); transform-origin: 140.46px 196.4px;" id="elkv4f1bc0v1b" class="animable"></path><path d="M453.31,337.8H260.21a5.72,5.72,0,0,1-5.71-5.71V60.66A5.72,5.72,0,0,1,260.21,55h193.1A5.71,5.71,0,0,1,459,60.66V332.09A5.71,5.71,0,0,1,453.31,337.8ZM260.21,55.2a5.47,5.47,0,0,0-5.46,5.46V332.09a5.47,5.47,0,0,0,5.46,5.46h193.1a5.47,5.47,0,0,0,5.46-5.46V60.66a5.47,5.47,0,0,0-5.46-5.46Z" style="fill: rgb(235, 235, 235); transform-origin: 356.75px 196.4px;" id="ellwtzblc3u4" class="animable"></path><circle cx="359.32" cy="137.83" r="52.42" style="fill: rgb(224, 224, 224); transform-origin: 359.32px 137.83px;" id="elfidjo5fl79n" class="animable"></circle><circle cx="355.34" cy="137.83" r="52.42" style="fill: rgb(245, 245, 245); transform-origin: 355.34px 137.83px;" id="ellhbdnvxt1ui" class="animable"></circle><g id="el3j74bdbveuy"><circle cx="355.34" cy="137.83" r="48.45" style="fill: rgb(255, 255, 255); transform-origin: 355.34px 137.83px; transform: rotate(-45deg);" class="animable"></circle></g><path d="M363.6,173.09a1.17,1.17,0,0,1-1.14-.9l-8.26-34.08a1.18,1.18,0,0,1,2.29-.56l8.25,34.09a1.18,1.18,0,0,1-.87,1.42A1.24,1.24,0,0,1,363.6,173.09Z" style="fill: rgb(245, 245, 245); transform-origin: 359.475px 154.897px;" id="elmfvcwtst6l" class="animable"></path><path d="M355.34,140.18a2.34,2.34,0,0,1-1.66-.69l-28.35-28.35a2.35,2.35,0,1,1,3.33-3.32l26.68,26.69,15.57-15.57a2.35,2.35,0,1,1,3.32,3.33L357,139.49A2.35,2.35,0,0,1,355.34,140.18Z" style="fill: rgb(235, 235, 235); transform-origin: 349.782px 123.654px;" id="el7bw1vinx88c" class="animable"></path><g id="el8wari8fiy52"><rect x="221.5" y="321" width="7.9" height="54.1" style="fill: rgb(240, 240, 240); transform-origin: 225.45px 348.05px; transform: rotate(180deg);" class="animable"></rect></g><g id="elekntliwy0h"><rect x="61.7" y="375.1" width="162.48" height="7.3" style="fill: rgb(240, 240, 240); transform-origin: 142.94px 378.75px; transform: rotate(180deg);" class="animable"></rect></g><rect x="56.49" y="321" width="165.01" height="54.1" style="fill: rgb(245, 245, 245); transform-origin: 138.995px 348.05px;" id="el6tpvgeh00ix" class="animable"></rect><rect x="67.16" y="330.42" width="143.66" height="30.9" style="fill: rgb(240, 240, 240); transform-origin: 138.99px 345.87px;" id="el172af6y2du" class="animable"></rect><g id="el6b2fq6x013h"><rect x="101.67" y="329.38" width="74.64" height="5.18" rx="2.37" style="fill: rgb(245, 245, 245); transform-origin: 138.99px 331.97px; transform: rotate(180deg);" class="animable"></rect></g><g id="el39ka425ekc"><rect x="52.87" y="316.17" width="168.63" height="4.83" style="fill: rgb(240, 240, 240); transform-origin: 137.185px 318.585px; transform: rotate(180deg);" class="animable"></rect></g><rect x="221.5" y="316.17" width="11.69" height="4.83" style="fill: rgb(230, 230, 230); transform-origin: 227.345px 318.585px;" id="elqbl13v1z8rs" class="animable"></rect><rect x="414.29" y="263.88" width="15.4" height="118.52" style="fill: rgb(240, 240, 240); transform-origin: 421.99px 323.14px;" id="eluxs7qj0fin" class="animable"></rect><g id="el178mowsjcuz"><rect x="279.5" y="263.88" width="134.79" height="118.52" style="fill: rgb(245, 245, 245); transform-origin: 346.895px 323.14px; transform: rotate(180deg);" class="animable"></rect></g><g id="elmjkull002jd"><rect x="278.27" y="308.61" width="118.34" height="63.39" style="fill: rgb(250, 250, 250); transform-origin: 337.44px 340.305px; transform: rotate(180deg);" class="animable"></rect></g><g id="elt302wutgjds"><rect x="278.27" y="281.01" width="118.34" height="20.87" style="fill: rgb(250, 250, 250); transform-origin: 337.44px 291.445px; transform: rotate(180deg);" class="animable"></rect></g><g id="elnt6wxrs1s5"><rect x="396.61" y="308.6" width="1.06" height="63.39" style="fill: rgb(230, 230, 230); opacity: 0.7; mix-blend-mode: multiply; transform-origin: 397.14px 340.295px;" class="animable"></rect></g><g id="elezvgcxbeiv"><rect x="396.61" y="281.01" width="1.06" height="20.87" style="fill: rgb(230, 230, 230); opacity: 0.7; mix-blend-mode: multiply; transform-origin: 397.14px 291.445px;" class="animable"></rect></g><g id="elr5quefhcp8"><rect x="279.16" y="268.88" width="150.53" height="2.68" style="fill: rgb(230, 230, 230); opacity: 0.7; mix-blend-mode: multiply; transform-origin: 354.425px 270.22px;" class="animable"></rect></g><rect x="414.29" y="262.26" width="17.2" height="7.75" style="fill: rgb(240, 240, 240); transform-origin: 422.89px 266.135px;" id="eldld92ya1c79" class="animable"></rect><g id="elwrmg59542t"><rect x="277.7" y="262.26" width="136.59" height="7.75" style="fill: rgb(245, 245, 245); transform-origin: 345.995px 266.135px; transform: rotate(180deg);" class="animable"></rect></g><path d="M328.94,239.44a12.45,12.45,0,0,1-1.8-4.82,24.3,24.3,0,0,1-.26-5.18,34.15,34.15,0,0,1,2.18-10.06,49.83,49.83,0,0,1,2-4.7c.8-1.5,1.6-3,2.5-4.43s1.89-2.81,2.91-4.15,2.17-2.59,3.36-3.8c-.58,1.61-1.27,3.13-2,4.65s-1.3,3.05-2,4.53l-1.94,4.5-.89,2.27-.46,1.13-.4,1.14a61.77,61.77,0,0,0-2.71,9.24,34.71,34.71,0,0,0-.7,4.77A18.45,18.45,0,0,0,328.94,239.44Z" style="fill: rgb(230, 230, 230); transform-origin: 333.335px 220.87px;" id="elytdal0z6idi" class="animable"></path><path d="M309.53,242.09a25.75,25.75,0,0,0-.63-7.19,14.26,14.26,0,0,0-2.93-5.84,19.73,19.73,0,0,0-5.28-4.16c-2.05-1.19-4.31-2.12-6.64-3.22a18.3,18.3,0,0,1,7.68.82,16.71,16.71,0,0,1,3.64,1.7,14.67,14.67,0,0,1,3.13,2.71,12.7,12.7,0,0,1,3,7.63A12.91,12.91,0,0,1,309.53,242.09Z" style="fill: rgb(230, 230, 230); transform-origin: 302.784px 231.833px;" id="elm7q0voxw5fc" class="animable"></path><path d="M310.4,241.74a66.3,66.3,0,0,0-.79-8.4,32.88,32.88,0,0,0-2.19-7.71,24.27,24.27,0,0,0-4.24-6.64,38.91,38.91,0,0,0-6.32-5.44,17.43,17.43,0,0,1,8.1,3.52,18.46,18.46,0,0,1,5.51,7.24,21.7,21.7,0,0,1,1.73,8.83A20.86,20.86,0,0,1,310.4,241.74Z" style="fill: rgb(230, 230, 230); transform-origin: 304.531px 227.645px;" id="el2oqri9qq39u" class="animable"></path><path d="M327.61,236.63a47,47,0,0,1-5.5-9.11,65.34,65.34,0,0,1-3.71-10A56.71,56.71,0,0,1,316.47,207a38.87,38.87,0,0,1,.49-10.66c.73,3.51,1.29,6.9,2.09,10.27s1.6,6.69,2.55,10,1.91,6.62,2.94,9.93S326.62,233.21,327.61,236.63Z" style="fill: rgb(230, 230, 230); transform-origin: 321.958px 216.485px;" id="eld1f2xdt2cxu" class="animable"></path><path d="M326.71,236.38a48,48,0,0,1-6.58-8,66.26,66.26,0,0,1-5-9.07,56.2,56.2,0,0,1-3.44-9.81,38.27,38.27,0,0,1-1.15-10.33c1.26,3.26,2.35,6.42,3.64,9.53s2.57,6.19,4,9.24,2.81,6.09,4.27,9.15S325.32,233.2,326.71,236.38Z" style="fill: rgb(230, 230, 230); transform-origin: 318.619px 217.775px;" id="ell7vwd3d8tao" class="animable"></path><path d="M330.43,239.58a37.5,37.5,0,0,1-7.75-5.46,50.54,50.54,0,0,1-6.43-7,43.72,43.72,0,0,1-5-8.12,30.75,30.75,0,0,1-2.7-9.11c1.72,2.69,3.24,5.32,5,7.83s3.46,5,5.33,7.39,3.74,4.79,5.68,7.17S328.47,237.08,330.43,239.58Z" style="fill: rgb(230, 230, 230); transform-origin: 319.49px 224.735px;" id="el79ho0usrlx5" class="animable"></path><path d="M325,236.4a27.42,27.42,0,0,1-7.48-4.6,36.75,36.75,0,0,1-6-6.42,39.23,39.23,0,0,1-2.44-3.69,36.49,36.49,0,0,1-1.93-4,27.49,27.49,0,0,1-2.09-8.54c1.57,2.51,2.86,5,4.42,7.34.7,1.21,1.54,2.33,2.27,3.51s1.58,2.28,2.44,3.38q2.48,3.34,5.2,6.55C321.15,232.1,323,234.21,325,236.4Z" style="fill: rgb(230, 230, 230); transform-origin: 315.03px 222.775px;" id="el67pqin34njw" class="animable"></path><path d="M329.26,238.11a9.13,9.13,0,0,1-3-3.58,16.81,16.81,0,0,1-1.45-4.52,25.15,25.15,0,0,1,.26-9.36,45.27,45.27,0,0,1,1.2-4.47c.57-1.43,1.08-2.88,1.76-4.25s1.4-2.71,2.21-4a44.78,44.78,0,0,1,2.69-3.7c-.32,1.51-.77,2.94-1.2,4.37s-.79,2.87-1.26,4.26-.75,2.83-1.18,4.22l-.49,2.11c-.17.7-.37,1.4-.47,2.11a40.34,40.34,0,0,0-.92,8.45,21.61,21.61,0,0,0,.38,4.23A12.85,12.85,0,0,0,329.26,238.11Z" style="fill: rgb(230, 230, 230); transform-origin: 328.71px 221.17px;" id="eljblop6sr6" class="animable"></path><path d="M327.4,234.92a19.78,19.78,0,0,1-4.63-8.28,24.69,24.69,0,0,1-.87-9.64c.05-.81.25-1.6.38-2.4l.23-1.2.35-1.16c.26-.77.48-1.54.77-2.29s.67-1.47,1-2.19l.54-1.07.65-1,1.32-2a36.58,36.58,0,0,1,3.19-3.49c-.52,1.51-1.21,2.88-1.77,4.3l-.79,2.13-.4,1-.32,1.08c-.21.71-.43,1.42-.66,2.12l-.49,2.15-.26,1.07-.15,1.08c-.09.72-.27,1.44-.31,2.16a37.15,37.15,0,0,0,.12,8.75A41.38,41.38,0,0,0,327.4,234.92Z" style="fill: rgb(230, 230, 230); transform-origin: 326.044px 217.56px;" id="elnajiirv4778" class="animable"></path><polygon points="323.18 233.7 308.85 220.95 310.97 238.26 323.18 233.7" style="fill: rgb(230, 230, 230); transform-origin: 316.015px 229.605px;" id="el5qfqcvxb3mp" class="animable"></polygon><polygon points="295.56 231.37 337.14 231.37 331.69 262.26 301.01 262.26 295.56 231.37" style="fill: rgb(245, 245, 245); transform-origin: 316.35px 246.815px;" id="eldvy56c5v7s9" class="animable"></polygon><polygon points="321.54 231.37 337.14 231.37 331.69 262.26 323.5 262.26 321.54 231.37" style="fill: rgb(235, 235, 235); transform-origin: 329.34px 246.815px;" id="els8713qc8xoh" class="animable"></polygon><path d="M373.86,239.5a11.22,11.22,0,0,0-.17-4.1,17,17,0,0,0-1.23-3.73,31,31,0,0,0-4.23-6.66c-.38-.55-.87-1-1.3-1.53s-.87-1-1.33-1.53c-1-1-1.86-2-2.85-3s-1.94-2-2.94-3-2-2-3-3.09c1.35.51,2.63,1.14,3.93,1.78a42.14,42.14,0,0,1,3.67,2.27,20.09,20.09,0,0,1,1.72,1.32c.56.46,1.11.94,1.66,1.41a35,35,0,0,1,3,3.21,21,21,0,0,1,4.11,7.91,13.63,13.63,0,0,1,.39,4.5A8.08,8.08,0,0,1,373.86,239.5Z" style="fill: rgb(230, 230, 230); transform-origin: 366.072px 226.18px;" id="elhl7xkbjmkmm" class="animable"></path><path d="M397.24,235.31a7.47,7.47,0,0,1-2.25-3.42,9.33,9.33,0,0,1-.45-2.11,10.09,10.09,0,0,1,0-1.1,4.43,4.43,0,0,1,.1-1.09,13.54,13.54,0,0,1,4.24-7.36c.5-.49,1.07-.88,1.6-1.32a12.73,12.73,0,0,1,1.68-1.18c.58-.34,1.16-.69,1.76-1,.29-.16.58-.34.89-.48l.92-.39c.62-.26,1.24-.5,1.86-.74a12.7,12.7,0,0,1,1.9-.6,37.64,37.64,0,0,1,3.91-.8,35.81,35.81,0,0,1-3.23,2.28c-.55.33-1.07.7-1.59,1.08s-1,.72-1.58,1.07c-1.09.65-2,1.48-3,2.18a13.2,13.2,0,0,0-1.42,1.15c-.46.4-1,.76-1.38,1.18a15.47,15.47,0,0,0-4,5.56,12.38,12.38,0,0,0-.46,1.64,11.27,11.27,0,0,0-.14,1.75A11,11,0,0,0,397.24,235.31Z" style="fill: rgb(230, 230, 230); transform-origin: 403.962px 224.515px;" id="eluodbdj99p7f" class="animable"></path><path d="M396.17,235.31a13.54,13.54,0,0,1-2.8-8.2,17,17,0,0,1,2.24-8.67l1.2-1.9c.46-.59.95-1.15,1.44-1.71L399,214l.82-.72,1.68-1.41a39.33,39.33,0,0,1,3.69-2.27,39.86,39.86,0,0,1,4-1.56c-1,1.06-2,2-3.07,2.9s-1.94,1.93-2.88,2.88c-.44.52-.87,1-1.32,1.51l-.67.73-.57.8c-.38.53-.8,1-1.17,1.56l-1,1.65a21.34,21.34,0,0,0-2.53,7.19A22.82,22.82,0,0,0,396.17,235.31Z" style="fill: rgb(230, 230, 230); transform-origin: 401.279px 221.675px;" id="elyyync3a3dvk" class="animable"></path><path d="M375.14,236.79c.83-3.09,1.73-6.07,2.6-9s1.72-5.92,2.5-8.88,1.43-5.94,2-9,.88-6,1.15-9.24a27,27,0,0,1,1.46,9.5,44.83,44.83,0,0,1-1.39,9.52,51.7,51.7,0,0,1-3.29,9A39.32,39.32,0,0,1,375.14,236.79Z" style="fill: rgb(230, 230, 230); transform-origin: 380px 218.73px;" id="elr0bygngdo4a" class="animable"></path><path d="M376.18,236.29c1.3-3,2.7-6,4.08-8.87s2.77-5.79,4.1-8.69,2.61-5.81,3.8-8.76,2.21-6,3.21-9.14a30.35,30.35,0,0,1-.71,9.91,52.1,52.1,0,0,1-3.27,9.38,62.16,62.16,0,0,1-4.87,8.6A45.31,45.31,0,0,1,376.18,236.29Z" style="fill: rgb(230, 230, 230); transform-origin: 383.84px 218.56px;" id="elxb5m07wts3i" class="animable"></path><path d="M372.11,240.1c1.95-2.68,4-5.21,6-7.74s4-5,5.94-7.55,3.84-5.08,5.66-7.7,3.48-5.32,5.17-8.18a30.42,30.42,0,0,1-2.91,9.5,51.88,51.88,0,0,1-5.28,8.41,62.28,62.28,0,0,1-6.67,7.29A45.43,45.43,0,0,1,372.11,240.1Z" style="fill: rgb(230, 230, 230); transform-origin: 383.495px 224.515px;" id="elivxvf73lopf" class="animable"></path><path d="M378.23,235.74c1.91-2.39,3.82-4.65,5.7-6.94s3.7-4.56,5.48-6.87,3.43-4.69,5-7.12,3-5,4.54-7.66a26.57,26.57,0,0,1-2.24,8.9,38.92,38.92,0,0,1-4.71,7.9,46,46,0,0,1-6.26,6.67A34.46,34.46,0,0,1,378.23,235.74Z" style="fill: rgb(230, 230, 230); transform-origin: 388.59px 221.445px;" id="el6gy9kdd6ywr" class="animable"></path><path d="M373.34,238.53a14.47,14.47,0,0,0,1.52-7,17.46,17.46,0,0,0-1.74-6.66l-.34-.81-.43-.78-.84-1.58c-.67-1-1.27-2.07-2-3.1s-1.39-2.06-2.13-3.09a38.47,38.47,0,0,1-2.17-3.22,36.35,36.35,0,0,1,3.34,2.08,34.28,34.28,0,0,1,3,2.57,15.59,15.59,0,0,1,1.33,1.48q.64.77,1.26,1.56l1.07,1.73.51.88.42.94a14.42,14.42,0,0,1,1.3,8.16A10,10,0,0,1,373.34,238.53Z" style="fill: rgb(230, 230, 230); transform-origin: 371.388px 225.41px;" id="elh4ey719qymk" class="animable"></path><path d="M375.2,235.34a37.72,37.72,0,0,0,1.68-7.63,19.73,19.73,0,0,0-.53-7.22,16.71,16.71,0,0,0-1.3-3.35,20.23,20.23,0,0,0-1.94-3.13,52.68,52.68,0,0,0-5.22-5.86,17.86,17.86,0,0,1,7.17,4.12,15.74,15.74,0,0,1,2.74,3.32,14.89,14.89,0,0,1,1.76,4,15.83,15.83,0,0,1-.13,8.61A16,16,0,0,1,375.2,235.34Z" style="fill: rgb(230, 230, 230); transform-origin: 373.992px 221.745px;" id="el7y3aoax3u5g" class="animable"></path><polygon points="380.09 232.97 395.73 217.95 395.1 232.68 380.09 232.97" style="fill: rgb(230, 230, 230); transform-origin: 387.91px 225.46px;" id="el4qaz7qzotfn" class="animable"></polygon><polygon points="362.98 231.37 404.56 231.37 399.11 262.26 368.43 262.26 362.98 231.37" style="fill: rgb(245, 245, 245); transform-origin: 383.77px 246.815px;" id="elbbm4h977wen" class="animable"></polygon><polygon points="388.95 231.37 404.56 231.37 399.11 262.26 390.92 262.26 388.95 231.37" style="fill: rgb(235, 235, 235); transform-origin: 396.755px 246.815px;" id="elcxat6c7n89m" class="animable"></polygon><path d="M103.87,90.72v162a25.4,25.4,0,0,1-25.4,25.4h118a25.41,25.41,0,0,0,25.41-25.4V90.72Z" style="fill: rgb(245, 245, 245); transform-origin: 150.175px 184.42px;" id="el0tk47v4mg9pk" class="animable"></path><rect x="127.11" y="131.73" width="76.25" height="76.25" style="fill: rgb(240, 240, 240); transform-origin: 165.235px 169.855px;" id="elelpmhr2b9fb" class="animable"></rect><rect x="124.77" y="129.38" width="76.25" height="76.25" style="fill: rgb(255, 255, 255); transform-origin: 162.895px 167.505px;" id="elowxftxgjy2" class="animable"></rect><rect x="124.1" y="216.92" width="19.39" height="19.39" style="fill: rgb(255, 255, 255); transform-origin: 133.795px 226.615px;" id="elkw7zsnwo47l" class="animable"></rect><rect x="181.62" y="216.92" width="19.39" height="19.39" style="fill: rgb(255, 255, 255); transform-origin: 191.315px 226.615px;" id="el5bwlii3j874" class="animable"></rect><rect x="152.86" y="216.92" width="19.39" height="19.39" style="fill: rgb(255, 255, 255); transform-origin: 162.555px 226.615px;" id="el4ldy2cql74o" class="animable"></rect><rect x="103.87" y="90.72" width="118.03" height="19.28" style="fill: rgb(240, 240, 240); transform-origin: 162.885px 100.36px;" id="el9jc44bce6gu" class="animable"></rect><path d="M111,84.53V96.91a3.44,3.44,0,0,0,3.45,3.45h0a3.45,3.45,0,0,0,3.45-3.45V84.53a3.46,3.46,0,0,0-3.45-3.45h0A3.45,3.45,0,0,0,111,84.53Z" style="fill: rgb(230, 230, 230); transform-origin: 114.45px 90.72px;" id="elw7h6cfzdsl" class="animable"></path><path d="M207.92,84.53V96.91a3.45,3.45,0,0,0,3.45,3.45h0a3.44,3.44,0,0,0,3.45-3.45V84.53a3.45,3.45,0,0,0-3.45-3.45h0A3.46,3.46,0,0,0,207.92,84.53Z" style="fill: rgb(230, 230, 230); transform-origin: 211.37px 90.72px;" id="elgej1yheedjc" class="animable"></path><path d="M188.53,84.53V96.91a3.45,3.45,0,0,0,3.45,3.45h0a3.45,3.45,0,0,0,3.45-3.45V84.53A3.46,3.46,0,0,0,192,81.08h0A3.46,3.46,0,0,0,188.53,84.53Z" style="fill: rgb(230, 230, 230); transform-origin: 191.98px 90.72px;" id="elvgfg5xniby" class="animable"></path><path d="M169.14,84.53V96.91a3.44,3.44,0,0,0,3.45,3.45h0A3.44,3.44,0,0,0,176,96.91V84.53a3.45,3.45,0,0,0-3.44-3.45h0A3.45,3.45,0,0,0,169.14,84.53Z" style="fill: rgb(230, 230, 230); transform-origin: 172.57px 90.72px;" id="elko8fwumoyis" class="animable"></path><path d="M149.75,84.53V96.91a3.44,3.44,0,0,0,3.44,3.45h0a3.44,3.44,0,0,0,3.45-3.45V84.53a3.45,3.45,0,0,0-3.45-3.45h0A3.45,3.45,0,0,0,149.75,84.53Z" style="fill: rgb(230, 230, 230); transform-origin: 153.195px 90.72px;" id="el6zipcmxgu0j" class="animable"></path><path d="M130.35,84.53V96.91a3.45,3.45,0,0,0,3.45,3.45h0a3.45,3.45,0,0,0,3.45-3.45V84.53a3.46,3.46,0,0,0-3.45-3.45h0A3.46,3.46,0,0,0,130.35,84.53Z" style="fill: rgb(230, 230, 230); transform-origin: 133.8px 90.72px;" id="el1nc3gqxc043" class="animable"></path><path d="M185.87,267.44a10.63,10.63,0,0,0,10.63,10.63H63.69a10.63,10.63,0,0,1-10.63-10.63Z" style="fill: rgb(230, 230, 230); transform-origin: 124.78px 272.755px;" id="elvhv8dwcwypk" class="animable"></path></g><g id="freepik--Shadow--inject-356" class="animable" style="transform-origin: 250px 416.24px;"><ellipse id="freepik--path--inject-356" cx="250" cy="416.24" rx="193.89" ry="11.32" style="fill: rgb(245, 245, 245); transform-origin: 250px 416.24px;" class="animable"></ellipse></g><g id="freepik--Hourglass--inject-356" class="animable" style="transform-origin: 271.34px 318.98px;"><g id="elfmgrbgdzdcg"><path d="M269.59,320.73s-73.49,43.39-73.49,84.5h147C343.09,364.12,269.59,320.73,269.59,320.73Z" style="fill: rgb(158, 0, 49); opacity: 0.2; transform-origin: 269.6px 362.98px;" class="animable"></path></g><g id="elaie63r4lbka"><path d="M269.59,372.5s-67.86,16.81-67.86,32.73H337.45C337.45,389.31,269.59,372.5,269.59,372.5Z" style="fill: rgb(158, 0, 49); opacity: 0.2; transform-origin: 269.59px 388.865px;" class="animable"></path></g><g id="el4nomiftx5e"><path d="M278.51,332.71c13.8,13.57,40.62,43.64,40.62,72.52H300.74C300.74,376.35,286.06,346.28,278.51,332.71Z" style="fill: rgb(255, 255, 255); opacity: 0.3; transform-origin: 298.82px 368.97px;" class="animable"></path></g><g id="eli1equest2lr"><path d="M269.59,320.73s-73.49-43.39-73.49-84.5h147C343.09,277.34,269.59,320.73,269.59,320.73Z" style="fill: rgb(158, 0, 49); opacity: 0.2; transform-origin: 269.6px 278.48px;" class="animable"></path></g><g id="elzarhdqht6nk"><path d="M269.59,316.77s-37.52-18-37.52-35.1h75.05C307.12,298.74,269.59,316.77,269.59,316.77Z" style="fill: rgb(158, 0, 49); opacity: 0.2; transform-origin: 269.595px 299.22px;" class="animable"></path></g><g id="elle5ixl0wx3"><path d="M261.58,308.75C247.79,295.18,221,265.11,221,236.23h18.39C239.35,265.11,254,295.18,261.58,308.75Z" style="fill: rgb(255, 255, 255); opacity: 0.3; transform-origin: 241.29px 272.49px;" class="animable"></path></g><g id="elg1bxwylcd9u"><path d="M278.51,308.75c13.8-13.57,39.95-47.12,40.62-72.52h-4.9C311.93,267.2,289.43,295.62,278.51,308.75Z" style="fill: rgb(255, 255, 255); opacity: 0.3; transform-origin: 298.82px 272.49px;" class="animable"></path></g><rect x="324.78" y="221.72" width="8.33" height="1" style="fill: rgb(158, 0, 49); transform-origin: 328.945px 222.22px;" id="elibjrd2b74gr" class="animable"></rect><path d="M361.39,235.46h-1a12.75,12.75,0,0,0-12.73-12.74h-8.79v-1h8.79A13.76,13.76,0,0,1,361.39,235.46Z" style="fill: rgb(158, 0, 49); transform-origin: 350.13px 228.59px;" id="eljcq94gx6rs" class="animable"></path><rect x="181.29" y="225.22" width="176.6" height="22.02" rx="10.24" style="fill: rgb(158, 0, 49); transform-origin: 269.59px 236.23px;" id="elfothw2q6gqr" class="animable"></rect><rect x="181.29" y="394.22" width="176.6" height="22.02" rx="10.24" style="fill: rgb(158, 0, 49); transform-origin: 269.59px 405.23px;" id="elat2414zahp6" class="animable"></rect></g><g id="freepik--Character--inject-356" class="animable animator-active" style="transform-origin: 199.174px 204.69px;"><polygon points="140.72 304.52 133.94 298.5 145.5 280.75 152.28 286.76 140.72 304.52" style="fill: rgb(255, 139, 123); transform-origin: 143.11px 292.635px;" id="elsuzdhvqjzu8" class="animable"></polygon><path d="M135.34,294.68l8.62,6a.66.66,0,0,1,.21.91l-4.32,7.12a1.66,1.66,0,0,1-2.29.43c-3-2.13-4.11-3.17-7.7-6.07a133.3,133.3,0,0,1-10.2-8.89c-2.66-2.76.15-5.43,1.56-4.48,3.33,2.26,9.12,4.75,12.47,4.55A2.6,2.6,0,0,1,135.34,294.68Z" style="fill: rgb(38, 50, 56); transform-origin: 131.414px 299.463px;" id="elp8toakl9vu" class="animable"></path><g id="elxahu6sxyks"><polygon points="152.27 286.77 145.49 280.75 139.93 289.3 146.88 295.07 152.27 286.77" style="opacity: 0.2; transform-origin: 146.1px 287.91px;" class="animable"></polygon></g><path d="M221.25,198.1s-45.5-3.11-51.14,12.31c-12.83,35.06-29.52,72.25-29.52,72.25L154,292.37s28.35-43.35,37-71.18c17.5,4.25,49.14,7.88,59.33-3.82,8.7-10,2.19-19.27,2.19-19.27Z" style="fill: rgb(38, 50, 56); transform-origin: 197.725px 245.107px;" id="el9iurs6jf6pj" class="animable"></path><g id="eltamfdbx25tb"><path d="M182.28,225.35c-1.06,4.28-2.67,16.54-3.67,24.67,2.21-4.28,4.31-8.62,6.2-12.86Z" style="opacity: 0.3; transform-origin: 181.71px 237.685px;" class="animable"></path></g><polygon points="153.14 296.76 137.93 284.84 141.04 278.16 158.04 291.15 153.14 296.76" style="fill: rgb(158, 0, 49); transform-origin: 147.985px 287.46px;" id="elsfk47zsntv" class="animable"></polygon><path d="M131.69,294.13a12.24,12.24,0,0,0,2.24,1.15.22.22,0,0,0,.28-.28c-.13-.34-1.27-3.33-2.46-3.62a.83.83,0,0,0-.77.22,1.22,1.22,0,0,0-.45,1.13A2.56,2.56,0,0,0,131.69,294.13Zm1.93.55c-1.57-.68-2.55-1.43-2.66-2a.78.78,0,0,1,.32-.73.38.38,0,0,1,.37-.11C132.29,292,133.12,293.49,133.62,294.68Z" style="fill: rgb(158, 0, 49); transform-origin: 132.37px 293.326px;" id="eltuxkmc7irm" class="animable"></path><path d="M133.88,295.25a.18.18,0,0,0,.1,0,.23.23,0,0,0,.2-.08c.07-.08,1.77-2.17,1.52-3.46a1.1,1.1,0,0,0-.59-.77.83.83,0,0,0-1,.09c-.76.71-.73,3.11-.28,4.1A.27.27,0,0,0,133.88,295.25Zm1.11-3.83a.65.65,0,0,1,.28.42c.15.76-.66,2.07-1.19,2.79-.28-1-.19-2.78.3-3.24.1-.09.24-.18.53,0Z" style="fill: rgb(158, 0, 49); transform-origin: 134.618px 293.035px;" id="el78sunn790r" class="animable"></path><polygon points="200.5 315.01 191.75 316.76 190.13 293.33 199.02 293.61 200.5 315.01" style="fill: rgb(255, 139, 123); transform-origin: 195.315px 305.045px;" id="elqgglwthcdo" class="animable"></polygon><path d="M190.56,313.56l10-4.21a.68.68,0,0,1,.92.33l3.82,7.68a1.72,1.72,0,0,1-.89,2.24c-3.5,1.41-5.24,1.9-9.63,3.76-2.7,1.14-10,4.44-13.9,5.41s-4.78-2.94-3.2-3.7c3.74-1.8,9.94-7.29,11.61-10.32A2.77,2.77,0,0,1,190.56,313.56Z" style="fill: rgb(38, 50, 56); transform-origin: 191.186px 319.102px;" id="ely7x3tv13cjk" class="animable"></path><path d="M188.07,316.44a12.27,12.27,0,0,0,2.23-1.32.24.24,0,0,0,.09-.23.24.24,0,0,0-.18-.17c-.36-.08-3.6-.73-4.51.15a.83.83,0,0,0-.23.79,1.23,1.23,0,0,0,.73,1A2.62,2.62,0,0,0,188.07,316.44Zm1.53-1.38c-1.45,1-2.64,1.43-3.23,1.2a.79.79,0,0,1-.46-.68.4.4,0,0,1,.1-.39C186.5,314.72,188.3,314.84,189.6,315.06Z" style="fill: rgb(158, 0, 49); transform-origin: 187.92px 315.578px;" id="ele4xa569ef7s" class="animable"></path><path d="M190.25,315.15a.31.31,0,0,0,.09-.07.23.23,0,0,0,0-.21c0-.11-.92-2.75-2.18-3.24a1.11,1.11,0,0,0-1,.09.84.84,0,0,0-.48.94c.2,1,2.31,2.35,3.42,2.5A.2.2,0,0,0,190.25,315.15Zm-2.73-3.09a.67.67,0,0,1,.52,0c.75.29,1.44,1.72,1.78,2.58-1-.33-2.53-1.36-2.66-2.06,0-.13,0-.3.27-.46Z" style="fill: rgb(158, 0, 49); transform-origin: 188.514px 313.361px;" id="el1sjs9wk194w" class="animable"></path><g id="el6b5lw667c6x"><polygon points="199.03 293.62 190.13 293.33 190.98 305.57 199.84 305.41 199.03 293.62" style="opacity: 0.2; transform-origin: 194.985px 299.45px;" class="animable"></polygon></g><path d="M243.35,198.1s-65,6.15-62.66,25.72c3.42,28.23,5.92,77.66,5.92,77.66l16.57.65s6.22-43.46,2.58-72.37c16.83,0,53.39.89,59.82-7.81,7.63-10.32,4.1-23.85,4.1-23.85Z" style="fill: rgb(38, 50, 56); transform-origin: 225.562px 250.115px;" id="elxjvnr3xcrve" class="animable"></path><polygon points="205.01 303.15 185.12 302.16 184.41 293.51 206.22 295.01 205.01 303.15" style="fill: rgb(158, 0, 49); transform-origin: 195.315px 298.33px;" id="eljybs9f86l8" class="animable"></polygon><path d="M228.92,140.79c-.14,1.79-.3,3.38-.52,5.05s-.43,3.3-.69,4.95c-.48,3.29-1.14,6.56-1.88,9.85s-1.65,6.57-2.79,9.88a52.65,52.65,0,0,1-4.53,10,25,25,0,0,1-4,5.09,15.39,15.39,0,0,1-1.29,1.08c-.41.34-.82.63-1.24.92a25.52,25.52,0,0,1-2.49,1.55,48.42,48.42,0,0,1-10,4.07c-1.65.51-3.31.92-5,1.29s-3.3.69-5,.95a80.44,80.44,0,0,1-10,1,3.42,3.42,0,0,1-1.2-6.67l.13-.05a160.67,160.67,0,0,0,17.23-6.56,47,47,0,0,0,7.38-4.18c.53-.38,1-.77,1.48-1.16.22-.19.45-.38.64-.58a5.66,5.66,0,0,0,.5-.51,13.72,13.72,0,0,0,1.7-2.61,43,43,0,0,0,2.91-7.69c.81-2.81,1.51-5.74,2.09-8.72s1.1-6,1.59-9.06.86-6.18,1.2-9.08l0-.17a6.87,6.87,0,0,1,13.66,1.36Z" style="fill: rgb(158, 0, 49); transform-origin: 202.423px 165.002px;" id="eli4pcnjpspq" class="animable"></path><path d="M179.82,188l-5,.31,4,9.2s8.65-.19,8.47-4.45l-1.56-2A8.14,8.14,0,0,0,179.82,188Z" style="fill: rgb(255, 139, 123); transform-origin: 181.056px 192.755px;" id="ellwq10liqxq" class="animable"></path><polygon points="169.34 189.07 173.66 197.53 178.81 197.53 174.81 188.33 169.34 189.07" style="fill: rgb(255, 139, 123); transform-origin: 174.075px 192.93px;" id="elyszbwirk31" class="animable"></polygon><path d="M228.2,126.61l9.67-2,7.7-1.11a14.28,14.28,0,0,1,3.33-.15A14.58,14.58,0,0,1,261.64,134c1.93,7,3.67,15.59,5,23.2,1.86,10.57,2.82,26.45,3,40.89H223.83c-1-26.15-6.56-43-8.45-53.45a14.62,14.62,0,0,1,8.09-15.79Z" style="fill: rgb(158, 0, 49); transform-origin: 242.394px 160.702px;" id="elvp08cnyeigg" class="animable"></path><path d="M223.83,132.36c.11,4.3,1,19.63,5.61,28.34.81-8.16,10.5-33,10.5-33Z" style="fill: rgb(245, 245, 245); transform-origin: 231.885px 144.2px;" id="elzipoij6p7yb" class="animable"></path><g id="el3t0wwdh5qr5"><path d="M267.69,164.38h0c0-.16,0-.31-.06-.48l-.09-.72c-.05-.39-.1-.78-.15-1.15l-.15-1.07-.15-1c0-.28-.09-.57-.13-.84-.1-.64-.2-1.26-.31-1.87-.33-1.87-.68-3.81-1.06-5.76l0-.16c-.38-2-.77-3.93-1.19-5.88l0-.13c-.17-.84-.35-1.66-.54-2.49l-.21-.92-.36-1.59-.3-1.24-.06-.26h0c-.4-1.64-.81-3.25-1.23-4.77l-6.95-3.66c.8,3.07,1.56,6.45,2.28,9.91a10.15,10.15,0,0,0-2.28,1.63c-1.66,1.48-1.6,4.63.06,8.36A92.45,92.45,0,0,1,262.31,184c.21,4.71.34,9.48.4,14.11h7C269.51,186.64,268.87,174.28,267.69,164.38Z" style="opacity: 0.3; transform-origin: 261.622px 164.25px;" class="animable"></path></g><path d="M234.27,107.34l-3.93,6L225,121.49a8.35,8.35,0,0,1,1.65,2.41c1,2,1.78,3.44-2.35,6.25-.88.6-.91,1.55-.71,2.6.24,1.28,1,2.62,5.44,1.83a20.55,20.55,0,0,0,11.18-6.2c1.48-1.49,1.14-2.6-.29-4.14C235.88,119.89,234.67,112.94,234.27,107.34Z" style="fill: rgb(255, 139, 123); transform-origin: 232.329px 121.078px;" id="el2j9s07x5xts" class="animable"></path><path d="M224.83,134.73l2.83,1.78,4.6-1.95a7.43,7.43,0,0,0-4-2.09A7.92,7.92,0,0,0,224.83,134.73Z" style="fill: rgb(38, 50, 56); transform-origin: 228.545px 134.49px;" id="elyhy7zp241z8" class="animable"></path><path d="M228.21,132.47c2.11.87,3.17,2.83,4.13,5.09,0,0,10.11-7.66,10.32-12.71-.54-1.72-3.07-1.42-3.07-1.42S236.51,128.77,228.21,132.47Z" style="fill: rgb(255, 255, 255); transform-origin: 235.435px 130.485px;" id="elb31r8eh493" class="animable"></path><path d="M228.21,132.47a5.13,5.13,0,0,0-3.2,5s-4.5-5.28-.84-9.27a13.28,13.28,0,0,1,3.14-1.17S226.21,129.23,228.21,132.47Z" style="fill: rgb(255, 255, 255); transform-origin: 225.473px 132.25px;" id="elt89q0v1qf2m" class="animable"></path><path d="M228.55,135.68h-1.29c-.42.72-1,10.1-1.23,15.09a44.67,44.67,0,0,0,2.71,8.49.42.42,0,0,0,0,.1c.07.16.14.31.22.46.14.3.28.6.44.88a56.41,56.41,0,0,1,2.15-9.13C230.23,145.79,228.55,135.68,228.55,135.68Z" style="fill: rgb(38, 50, 56); transform-origin: 228.79px 148.19px;" id="el9w24m891ask" class="animable"></path><g id="elbw5pf9r44c"><path d="M226.32,119.48l3.28-5.81c.06.14.14.31.22.47a15.93,15.93,0,0,1,.7,2.23c.6,2.59-1.4,6.27-3.61,8-.09-.16-.17-.33-.26-.5a10,10,0,0,0-1.51-2.32l-.13-.1Z" style="opacity: 0.2; transform-origin: 227.819px 119.02px;" class="animable"></path></g><path d="M210.34,107c-.79-3.55,4.86-8.46,4.86-8.46l-6.69-2.33C205.49,98.38,207.45,104.57,210.34,107Z" style="fill: rgb(38, 50, 56); transform-origin: 211.098px 101.605px;" id="ellw8fhp7699b" class="animable"></path><path d="M232.88,96.74c1.58,8.88,3,14-.34,19.67a11.71,11.71,0,0,1-20.73-.6c-3.75-7.32-5.7-20.6,1.93-26.43A11.85,11.85,0,0,1,232.88,96.74Z" style="fill: rgb(255, 139, 123); transform-origin: 221.542px 104.568px;" id="el81lzq38twhy" class="animable"></path><path d="M233,105.72l-4.2-1.15v-5.4s-5.31-3-4.49-6.75a41,41,0,0,1,1.71-6.2s8.42-.54,11,.54a18.29,18.29,0,0,1-2.17,2,19.14,19.14,0,0,1,5.1,5.22,7,7,0,0,0-2.88,1.39S238.17,102.78,233,105.72Z" style="fill: rgb(38, 50, 56); transform-origin: 232.087px 95.9025px;" id="eleanr1qq11i7" class="animable"></path><path d="M223.34,80.46c3.09,1.94,1.3,5.5,1.3,5.5l8.27.17C232.47,83.52,225.3,80.33,223.34,80.46Z" style="fill: rgb(38, 50, 56); transform-origin: 228.125px 83.2931px;" id="elqgu3rh8pmln" class="animable"></path><path d="M226.57,94.24c-.59,1.66-7.29,3.7-13.4,3.9a27.72,27.72,0,0,1-8.92-1.68,10.2,10.2,0,0,1,3-2.13c-3.69-.91-8.36-4.15-9.65-6.79A15.28,15.28,0,0,1,206,87a9,9,0,0,1-3.17-6.21s15.64,6.2,21.66,3.63c6.54-2.8,11.51,2.45,7.21,6.45S226.57,94.24,226.57,94.24Z" style="fill: rgb(38, 50, 56); transform-origin: 215.455px 89.465px;" id="elafyjv73sxx" class="animable"></path><path d="M237.66,103.17a8,8,0,0,1-1.79,5.4c-1.62,1.93-4.14.39-4.72-2-.52-2.17.16-5.52,2.29-6.56S237.55,100.74,237.66,103.17Z" style="fill: rgb(255, 139, 123); transform-origin: 234.326px 104.574px;" id="el1qeh7kqtfb6" class="animable"></path><path d="M219.36,105c.22.7,0,1.39-.4,1.56s-1-.27-1.23-1,0-1.39.4-1.56S219.13,104.26,219.36,105Z" style="fill: rgb(38, 50, 56); transform-origin: 218.543px 105.28px;" id="elv30et8alzd" class="animable"></path><path d="M211.61,107.8c.22.69,0,1.39-.4,1.55s-1-.26-1.23-1,0-1.39.4-1.55S211.38,107.1,211.61,107.8Z" style="fill: rgb(38, 50, 56); transform-origin: 210.793px 108.076px;" id="eld4luxkuehhh" class="animable"></path><path d="M214.26,107.43a23.4,23.4,0,0,1-.72,6.14,3.51,3.51,0,0,0,2.92-.69Z" style="fill: rgb(160, 39, 36); transform-origin: 215px 110.538px;" id="elf055ixszmrg" class="animable"></path><path d="M219,115.55a6.35,6.35,0,0,0,3.7-3.26.22.22,0,0,0-.12-.28.21.21,0,0,0-.28.11,6,6,0,0,1-4.21,3.24.21.21,0,0,0-.16.26.21.21,0,0,0,.25.16A6.54,6.54,0,0,0,219,115.55Z" style="fill: rgb(38, 50, 56); transform-origin: 220.318px 113.888px;" id="els2e7wskq9o" class="animable"></path><path d="M221.08,100.9a.43.43,0,0,0,.15-.15.42.42,0,0,0-.12-.59,4.15,4.15,0,0,0-3.86-.4.43.43,0,0,0,.37.78,3.25,3.25,0,0,1,3,.34A.43.43,0,0,0,221.08,100.9Z" style="fill: rgb(38, 50, 56); transform-origin: 219.153px 100.208px;" id="ele0nh0x4f5sn" class="animable"></path><path d="M210.07,103.59a.39.39,0,0,0,0-.21.43.43,0,0,0-.56-.23,4.1,4.1,0,0,0-2.52,2.94.43.43,0,0,0,.84.14,3.29,3.29,0,0,1,2-2.29A.43.43,0,0,0,210.07,103.59Z" style="fill: rgb(38, 50, 56); transform-origin: 208.537px 104.824px;" id="elf5rcij9a4vd" class="animable"></path><path d="M259.51,129.7c1.1,1.36,2.06,2.59,3,3.9s1.92,2.61,2.84,3.94c1.87,2.65,3.61,5.4,5.31,8.2s3.28,5.72,4.7,8.81a54.29,54.29,0,0,1,3.65,10,26.49,26.49,0,0,1,.78,6.12,23.55,23.55,0,0,1-.88,6.1,40.43,40.43,0,0,1-4.32,9.84c-.86,1.47-1.79,2.88-2.76,4.24s-2,2.68-3,3.95a68.45,68.45,0,0,1-6.79,7.18,3.43,3.43,0,0,1-5.25-4.28l.09-.15A115.84,115.84,0,0,0,265,181.79a35.43,35.43,0,0,0,2.24-7.65,13.72,13.72,0,0,0,.13-3.19,15.56,15.56,0,0,0-.68-3.1,46.17,46.17,0,0,0-3.25-7.4c-1.33-2.51-2.83-5-4.43-7.53s-3.28-5-5-7.43l-2.63-3.66c-.88-1.19-1.8-2.46-2.63-3.55l-.06-.08a6.86,6.86,0,0,1,10.78-8.5Z" style="fill: rgb(158, 0, 49); transform-origin: 263.505px 164.97px;" id="elzxjztj6juom" class="animable"></path><path d="M164.23,203.47l85.08-3.85a2,2,0,0,1,2.13,1.94l-89.15,4A2,2,0,0,1,164.23,203.47Z" style="fill: rgb(158, 0, 49); transform-origin: 206.864px 202.588px;" id="elsokw863cn5" class="animable"></path><g id="eln1ft4sntsjh"><g style="opacity: 0.6; transform-origin: 206.864px 202.588px;" class="animable"><path d="M164.23,203.47l85.08-3.85a2,2,0,0,1,2.13,1.94l-89.15,4A2,2,0,0,1,164.23,203.47Z" style="fill: rgb(255, 255, 255); transform-origin: 206.864px 202.588px;" id="el412ucutarqr" class="animable"></path></g></g><path d="M150.69,164l60.53-2.74a1.89,1.89,0,0,1,1.76,1.27L224.6,199.4a1,1,0,0,1-.93,1.38l-60.53,2.74a1.87,1.87,0,0,1-1.75-1.26l-11.62-36.88A1,1,0,0,1,150.69,164Z" style="fill: rgb(158, 0, 49); transform-origin: 187.185px 182.39px;" id="elpgm38xt8ia" class="animable"></path><g id="elz30z9km8kv"><path d="M150.69,164l60.53-2.74a1.89,1.89,0,0,1,1.76,1.27L224.6,199.4a1,1,0,0,1-.93,1.38l-60.53,2.74a1.87,1.87,0,0,1-1.75-1.26l-11.62-36.88A1,1,0,0,1,150.69,164Z" style="fill: rgb(255, 255, 255); opacity: 0.6; transform-origin: 187.185px 182.39px;" class="animable"></path></g><g id="el0887actvswzw"><path d="M213,162.52l11.62,36.87a1,1,0,0,1-.93,1.39l-12.45-39.53A1.89,1.89,0,0,1,213,162.52Z" style="fill: rgb(158, 0, 49); opacity: 0.5; transform-origin: 217.97px 181.015px;" class="animable"></path></g><g id="el4544y0n9wo1"><path d="M226.94,200.63l22.37-1a2,2,0,0,1,2.13,1.94L225,202.76A2,2,0,0,1,226.94,200.63Z" style="fill: rgb(158, 0, 49); opacity: 0.5; transform-origin: 238.218px 201.193px;" class="animable"></path></g><path d="M255.2,197.28l-5.72.83,5.86,8.15s9.31-1.49,8.23-5.62l-2-1.66A8.12,8.12,0,0,0,255.2,197.28Z" style="fill: rgb(255, 139, 123); transform-origin: 256.569px 201.72px;" id="el7uyy25vhl1y" class="animable"></path><polygon points="242.48 200.55 249.65 206.8 255.34 206.26 249.48 198.11 242.48 200.55" style="fill: rgb(255, 139, 123); transform-origin: 248.91px 202.455px;" id="elydulknukeci" class="animable"></polygon></g><defs>     <filter id="active" height="200%">         <feMorphology in="SourceAlpha" result="DILATED" operator="dilate" radius="2"></feMorphology>                <feFlood flood-color="#32DFEC" flood-opacity="1" result="PINK"></feFlood>        <feComposite in="PINK" in2="DILATED" operator="in" result="OUTLINE"></feComposite>        <feMerge>            <feMergeNode in="OUTLINE"></feMergeNode>            <feMergeNode in="SourceGraphic"></feMergeNode>        </feMerge>    </filter>    <filter id="hover" height="200%">        <feMorphology in="SourceAlpha" result="DILATED" operator="dilate" radius="2"></feMorphology>                <feFlood flood-color="#ff0000" flood-opacity="0.5" result="PINK"></feFlood>        <feComposite in="PINK" in2="DILATED" operator="in" result="OUTLINE"></feComposite>        <feMerge>            <feMergeNode in="OUTLINE"></feMergeNode>            <feMergeNode in="SourceGraphic"></feMergeNode>        </feMerge>            <feColorMatrix type="matrix" values="0   0   0   0   0                0   1   0   0   0                0   0   0   0   0                0   0   0   1   0 "></feColorMatrix>    </filter></defs></svg>	</div>
</div>
</body>
</html>
