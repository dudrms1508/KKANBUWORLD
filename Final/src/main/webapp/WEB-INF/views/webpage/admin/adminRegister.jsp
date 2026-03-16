<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="${ path }/js/jquery-3.6.3.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans&family=Open+Sans&display=swap');
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        * {
            font-family: 'GmarketSansMedium';
        }
        body {
            font-family: 'Noto Sans', sans-serif;
        }

        .wrap{
            width:1200px;
            height:800px;
            margin:auto;
        }
      
        #header{
            margin-top: 50px;
        }

        #navigator {
            margin-top: 10px;
            height: 5%;
        }

        #navi{
            list-style-type: none;
            background-color: orangered;
            margin:0;
            padding:0;
            height:100%;
            position: relative;
        }

        #navi> li{
            float:left;
            width:25%;
            height:100%;
            text-align:center;
            font-size:13px;
            line-height:5px;
        }
        
        #navi> li:hover{
            background-color: orangered;
        }

        #navi a{
            text-decoration: none;
            color: white;
            font-size: 1.5em;
            font-weight: 900;
            height: 100%;
            line-height: 35px;
            vertical-align: middle;
        }

        #navi>li>ul a:hover{
            color: orangered;
            
        }

        #navi>li>ul{
            list-style-type: none;
            display: none;
            background-color: wheat;
            padding: 5px 0 0 0 ;
            margin: 5px 0 0 0 ; 
            opacity: 1;
        }
      
      
        #navi>li:hover>ul{
            display: block;
        }

        #navi>li>ul>li:hover {
            display: block;
            transition: ease 1s;
        }

        #navi>li>ul a{
            font-size: 1.4em;
            color: orangered;
        }

        section {
            margin-top: 50px;
            height: 87%;
            font-family: 'GmarketSansMedium';
         }



        #content, * {
            text-align: center;
            box-sizing: border-box;
            /* border: 1px solid red; */
            margin-left:auto; 
            margin-right:auto; 
        }

    

        th {
            padding: 10px 30px 7px 30px;
            text-align: left;
            font-size: 14px;
        } 

        td {
            text-align: left;
        }

        td > input, label {
            text-align: left;
            margin-left: 10px;  
            margin-right: 30px;   
        }

        #content {
            margin-top: 150px;
            height: 590px;
            width: 1200px;
        }

        #register_wrap textarea,
        #register_wrap input[type="text"],
        #register_wrap input[type="tel"],
        #register_wrap input[type="button"]
        {
            height:35px;
            background-color: white;
            border:2px solid #cccccc;
            font-size:12px;
            border-radius:5px;
        }

        #productUpdate {
            height: 300px;
            width: 500px;
            border: 2px solid black;
            background-color: wheat;
        }

        #btn_register {
            height: 40px;
            box-sizing: border-box;
            width: 10%;
            margin-top: 25px;
            background-color: orangered;
            font-weight: bold;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            color: white;
        }
            
        

    </style>
    </head>
    <body>
        <div class="wrap">
            <div id="header">
                <div id="header1"> 
                    <h1 align="center">Admin page</h1>
                </div>
            </div>
            

            <div id="navigator">
            <ul id="navi">
                <li>
                    <a href="${ path }/admin/adminMember?table=MEMBER">회원 관리</a>
                </li>
                <li>
                    <a href="${ path }/admin/adminQnA?table=QNA">문의 관리</a>
                
                </li>
                <li>
                    <a href="${ path }/admin/report?table=REPORT">신고 관리</a>
                </li>
                <li>
                    <a>상품 관리</a>
                    <ul>
                        <li><a href="${ path }/admin/product?product=MINIMI">미니미</a></li>
                        <li><a href="${ path }/admin/product?product=BGM">BGM</a></li>
                        <li><a href="${ path }/admin/product?product=THEME">테마</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <section id="content">
            <h2 align="center">상품 등록</h2>
            <div id="register_wrap">	 	
                <form name="registerForm" action="${ path }/admin/register" method="POST" enctype="multipart/form-data">
                    <table id="productUpdate">
                        <tr>
                            <th>상품명</th>
                            <td>
                                <input type="text" name="productName" id="productName" placeholder="상품명 입력" required size="40">
                            </td> 			
                        </tr>
                        <tr>
                            <th>가격</th>
                            <td>
                                <input type="text" id="productPrice" name="productPrice" placeholder= "가격 입력" size="40">
                            </td> 			
                        </tr>
                        <tr>
                            <th height="80">품목</th>
                            <td width="3">
                                <label><input type="checkbox" name="categoryCode" id="cate1" value="MINIMI">&nbsp;미니미</label>
                                <label><input type="checkbox" name="categoryCode" id="cate2" value="BGM">&nbsp;BGM</label>
                                <label><input type="checkbox" name="categoryCode" id="cate3" value="THEME">&nbsp;테마</label>
                            </td> 			
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <input type="file" name="upfile">
                            </td>
                        </tr>
                    </table> 
                    <input type="submit" id="btn_register" value="등록 하기">	
                </form>
                <div>   
            </div>
        </div>
        </section>
        
        <p align="center" style="font-size: small;">Copyright © semi 3. All rights reserved.</p>
        <br>
    </div>     
    </body>
</html>