<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BGM 설정</title>
 <style>
        #bgm-wrapper {
            width: 600px;
            height: auto;
        }

        #select-bgm {
            width: 600px;
            float: left;
        }

        #bgm-tb {
            border: 1px solid #666;
            text-align: center;
            width: 600px;
            float: left;
        }
        
        #bgm-tb td {
            border: 1px solid #666;
        }

        #bgm-btn {
            float: left;
            margin-top: 15px;
        }
    </style>
</head>

<body>
    <div id="bgm-wrapper">
        <div id="select-bgm">
            <form>
                <table id="bgm-tb">
                    <tr>
                        <th>노래 제목 - 아티스트</th>  
                        <th></th>                      
                    </tr>
                    <c:forEach var="bgmList" items="${bgmList }"> 
                    <tr>
                        <td>
                            ${ bgmList.product_name}
						</td>
                        <td>
                        	<input type="button" onclick="BGMupdate('${bgmList.product_code}', '${ bgmList.product_name}');" value="적용">
                        </td>
                    </tr>
                    </c:forEach>
                </table>
                
            </form>
        </div>
    </div>
    <script>
    	function BGMupdate(str1, str2){
    		var product_code = str1;
    		var product_name = str2;
    		
    		console.log(product_code);
    		console.log(product_name);
    		
    	}
    </script>
</body>


</html>