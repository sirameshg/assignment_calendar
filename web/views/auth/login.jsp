<%-- 
    Document   : login
    Created on : Jan 21, 2022, 11:50:53 AM
    Author     : giaki
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login Calendar</title>
        <link rel="icon" id="favicon256" sizes="256x256" type="image/x-icon" href="/assets/images/icon.ico">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.3.3/dist/flowbite.min.css" />
        <%
            String error = (String)request.getAttribute("error");
        %>
    </head>
    <body>
        <div class="flex items-center justify-center min-h-screen bg-gray-5z0">
            <div class="px-10 py-10 mt-4 text-left bg-white shadow-lg rounded-lg">
                <div class="flex justify-center">
                     <img src="/assets/images/icon.ico" style="width: 50px"/>
                </div>
                <h3 class="text-4xl font-bold text-center mt-3">Login</h3>
                <form action="/login" autocomplete="off" method="POST">
                    <div class="mt-6 sm:w-80 md:w-96">
                        <c:if test="${error!=null}">
                        <div>
                            <div class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                                <%=error%>
                            </div>
                        </div>
                        </c:if>
                        <div>
                            <label class="block" for="username">Username or Email</label>
                            <input type="text" placeholder="Username or Email" autocomplete="off" name="username" required
                                   class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div>
                        <div class="mt-4">
                            <label class="block">Password</label>
                            <input type="password" placeholder="Password" autocomplete="off" name="password" required
                                   class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div>
                        <div class="flex items-baseline justify-between mt-4">
                            <button class="px-6 py-2 mt-4 text-white bg-blue-600 rounded-lg hover:bg-blue-900">Login</button>
                            <div class="ml-5">
                                <a href="/signup" class="text-sm text-blue-600 hover:underline">Signup</a>
                                <span>/</span>
                                <a href="/password/forgot" class="text-sm text-blue-600 hover:underline">Forgot password?</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
         <script src="https://unpkg.com/flowbite@1.3.3/dist/flowbite.js"></script>
    </body>
</html>