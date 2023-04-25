 <nav class="bg-gray-800 p-2 mt-0 w-full">
    <div class="container mx-auto flex flex-wrap items-center">
      <div class="flex w-full md:w-1/2 justify-center md:justify-start text-white font-extrabold">
        <a class="text-white text-2xl pl-2 no-underline hover:text-white hover:no-underline" href="/coursehub/dashboard">
          CourseHub
        </a>
      </div>
      <div class="flex w-full pt-2 content-center justify-between md:w-1/2 md:justify-end">
        <div class="px-4">
          <a class="text-white no-underline" href="/coursehub/profile">
           <button class="bg-green-500 hover:bg-green-600 text-white py-2 px-4 rounded">Profile</button>
          </a>
        </div>
        <div class="px-4">
          <form action="/coursehub/logout" method="post">
                 <button class="bg-red-500 hover:bg-red-600 text-white py-2 px-4 rounded">Logout</button>
          </form>
        </div>
      </div>
    </div>
  </nav>