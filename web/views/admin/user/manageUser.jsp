<%-- 
    Document   : manageUser
    Created on : Feb 23, 2022, 10:01:46 PM
    Author     : giaki
--%>

<%@page import="model.common.Pagination"%>
<%@page import="model.auth.User"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin user</title>
        <link rel="stylesheet" href="/assets/lib/fullcalendar/main.min.css">
        <%
            ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
            Pagination pagination = (Pagination) request.getAttribute("pagination");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50" style="min-width: 250px">
                <jsp:include page="../base/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5">
                <div class="mb-6">
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center text-xl">
                                <a href="/admin" class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path></svg>
                                    Admin
                                </a>
                            </li>
                            <li aria-current="page">
                                <div class="flex items-center">
                                    <svg class="w-6 h-6 text-gray-400 text-xl" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                    <span class="ml-1 text-sm font-medium text-gray-400 md:ml-2 dark:text-gray-500">User</span>
                                </div>
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="flex flex-col">
                    <div class="overflow-x-auto shadow-md sm:rounded-lg">
                        <div class="inline-block min-w-full align-middle">
                            <div class="p-4">
                                <label for="table-search" class="sr-only">Search</label>
                                <form action="/admin/users" method="GET">
                                    <div class="relative mt-1">
                                        <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                            <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
                                        </div>
                                        <input type="text" name="q" id="search" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-80 pl-10 p-2.5" placeholder="Search for items">
                                    </div>
                                </form>
                            </div>
                            <div class="overflow-hidden">
                                <c:if test="${users.size()<=0}">
                                    <div class="min-h-[80vh] text-center flex justify-center items-center">
                                        <h3 class="text-5xl">Not Found!</h3>
                                    </div>
                                </c:if>
                                <table class="${users.size()<=0?"hidden":""} min-w-full divide-y divide-gray-200 table-fixed">
                                    <thead class="bg-gray-100">
                                        <tr>
                                            <th scope="col" class="p-4">
                                                <div class="flex items-center">
                                                    <input id="checkbox-search-all" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500focus:ring-2">
                                                    <label for="checkbox-search-all" class="sr-only">checkbox</label>
                                                </div>
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                id
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                avatar
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                username
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                email
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                phone
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                name
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                birthday
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                                gender
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-center text-gray-700 uppercase">
                                                permission
                                            </th>
                                            <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-center text-gray-700 uppercase">
                                                action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody class="bg-white divide-y divide-gray-200" id="tbodyUser">
                                        <c:forEach items="${users}" var="user">
                                            <tr class="hover:bg-gray-100" id="user-item-${user.getId()}">
                                                <td class="p-4 w-4">
                                                    <div class="flex items-center">
                                                        <input id="checkbox-search-1" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500 focus:ring-2">
                                                        <label for="checkbox-search-1" class="sr-only">checkbox</label>
                                                    </div>
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">${user.getId()}</td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                                    <div class="rounded-full w-7 h-7 overflow-hidden">
                                                        <c:if test="${user.getAvatar()!=null}">
                                                            <img class="w-full h-full" src="/assets/images/user/${user.getAvatar()}"/>
                                                        </c:if>
                                                        <c:if test="${user.getAvatar()==null}">
                                                            <img class="w-full h-full" src="/assets/images/default.png"/>
                                                        </c:if>
                                                    </div>
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">${user.getUsername()}</td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-500 whitespace-nowrap">${user.getEmail()}</td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">${user.getPhone()}</td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">${user.getFirst_name()} ${user.getLast_name()}</td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">${user.getBirthday()}</td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                                    <c:if test="${user.getGender()}">
                                                        Male
                                                    </c:if>
                                                    <c:if test="${!user.getGender()}">
                                                        Female
                                                    </c:if>
                                                </td>
                                                <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap text-center">${user.getPermission()}</td>
                                                <td class="py-4 px-6 text-sm font-medium whitespace-nowrap text-center">
                                                    <button onclick="showCalendar(${user.id})" class="mr-3 text-green-600 font-medium text-sm hover:underline">calendar</button>
                                                    <a href="/admin/users/edit?id=${user.getId()}" class="text-blue-600 hover:underline">Edit</a>
                                                    <a href="/admin/users/delete?id=${user.getId()}" class="ml-3 text-red-600 hover:underline">Delete</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-10 w-full flex justify-center">
                    <nav aria-label="Page navigation example">
                        <ul class="inline-flex -space-x-px">
                            <li>
                                <a href="/admin/users?page=<%=pagination.getPrev()%>" data="<%=pagination.getPrev()%>" class="pagination-link py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Previous</a>
                            </li>
                            <c:if test="${pagination.getPageIndex()>2}">
                                <li>
                                    <a href="/admin/users?page=<%=pagination.getPageIndex() - 2%>" data="<%=pagination.getPageIndex() - 2%>" class="pagination-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"><%=pagination.getPageIndex() - 2%></a>
                                </li>
                            </c:if>
                            <c:if test="${pagination.getPageIndex()>1}">
                                <li>
                                    <a href="/admin/users?page=<%=pagination.getPageIndex() - 1%>" data="<%=pagination.getPageIndex() - 1%>" class="pagination-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"><%=pagination.getPageIndex() - 1%></a>
                                </li>
                            </c:if>
                            <li>
                                <a href="/admin/users?page=<%=pagination.getPageIndex()%>" data="<%=pagination.getPageIndex()%>" aria-current="page" class="pagination-link py-2 px-3 text-blue-600 bg-blue-50 border border-gray-300 hover:bg-blue-100 hover:text-blue-700 dark:border-gray-700 dark:bg-gray-700 dark:text-white"><%=pagination.getPageIndex()%></a>
                            </li>
                            <c:if test="${pagination.getPageIndex()<pagination.getCount()}">
                                <li>
                                    <a href="/admin/users?page=<%=pagination.getPageIndex() + 1%>" data="<%=pagination.getPageIndex() + 1%>" class="pagination-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"><%=pagination.getPageIndex() + 1%></a>
                                </li>
                            </c:if>
                            <c:if test="${pagination.getPageIndex()+1<pagination.getCount()}">
                                <li>
                                    <a href="/admin/users?page=<%=pagination.getPageIndex() + 2%>" data="<%=pagination.getPageIndex() + 2%>" class="pagination-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"><%=pagination.getPageIndex() + 2%></a>
                                </li>
                            </c:if>
                            <li>
                                <a href="/admin/users?page=<%=pagination.getNext()%>" data="<%=pagination.getNext()%>" class="pagination-link py-2 px-3 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <script src="/assets/lib/fullcalendar/main.min.js"></script>
                <button id="button-calendar-model" data-modal-toggle="calendar-modal" class="hidden block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button" >
                    Toggle modal
                </button>
                <div id="calendar-modal" class="hidden overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-2 z-50 justify-center items-center h-modal" >
                    <div class="relative px-4 w-[90%]">
                        <!-- Modal content -->
                        <div class="relative bg-white  min-h-[83vh] rounded-lg shadow">
                            <!-- Modal header -->
                            <div class="flex justify-end p-2">
                                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="calendar-modal">
                                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                </button>
                            </div>
                            <!-- Modal body -->
                            <div class="p-6 pt-0 text-center" id="calendar-user-contenr">
                                <div class="max-h-[83vh]">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>     
        <script>
            const url_string = window.location.href;
            const url = new URL(url_string);
            const search = url.searchParams.get("q");
            const paginationLinks = document.querySelectorAll(".pagination-link");
            if (paginationLinks) {
                paginationLinks.forEach(item => {
                    var search = location.search.substring(1);
                    const params = search ? JSON.parse('{"' + decodeURI(search).replace(/"/g, '\\"')
                            .replace(/&/g, '","').replace(/=/g, '":"') + '"}') : {};
                    console.log(params);
                    const page = item.getAttribute("data"); // lấy số number page
                    params.page = page;
                    const href = decodeURIComponent(new URLSearchParams(params).toString());
                    item.setAttribute("href", "?" + href);
                })
            }
        </script>
        <script>

            function showCalendar(id) {
                $("#button-calendar-model").click();
                $.ajax({
                    method: "GET",
                    url: "/admin/users/calendar",
                    data: {id: id},
                }).done(function (data) {
                    console.log(data);
                    $("#calendar-user-contenr").html(data);
                })
            }
        </script>
        <jsp:include page="../base/footer.jsp" />
    </body>
</html>
