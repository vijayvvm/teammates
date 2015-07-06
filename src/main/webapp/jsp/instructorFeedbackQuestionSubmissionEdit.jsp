<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="teammates.common.util.Const" %>
<%@ page import="teammates.ui.controller.FeedbackSubmissionEditPageData" %>

<%
    FeedbackSubmissionEditPageData data = (FeedbackSubmissionEditPageData)request.getAttribute("data");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>TEAMMATES - Submit Feedback Question</title>

	    <link rel="shortcut icon" href="/favicon.png" />
	
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	    <link type="text/css" href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	    <link type="text/css" href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
	    <link type="text/css" href="/stylesheets/teammatesCommon.css" rel="stylesheet"/>
	
	    <!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	
	    <script type="text/javascript" src="/js/googleAnalytics.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	    <script type="text/javascript" src="/js/common.js"></script>
	    <script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>

        <jsp:include page="../enableJS.jsp"></jsp:include>
	    
        <script type="text/javascript" src="/js/feedbackSubmissionsEdit.js"></script>
        <script type="text/javascript" src="/js/student.js"></script>
    </head>

    <body>
        <%
            if (!data.isHeaderHidden()) {
        %>
                <jsp:include page="<%= Const.ViewURIs.INSTRUCTOR_HEADER %>" />
        <%
            } else if (data.isPreview()) {
        %>
            <nav class="navbar navbar-default navbar-fixed-top">
                <h3 class="text-center">Previewing Session as Instructor <%= data.getPreviewInstructor().name %> (<%= data.getPreviewInstructor().email %>)</h3>
            </nav>
        <%
            }
        %>

        <div class="container" id="mainContent">
            <div id="topOfPage"></div>
            <h1>Submit Feedback Question</h1>
            <br>

            <form method="post" action="<%= Const.ActionURIs.INSTRUCTOR_FEEDBACK_QUESTION_SUBMISSION_EDIT_SAVE %>" name="form_submit_response">

                <jsp:include page="<%= Const.ViewURIs.FEEDBACK_SUBMISSION_EDIT %>" />

                <div class="bold align-center">
                    <%
                        if (data.bundle.questionResponseBundle.isEmpty()) {
                    %>
                            There are no questions for you to answer here!
                    <%
                        } else if (data.isPreview() || !data.isSessionOpenForSubmission()) {
                    %>
                            <input disabled="disabled" type="submit" class="btn btn-primary center-block" id="response_submit_button" data-toggle="tooltip" data-placement="top" title="<%= Const.Tooltips.FEEDBACK_SESSION_EDIT_SAVE %>" value="Submit Feedback">
                    <%
                        } else {
                    %>
                            <input type="submit" class="btn btn-primary center-block" id="response_submit_button" data-toggle="tooltip" data-placement="top" title="<%= Const.Tooltips.FEEDBACK_SESSION_EDIT_SAVE %>" value="Submit Feedback">
                    <%
                        }
                    %>
                </div>
                <br><br>
            </form>
        </div>

        <div id="frameBottom">
         
        </div>
    </body>
</html>
