<%-- 
    Document   : reviewtable
    Created on : Sep 25, 2022, 2:16:29 PM
    Author     : Georgekutty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <style>
          body{
background:#dcdcdc;    
}
.total-like-user-main a {
    display: inline-block;
    margin: 0 -17px 0 0;
}
.total-like {
    border: 1px solid;
    border-radius: 50px;
    display: inline-block;
    font-weight: 500;
    height: 34px;
    line-height: 33px;
    padding: 0 13px;
    vertical-align: top;
}
.restaurant-detailed-ratings-and-reviews hr {
    margin: 0 -24px;
}
.graph-star-rating-header .star-rating {
    font-size: 17px;
}
.progress {
    background: #f2f4f8 none repeat scroll 0 0;
    border-radius: 0;
    height: 30px;
}
.rating-list {
    display: inline-flex;
    margin-bottom: 15px;
    width: 100%;
}
.rating-list-left {
    height: 16px;
    line-height: 29px;
    width: 10%;
}
.rating-list-center {
    width: 80%;
}
.rating-list-right {
    line-height: 29px;
    text-align: right;
    width: 10%;
}
.restaurant-slider-pics {
    bottom: 0;
    font-size: 12px;
    left: 0;
    z-index: 999;
    padding: 0 10px;
}
.restaurant-slider-view-all {
    bottom: 15px;
    right: 15px;
    z-index: 999;
}
.offer-dedicated-nav .nav-link.active,
.offer-dedicated-nav .nav-link:hover,
.offer-dedicated-nav .nav-link:focus {
    border-color: #3868fb;
    color: #3868fb;
}
.offer-dedicated-nav .nav-link {
    border-bottom: 2px solid #fff;
    color: #000000;
    padding: 16px 0;
    font-weight: 600;
}
.offer-dedicated-nav .nav-item {
    margin: 0 37px 0 0;
}
.restaurant-detailed-action-btn {
    margin-top: 12px;
}
.restaurant-detailed-header-right .btn-success {
    border-radius: 3px;
    height: 45px;
    margin: -18px 0 18px;
    min-width: 130px;
    padding: 7px;
}
.text-black {
    color: #000000;
}
.icon-overlap {
    bottom: -23px;
    font-size: 74px;
    opacity: 0.23;
    position: absolute;
    right: -32px;
}
.menu-list img {
    width: 41px;
    height: 41px;
    object-fit: cover;
}
.restaurant-detailed-header-left img {
    width: 88px;
    height: 88px;
    border-radius: 3px;
    object-fit: cover;
    box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075)!important;
}
.reviews-members .media .mr-3 {
    width: 56px;
    height: 56px;
    object-fit: cover;
}
.rounded-pill {
    border-radius: 50rem!important;
}
.total-like-user {
    border: 2px solid #fff;
    height: 34px;
    box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075)!important;
    width: 34px;
}
.total-like-user-main a {
    display: inline-block;
    margin: 0 -17px 0 0;
}
.total-like {
    border: 1px solid;
    border-radius: 50px;
    display: inline-block;
    font-weight: 500;
    height: 34px;
    line-height: 33px;
    padding: 0 13px;
    vertical-align: top;
}
.restaurant-detailed-ratings-and-reviews hr {
    margin: 0 -24px;
}
.graph-star-rating-header .star-rating {
    font-size: 17px;
}
.progress {
    background: #f2f4f8 none repeat scroll 0 0;
    border-radius: 0;
    height: 30px;
}
.rating-list {
    display: inline-flex;
    margin-bottom: 15px;
    width: 100%;
}
.rating-list-left {
    height: 16px;
    line-height: 29px;
    width: 10%;
}
.rating-list-center {
    width: 80%;
}
.rating-list-right {
    line-height: 29px;
    text-align: right;
    width: 10%;
}
.restaurant-slider-pics {
    bottom: 0;
    font-size: 12px;
    left: 0;
    z-index: 999;
    padding: 0 10px;
}
.restaurant-slider-view-all {
    bottom: 15px;
    right: 15px;
    z-index: 999;
}

.progress {
    background: #f2f4f8 none repeat scroll 0 0;
    border-radius: 0;
    height: 30px;
}


  
        </style>
    </head>
    <body>
          <div class="reviews-members pt-4 pb-4">
                        <div class="media">
                            <a href="#"><img alt="Generic placeholder image" src="http://bootdey.com/img/Content/avatar/avatar6.png" class="mr-3 rounded-pill"></a>
                            <div class="media-body">
                                <div class="reviews-members-header">
                                    <span class="star-rating float-right">
                                          <a href="#"><i class="icofont-ui-rating active"></i></a>
                                          <a href="#"><i class="icofont-ui-rating active"></i></a>
                                          <a href="#"><i class="icofont-ui-rating active"></i></a>
                                          <a href="#"><i class="icofont-ui-rating active"></i></a>
                                          <a href="#"><i class="icofont-ui-rating"></i></a>
                                          </span>
                                    <h6 class="mb-1"><a class="text-black" href="#">Gurdeep Singh</a></h6>
                                    <p class="text-gray">Tue, 20 Mar 2020</p>
                                </div>
                                <div class="reviews-members-body">
                                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
                                </div>
                                <div class="reviews-members-footer">
                                    <a class="total-like" href="#"><i class="icofont-thumbs-up"></i> 88K</a> <a class="total-like" href="#"><i class="icofont-thumbs-down"></i> 1K</a>
                                    <span class="total-like-user-main ml-2" dir="rtl">
                                          <a data-toggle="tooltip" data-placement="top" title="" href="#" data-original-title="Gurdeep Osahan"><img alt="Generic placeholder image" src="http://bootdey.com/img/Content/avatar/avatar5.png" class="total-like-user rounded-pill"></a>
                                          <a data-toggle="tooltip" data-placement="top" title="" href="#" data-original-title="Gurdeep Singh"><img alt="Generic placeholder image" src="http://bootdey.com/img/Content/avatar/avatar2.png" class="total-like-user rounded-pill"></a>
                                          <a data-toggle="tooltip" data-placement="top" title="" href="#" data-original-title="Askbootstrap"><img alt="Generic placeholder image" src="http://bootdey.com/img/Content/avatar/avatar3.png" class="total-like-user rounded-pill"></a>
                                          <a data-toggle="tooltip" data-placement="top" title="" href="#" data-original-title="Osahan"><img alt="Generic placeholder image" src="http://bootdey.com/img/Content/avatar/avatar4.png" class="total-like-user rounded-pill"></a>
                                          </span>
                                </div>
                            </div>
                        </div>
                    </div>
    </body>
</html>
