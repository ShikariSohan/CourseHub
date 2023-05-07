<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<script>
    let isDiv2Visible = false; // Keep track of whether div2 is currently visible

    function replaceDivs() {
        const div1 = document.getElementById('div1');
        const div2 = document.getElementById('div2');

        if (isDiv2Visible) {
            // Fade out div2
            div2.style.opacity = '0';
            div2.style.pointerEvents = 'none';

            // Wait for the transition to finish before hiding div2 and showing div1
            setTimeout(() => {
                div2.style.display = 'none';
                div1.style.display = 'block';
                div1.style.opacity = '1';
                div1.style.pointerEvents = 'auto';
            }, 500);

            isDiv2Visible = false;
        } else {
            // Set div2 to be visible
            div2.style.display = 'block';
            div2.style.opacity = '1';
            div2.style.pointerEvents = 'auto';

            // Fade out div1
            div1.style.opacity = '0';
            div1.style.pointerEvents = 'none';

            // Wait for the transition to finish before hiding div1
            setTimeout(() => {
                div1.style.display = 'none';
            }, 700);

            isDiv2Visible = true;
        }
    }



</script>

<body class="bg-gray-100">
<div class="relative" id="container">
<nav id="header" class="fixed w-full z-30 top-0 text-white bg-gray-700">
  <div class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 py-2">
    <div class="pl-4 flex items-center">
      <a class="toggleColour text-white no-underline hover:no-underline font-bold text-2xl lg:text-4xl" href="#">
        <svg class="h-12 fill-current inline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
          <image href="./book.svg" x="0" y="0" width="100%" height="100%" />
        </svg>
        CourseHub
      </a>
    </div>
    <div class="block lg:hidden pr-4">
      <button id="nav-toggle" class="flex items-center p-1 text-pink-800 hover:text-gray-900 focus:outline-none focus:shadow-outline transform transition hover:scale-105 duration-300 ease-in-out">
        <svg class="fill-current h-6 w-6" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <title>Menu</title>
          <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z" />
        </svg>
      </button>
    </div>
    <div class="w-full flex-grow lg:flex lg:items-center lg:w-auto hidden mt-2 lg:mt-0 bg-white lg:bg-transparent text-black p-4 lg:p-0 z-20" id="nav-content">
      <ul class="list-reset lg:flex justify-end flex-1 items-center">
        <li class="mr-3">
        </li>
      </ul>
      <button
              onclick="location.href='/coursehub/login'"
              id="navAction"
              class="mx-auto lg:mx-0 hover:underline bg-white text-gray-800 font-bold rounded-full mt-4 lg:mt-0 py-4 px-8 shadow opacity-75 focus:outline-none focus:shadow-outline transform transition hover:scale-105 duration-300 ease-in-out"
      >
        Login
      </button>
    </div>
  </div>
  <hr class="border-b border-gray-100 opacity-25 my-0 py-0" />
</nav>
    <div class="min-h-screen flex justify-center items-center mt-1">
        <div id="div1" class="absolute transition-opacity duration-500 ml-10">
            <form action="/coursehub/register" method="post">
                <div class="py-12 px-12 bg-white rounded-2xl shadow-xl z-20 mt-2">
                    <div>
                        <h1 class="text-3xl font-bold text-center mb-4 cursor-pointer">Create a Student Account</h1>
                    </div>
                    <div class="space-y-4">
                        <div class="flex justify-center items-center">
                            <button onclick="replaceDivs()" class="text-center py-2 w-64 text-sm text-black bg-gray-300 rounded-2xl">Register As a Teacher?</button>
                        </div>
                        <input type="hidden" name="role" value="student">
                        <input type="text" name="username" placeholder="Registration No" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required />
                        <input type="text" name="name" placeholder="Name" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required />
                        <input type="email" name="email" placeholder="Email" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required/>
                        <input type="password" name="password" placeholder="Password" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required />
                        <div class="relative">
                            <select name="dept" class="block appearance-none w-full py-3 px-4 pr-8 rounded-lg border outline-none text-gray-700 leading-tight focus:outline-none focus:border-blue-500">
                                <option value="" disabled selected>Select your department</option>
                                <% for (String dept : (String[]) request.getAttribute("depts")) { %>
                                <option value="<%= dept %>"><%= dept %></option>
                                <% } %>
                            </select>
                            <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                                <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                    <path d="M10 12a.997.997 0 0 1-.707-.293l-3.999-3.999a.999.999 0 1 1 1.414-1.414L10 9.586l3.292-3.292a.999.999 0 1 1 1.414 1.414l-3.999 3.999A.997.997 0 0 1 10 12z"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <div class="text-center mt-6">
                        <button type="submit" class="py-3 w-64 text-xl text-white bg-red-500 rounded-2xl">Register</button>
                        <p class="mt-4 text-sm">Already Have An Account? <span class="underline cursor-pointer"> <a href="/coursehub/login">Log In </a></span>
                        </p>
                    </div>

                </div>

            </form>

        </div>

        <! newdiv with diff text>
        <div id="div2" class="absolute transition-opacity ml-10 duration-500 opacity-0 pointer-events-none">
            <form action="/coursehub/register" method="post">

                <div class="py-12 px-12 rounded-2xl shadow-xl z-20 mt-2">
                    <div>
                        <h1 class="text-3xl font-bold text-center mb-4 cursor-pointer">Create a Teacher account</h1>
                    </div>
                    <div class="space-y-4">
                        <div class="flex justify-center items-center">
                            <button onclick="replaceDivs()" class="text-center py-2 w-64 text-sm text-black bg-gray-300 rounded-2xl mt-2">Register As a Student?</button>
                        </div>
                        <input type="hidden" name="role" value="teacher">
                        <input type="text" name="username" placeholder="Username" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required/>
                        <input type="text" name="name" placeholder="Name" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required/>
                        <input type="email" name="email" placeholder="Email" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required/>
                        <input type="password" name="password" placeholder="Password" class="block text-sm py-3 px-4 rounded-lg w-full border outline-none" required/>
                        <div class="relative">
                            <select name="dept" class="block appearance-none w-full py-3 px-4 pr-8 rounded-lg border outline-none text-gray-700 leading-tight focus:outline-none focus:border-blue-500">
                                <option value="" disabled selected>Select your department</option>
                                <% for (String dept : (String[]) request.getAttribute("depts")) { %>
                                <option value="<%= dept %>"><%= dept %></option>
                                <% } %>
                            </select>
                            <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                                <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                    <path d="M10 12a.997.997 0 0 1-.707-.293l-3.999-3.999a.999.999 0 1 1 1.414-1.414L10 9.586l3.292-3.292a.999.999 0 1 1 1.414 1.414l-3.999 3.999A.997.997 0 0 1 10 12z"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <div class="text-center mt-6">
                        <button onclick="replaceDivs()" class="py-3 w-64 text-xl text-white bg-red-800 rounded-2xl">Register</button>
                        <p class="mt-4 text-white text-sm">Already Have An Account? <span class="underline cursor-pointer"><a href="/coursehub/login">Log In</a></span>
                        </p>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<footer class="bg-white mt-[-9rem]">
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