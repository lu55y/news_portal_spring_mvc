<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="text/html; width=device-width, initial-scale=1">

    <!-- Page Stile CSS -->
    <link href="<c:url value="/resources/css/custom_style.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/http_cdn.jsdelivr.net_npm_bootstrap@5.0.2_dist_css_bootstrap.css"/>"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>News Portal Spring</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <div class="container-fluid">
        <a class="navbar-brand ms-5" href="${pageContext.request.contextPath}/news/home">Home</a>
        <input class="btn btn btn-outline-success" type="button" value="Add News"
               onclick="window.location.href='newsFormAdd'; return false;"/>
        <%--        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
              </form>
                </div>--%>
    </div>
</nav>

<%--Content--%>
<div class="wrapper">
    <div class="content d-flex w-100" style="flex-direction: column;">
        <div class="page-head">
            <c:if test="${param['newsId'] != null}">
                <h2>Editing news</h2>
            </c:if>
            <c:if test="${param['newsId'] == null}">
                <h2>Add news</h2>
            </c:if>
            <hr/>
        </div>
        <form:form action="saveNews" modelAttribute="news" method="post" style="margin: 30px;">
            <form:hidden path="id"/>
            <div class="mb-3" style="margin-bottom: 20px;">
                <label for="title" style="color: darkgray">Title</label>
                <form:textarea class="form-control p-1" id="title" name="title" maxlength="200"
                          placeholder="Please enter a title" style="height: 100px" path="title"/>
                <form:errors path="title" cssClass="error"/>
            </div>
            <div class="mb-3" style="margin-bottom: 20px;">
                <label for="brief" style="color: darkgray">Brief Description</label>
                <form:textarea class="form-control p-1" id="brief" name="brief" maxlength="300"
                          placeholder="Please enter a brief description" style="height: 200px" path="brief"/>
                <form:errors path="brief" cssClass="error"/>
            </div>
            <div class="mb-3" style="margin-bottom: 20px;">
                <label for="content" style="color: darkgray">Content</label>
                <form:textarea class="form-control p-1" id="content" name="content" maxlength="3000"
                          placeholder="Please enter a content" style="height: 400px" path="content"/>
                <form:errors path="content" cssClass="error"/>
            </div>
            <div class="mb-3" style="margin-bottom: 20px;">
                <label for="author" style="color: darkgray">Author</label>
                <form:textarea class="form-control p-1" id="author" name="author" maxlength="45"
                               placeholder="Please enter a title" path="author"/>
                <form:errors path="author" cssStyle="color: red"/>
            </div>
            <div class="d-flex justify-content-between" style="margin-right: 20px;margin-bottom: 10px">
                <div class="text-start">
                <h4>${news.date}</h4>
                </div>
                <div class="justify-content-end">
                    <input class="btn btn-secondary btn-sm me-3" type="submit" value="Save">
                </div>
            </div>
        </form:form>
    </div>
</div>
<%--Footer--%>
<div class="page-foot">
    &copy; 2021, Pavel Yatsevich
</div>
</body>
</html>
