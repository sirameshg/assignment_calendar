<%-- 
    Document   : calendar
    Created on : Feb 11, 2022, 1:01:26 PM
    Author     : giaki
--%>
<%@page import="model.calendar.EventCalendar"%>
<%@page import="model.calendar.CategoryCalendar"%>
<%@page import="model.calendar.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../base/header.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.css">
        <%
            ArrayList<EventCalendar> events = (ArrayList<EventCalendar>) request.getAttribute("events");
            ArrayList<Calendar> calendars = (ArrayList<Calendar>) request.getAttribute("calendars");
            ArrayList<CategoryCalendar> listCategory = (ArrayList<CategoryCalendar>) request.getAttribute("listCategory");
        %>
    </head>
    <style>
        .fc-button-primary{
            background-color: #fff!important;
            border-color: #fff!important;
            color: black!important;
            padding: 10px 15px!important;
            box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
        }

        .fc-button-primary:focus{
            box-shadow: none!important;
        }
        .fc-button-group .fc-button{
            margin: 0 2px!important;
            border-radius: 10px!important;
        }

        .fc-view .fc-col-header-cell{
            padding-top: 10px!important;
            padding-bottom: 10px!important;
        }

        .fc-theme-standard td, .fc-theme-standard th{
            border: 1px solid #ebebeb;
        }

        .fc-daygrid-event{
            opacity: 0.7!important;
        }

        .fc-daygrid-day-top{
            font-size: 18px;
        }

        .fc-col-header-cell-cushion {
            font-size: 20px;
            font-weight: 400!important;
        }

        .fc-event-time{
            font-size: 16px;
        }

        .fc-event-title{
            font-size: 16px;
        }

        .fc .fc-bg-event{
            opacity: 0.4!important;
        }
        .fc-bg-event.fc-event .fc-event-title{
            font-weight: bold;
            font-size: 16px;
        }
        a.fc-event.hidden {
            display: none;
        }
        @media only screen and (max-width: 800px) {
            #navBarCalendar {
                display: none;
            }
        }
    </style>
    <body>
        <div class="ml-auto pt-4 max-h-screen">
            <div class="flex" >
                <div class="w-60 md:w-64 lg:w-80 px-6 pt-3" id="navBarCalendar">
                    <div class="mb-5">
                        <div class="mb-5 flex justify-between">
                            <h2 class="text-xl">Category</h2>
                        </div>
                        <fieldset>
                            <c:forEach items="${listCategory}" var="category">
                                <div class="flex justify-between items-center  mb-2">
                                    <div class="flex items-center">
                                        <input id="category-${category.getId()}" value="${category.getId()}" name="filter-event-category" aria-describedby="checkbox-1" type="checkbox" class="w-4 h-4 border-[#1c64f2] bg-white checked:bg-[#1c64f2] checked:border-[#1c64f2] bg-gray-100 rounded border-gray-300 focus:ring-blue-500" checked>
                                        <label for="category-${category.getId()}" class="ml-3 text-md font-medium">${category.getName()}</label>
                                    </div>
                                </div>
                            </c:forEach>
                        </fieldset>
                    </div>
                    <div class="mb-5 w-full relative">
                        <div class="flex lg:justify-center">
                            <button type="button" id="buttonOpenAddEvent" class="flex items-center text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                                <span class="text-lg mr-2">Add Event</span><svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                            </button>
                        </div>
                        <div id="addEventFormContainer" class="hidden w-60 md:w-64 lg:w-80 absolute -top-[300%] left-[90%] z-[1000]">
                            <div>
                                <jsp:include page="addEvent.jsp" />
                            </div>
                        </div>
                    </div>
                    <div class="mb-5">
                        <div class="mb-5 flex justify-between">
                            <h2 class="text-xl">My Calendars</h2>
                            <button type="button" data-modal-toggle="addCalendar-modal">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                            </button>
                        </div>
                        <fieldset>
                            <c:forEach items="${calendars}" var="calendar">
                                <div class="flex justify-between items-center  mb-2 calendar-item-${calendar.getId()}">
                                    <div class="flex items-center">
                                        <input id="calendar-${calendar.getId()}" value="${calendar.getId()}" name="filter-event-calendar" aria-describedby="checkbox-1" type="checkbox" class="w-4 h-4 border-[${calendar.getColor()}] bg-white checked:bg-[${calendar.getColor()}] checked:border-[${calendar.getColor()}] bg-gray-100 rounded border-gray-300 focus:ring-blue-500" checked>
                                        <label for="calendar-${calendar.getId()}" class="ml-3 text-md font-medium">${calendar.getName()}</label>
                                    </div>
                                    <div class="flex justify-end items-center">
                                        <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm inline-flex items-center p-1.5" data-modal-toggle="confirm-delete-calendar-modal" onclick="deleteCalendar(${calendar.getId()})">
                                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                        </button>
                                        <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm inline-flex items-center p-1.5" data-modal-toggle="editCalendar-modal" onclick="editSetValueCalendar({id: ${calendar.getId()}, name:'${calendar.getName()}', color: '${calendar.getColor()}' })">
                                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path></svg>
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </fieldset>
                    </div>
                </div>
                <div class="w-full">
                    <div id="calendar" class="max-h-[93vh] w-full"></div>
                </div>
            </div>
        </div>
        <jsp:include page="addCalendar.jsp" />


        <div class="hidden overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center md:inset-0 h-modal sm:h-full" id="confirm-delete-calendar-modal">
            <div class="relative px-4 w-full max-w-md h-full md:h-auto">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow">
                    <!-- Modal header -->
                    <div class="flex justify-end p-2">
                        <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="confirm-delete-calendar-modal">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="p-6 pt-0 text-center">
                        <svg class="mx-auto mb-4 w-14 h-14 text-gray-400 dark:text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Are you sure you want to delete calendar?</h3>
                        <button data-modal-toggle="confirm-delete-calendar-modal" id="confirm-delete-calendar" type="button" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                            Yes, I'm sure
                        </button>
                        <button data-modal-toggle="confirm-delete-calendar-modal" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:ring-gray-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">No, cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="z-[10000] fixed bottom-8 right-8" id="toast">
        </div>
        <jsp:include page="infoEvent.jsp" />
        <jsp:include page="editCalendar.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js"></script>
        <script src="/assets/js/calendar/calendar.js"></script>
        <script>
            var events = []
            <c:forEach items="${events}" var="event">
                events.push({
                id: ${event.getId()},
                title: `${event.getTitle()}`,
                start: new Date("${event.getAdditional().getStartDate()}").toISOString(),
                end: new Date("${event.getAdditional().getEndDate()}").toISOString(),
                color: `${event.getAdditional().getCalendar().getColor()}`,
                description: `${event.getDescription()}`,
                location: `${event.getLocation()}`,
                overlap: ${event.getAdditional().isOverlap()},
                category: ${event.getAdditional().getCategory().getId()},
                categoryName: "${event.getAdditional().getCategory().getName()}",
                status: "${event.getAdditional().getStatus().getId()}",
                statusName: "${event.getAdditional().getStatus().getName()}",
                allDay: ${event.getAdditional().isIsAllDay()},
                hasEnd: ${event.getAdditional().isIsHasEnd()},
                calendarName: "${event.getAdditional().getCalendar().getName()}",
                calendar: ${event.getAdditional().getCalendar().getId()},
                additional: ${event.getAdditional().getId()},
                <c:if test="${event.getAdditional().getDisplay() != null}">
                display: "${event.getAdditional().getDisplay()}",    
                </c:if>
            })
            </c:forEach>
        </script>
        <script src="/assets/js/calendar/event.js"></script>
        <script>
            const socketUrl = 'ws://' + window.location.host + '/ws/calendar/${sessionScope.user.username}'
        </script>
        <script src="/assets/js/calendar/websocket.js"></script>
    </body>
</html>
<jsp:include page="../base/footer.jsp" />