<%--
  Created by IntelliJ IDEA.
  User: 19767
  Date: 2018/11/19
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>宠物列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/layer/layer.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/cart.js"></script>
</head>
<body>
<!--header-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="1"></jsp:param>
</jsp:include>
<!--banner-->

<%--轮播--%>
<div class="banner" style="margin-top: 0px;padding-top: 0px">
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-top: 0px;">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="${scroll[0].cover}" alt="..." style="width: 100%;height: 600px">
                <div class="carousel-caption">
                    <h3>${scroll[0].intro}</h3>
                    <p>${scroll[0].name}</p>
                </div>
            </div>
            <div class="item">
                <img src="${scroll[1].cover}" alt="..." style="width: 100%;height: 600px">
                <div class="carousel-caption">
                    <h3>${scroll[1].intro}</h3>
                    <p>${scroll[1].name}</p>
                </div>
            </div>
            <div class="item">
                <img src="${scroll[2].cover}" alt="..." style="width: 100%;height: 600px">
                <div class="carousel-caption">
                    <h3>${scroll[2].intro}</h3>
                    <p>${scroll[2].name}</p>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

<!--//banner-->

<div class="subscribe2"></div>

<!--gallery-->
<div class="gallery">
    <div class="container">
        <div class="alert alert-danger">热销推荐</div>
        <div class="gallery-grids">
            <c:forEach items="${hotList}" var="g">
                <div class="col-md-4 gallery-grid glry-two">
                    <a href="<%=request.getContextPath()%>/goods_detail?id=${g.id}">
                        <img  style="width:100%;height:250px" src="${g.cover}" class="img-responsive" alt="${g.name}" width="350" height="350" />
                    </a>
                    <div class="gallery-info galrr-info-two">
                        <p>
                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                            <a href="<%=request.getContextPath()%>/goods_detail?id=${g.id}">查看详情</a>
                        </p>
                        <a class="shop" href="javascript:;" onclick="buy(${g.id})">立刻购买</a>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="galy-info">
                        <p>${g.typeName} > ${g.name}</p>
                        <div class="galry">
                            <div class="prices">
                                <h5 class="item_price">¥ ${g.price}</h5>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>

        <div class="clearfix"></div>
        <div class="alert alert-info">新宠推荐</div>
        <div class="gallery-grids">
            <c:forEach items="${newList}" var="g">
                <div class="col-md-4 gallery-grid ">
                    <a href="<%=request.getContextPath()%>/goods_detail?id=${g.id}">
<%--                       <img src="${g.cover}">--%>
                        <img style="width:100%;height:250px"src="${g.cover}" class="img-responsive" alt="${g.name}"/>
                    </a>
                    <div class="gallery-info galrr-info-two">
                        <p>
                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                            <a href="<%=request.getContextPath()%>/goods_detail?id=${g.id}">查看详情</a>
                        </p>
                        <a class="shop" href="javascript:;" onclick="buy(${g.id})">立刻购买</a>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="galy-info">
                        <p>${g.typeName} > ${g.name}</p>
                        <div class="galry">
                            <div class="prices">
                                <h5 class="item_price">¥ ${g.price}</h5>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>




        </div>
    </div>
</div>
<!--//gallery-->

<!--subscribe-->
<div class="subscribe"></div>
<!--//subscribe-->


<!--footer-->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>