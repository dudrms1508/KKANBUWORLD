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
<title>미니홈피 기본 설정</title>
    <style>
        #wrap{
            width: 550px;
            height: auto;
        }
        th{
            width: 150px;
            background-color: lightgray;

        }
        tr{
            height: 30px;
        }
        td{
            width: 300px;
        }
        #btnwrap{
            margin: 30px 70px;
        }
        table, th, td{
            border: 1px solid;
            border-collapse: collapse;
        }
    </style>
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
<script src="${ path }/resources/js/GGAN.js"></script>
</head>
<body>
    <div id="wrap">
    <p>미니홈페이지 관리</p>
    <hr>
    <br>
    <form>
        <table>
            <tr>
                <th>검색 허용</th>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" id="yes" name="radio" value="Y"><label for="yes">예</label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" id="no" name="radio" value="N"><label for="no">아니오</label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" onclick="update()" value="적용">
                </td>
            </tr>
            <tr>
                <th>스킨</th>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <select name="skin" id="skin">
                        <option selected>------선택------</option>
                        <option value="NONE">기본 스킨</option>
                        <c:forEach var="skinList" items="${skinList }">
                        	<option id="${skinList.product_code}" value="${skinList.product_name}">${skinList.product_name}</option>
                        </c:forEach>
                    </select>
                    <input type="button" onclick="Skinupdate();" value="적용">
                </td>                
            </tr>    
            <tr>
            
                <th>MBTI 변경하기</th>
                <td>
                    <input type="radio" id="ISTF" name ="mbti" value="ISTF"><label for="ISTF">ISFT</label>
                    <input type="radio" id="INFJ" name ="mbti" value="INFJ"><label for="INFJ">INFJ</label>
                    <input type="radio" id="ISTP" name ="mbti" value="ISTP"><label for="ISTP">ISTP</label>
                    <input type="radio" id="ENFJ" name ="mbti" value="ENFJ"><label for="ENFJ">ENFJ</label>
                    <input type="radio" id="INTJ" name ="mbti" value="INTJ"><label for="INTJ">INTJ</label>
                    
                    <br>
                    <input type="button" onclick="mbtiUpdate()" value="적용">
                </td>
            </tr>        
        </table>
    </form>
    </div>
    
    <script>
    
    	var miniNo = "${integer}";
    
    	
    	function update(){
			var param = {
				searchme: $('input[name="radio"]:checked').val(),
				miniNo
			}
			ajaxJsonParam("${path}/minihome/setting/update/search", param, function(data){
            	if(data){       		
            		alert("수정 완료");
            	}  
			});
		}
    	
    	
    /* 	var product_name = "";
    		$('select[name="skin"]').change(function(){
    			
    			product_name = $(this).val();
    			console.log(product_name);
    		});
		
    		console.log(product_name); */
    	
    	function Skinupdate(){
    		var theme = $('#skin option:selected').val();
    		console.log(theme);    		
    		
    		$.ajax({
    			type: 'put',
    			url: '${path}/minihome/setting/update/skin',
    			headers : {
    				'Content-Type' : 'application/json',
	                 'X-HTTP-Method-Override' : 'PUT'
    			},
    			data: JSON.stringify({
    				'theme' : theme
    			}),
    			success : function(result){
    				if(result == 1){
    					alert('수정 성공');
    					
    					window.parent.location.reload();			
    				}
    			}
    		});
    	}
    		
		function mbtiUpdate(){
			var param = {
				mbti: $('input[name="mbti"]:checked').val(),
				miniNo
			}
			ajaxJsonParam("${path}/minihome/setting/update/mbti", param, function(data){
            	if(data){       		
            		alert("수정 완료");
            		window.parent.location.reload();
            	}  
			});
		}
    </script>
</body>
</html>