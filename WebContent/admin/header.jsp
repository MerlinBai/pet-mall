
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default" role="navigation" style="background-color: rgba(112, 111, 111,0);border:0px ">
    <div class="container-fluid" style="background-color: #706f6f; border-radius: 20px">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp" style="color: white">宠物购物商城后台</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li ><a href="<%=request.getContextPath()%>/admin/order_list" style="color: white">订单管理</a></li>
                <li ><a href="<%=request.getContextPath()%>/admin/user_list" style="color: white">客户管理</a></li>
                <li ><a href="<%=request.getContextPath()%>/admin/goods_list" style="color: white">宠物管理</a></li>
                <li ><a href="<%=request.getContextPath()%>/admin/type_list" style="color: white">类目管理</a></li>
                <li><a href="<%=request.getContextPath()%>/user_logout" style="color: white">退出</a></li>
            </ul>
        </div>

    </div>
</nav>
