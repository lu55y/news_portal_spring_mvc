<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <div class="content w-100">
        <div class="page-head">
            <h1>News Portal</h1>
            <br/>
        </div>
        <div class="last-news" style="max-width: 800px;">
            <c:forEach var="news" items="${listNews}">
                <%-- Params link  --%>
                <c:url var="updateLink" value="/news/newsFormUpdate">
                    <c:param name="newsId" value="${news.id}"/>
                </c:url>
                <c:url var="deleteLink" value="/news/deleteSelected">
                    <c:param name="newsId" value="${news.id}"/>
                </c:url>
                <c:url var="readLink" value="/news/readSelected">
                    <c:param name="newsId" value="${news.id}"/>
                </c:url>
                <div class="p-2 mb-1">
                    <div class="news-head">
                        <a class="fs-5" href="${readLink}">${news.title}</a>
                        <div>
                            <p class="fs-6 ms-1 mt-3">${news.brief}</p>
                        </div>
                    </div>
                    <hr/>
                    <div class="news-foot-admin">
                        <div class="d-flex">
                            <div class="foot-button-grp justify-content-start">
                                <a class="btn btn-secondary btn-sm me-4" href="${updateLink}">Update</a>
                                <a class="btn btn-secondary btn-sm me-4" href="${deleteLink}">Delete</a>
                            </div>
                            <div class="foot-status-grp justify-content-end">
                                <div>${news.date}</div>
                            </div>
                        </div>
                        <div class="text-end">
                            <h6 class="ms-3 mt-1 mb-1 fst-italic">Author: ${news.author}</h6>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>


<div class="page-foot">
    &copy; 2021, Pavel Yatsevich
</div>
</body>
</html>
