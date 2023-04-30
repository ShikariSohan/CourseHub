<%-- <nav class="bg-gray-800 p-2 mt-0 w-full">--%>
<%--    <div class="container mx-auto flex flex-wrap items-center">--%>
<%--      <div class="flex w-full md:w-1/2 justify-center md:justify-start text-white font-extrabold">--%>
<%--        <a class="text-white text-2xl pl-2 no-underline hover:text-white hover:no-underline" href="/coursehub/dashboard">--%>
<%--          CourseHub--%>
<%--        </a>--%>
<%--      </div>--%>
<%--      <div class="flex w-full pt-2 content-center justify-between md:w-1/2 md:justify-end">--%>
<%--        <div class="px-4">--%>
<%--          <a class="text-white no-underline" href="/coursehub/profile">--%>
<%--           <button class="bg-green-500 hover:bg-green-600 text-white py-2 px-4 rounded">Profile</button>--%>
<%--          </a>--%>
<%--        </div>--%>
<%--        <div class="px-4">--%>
<%--          <form action="/coursehub/logout" method="post">--%>
<%--                 <button class="bg-red-500 hover:bg-red-600 text-white py-2 px-4 rounded">Logout</button>--%>
<%--          </form>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </nav>--%>
<nav id="header" class="w-full top-0 text-white" style="background-color: #9e0031;">
    <div class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 py-2">
        <div class="pl-4 flex items-center">
            <a class="toggleColour text-white no-underline hover:no-underline font-bold text-2xl lg:text-4xl" href="#">
                <svg class="h-12 fill-current inline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
                    <image href="./book.svg" x="0" y="0" width="100%" height="100%" />
                </svg>
                CourseHub
            </a>
        </div>
        <div class="w-full flex-grow lg:flex lg:items-center lg:w-auto hidden mt-2 lg:mt-0 bg-white lg:bg-transparent text-black p-4 lg:p-0 z-20" id="nav-content">
            <ul class="list-reset lg:flex justify-end flex-1 items-center">
                <li class="mr-3">
                    <a class="text-white no-underline" href="/coursehub/profile">
                        Profile
                    </a>
                </li>
            </ul>
            <button
                    onclick="location.href='/coursehub/logout'"
                    id="navAction"
                    class="mx-auto lg:mx-0 hover:underline bg-white text-gray-800 font-bold rounded-full mt-4 lg:mt-0 py-4 px-8 shadow opacity-75 focus:outline-none focus:shadow-outline transform transition hover:scale-105 duration-300 ease-in-out"
            >
                Logout
            </button>
        </div>
    </div>
    <hr class="border-b border-gray-100 opacity-25 my-0 py-0" />
</nav>
