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
<title>Insert title here</title>
<script src="${path}/resources/js/jquery-3.6.3.js"></script>
</head>
<style>
#wrap{	
	/* border: 1px solid black; */
	width : 800px;
	height: 485px;
}
.photo{
	/* border: 1px solid aqua;  */
	box-sizing: border-box;
	float: left;
	margin: auto;
	width: 50%;
	height: 42%;
	text-align: center;
}
.div_img{
	margin: 10px auto;
	width: 65%;
	height: 75%;
}
img{
	width: 100%;
	height: 100%;
}
#div_update{
	 /* border: 1px solid green; */ 
	box-sizing: border-box;
	float: left;
	text-align: center;
	width: 100%;
	height: 8%;
}
#div_page{
	/* border: 1px solid red; */
	box-sizing: border-box;
	float: left;
	width: 100%;
	height: 8%;
	text-align: center;
	
}
.btn_update{
	width: 80px;
	height: 30px;
	margin: 5px 80px;
}
.pageCount{
        width: 35px;
        height: 25px;
        display: inline-block;
        margin: 10px 4px;
        border: none;
        background: transparent;
        cursor: pointer;
    }
</style>
<body>
	
	<!-- right_side -->
	<div id = "wrap" > 
	
		<c:forEach var="photo" items="${list}">
			<div class="photo">
				<div class="div_img" >
					<a href="${ path }/minihome/photo/${minihomeNo}/view?no=${ photo.no }">
						<img src="${path}${photo.url}"> <br>
					</a>
				</div>
				<c:if test="${loginMember.no eq minihome.userNo }">
				<input type="checkbox" name="delete" id="checkbox" class="chk" value="${photo.no}">
				</c:if>
				<label for="checkbox1"><b>${photo.title}</b></label>
			</div>
			
		</c:forEach>
		<c:if test="${loginMember.no eq minihome.userNo }">
			<div id="div_update">
				<input type="button" class="btn_update" value="사진 추가" onclick="location.href='${ path }/minihome/photo/insert/${minihomeNo}'">
				<input type="button" id="deleteBtn" class="btn_update" value="사진 삭제">
				<!-- <input type="button" class="btn_update" value="폴더 삭제"> -->
			</div>
		</c:if>
		<div id="div_page">
			<input type="button" class="pageCount" value="<<" onclick="location.href='${path}/minihome/photo/${minihomeNo}/folder?page=1'">
			<input type="button" class="pageCount" value="<" onclick="location.href='${path}/minihome/photo/${minihomeNo}/folder?page=${ pageInfo.prevPage }'">
			
			
			
				<c:forEach  begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:choose>
					<c:when test="${ status.current == pageInfo.currentPage}">
						<input type="button" class="pageCount" value="${ status.current }" disabled>
					</c:when>
					<c:otherwise>						
						<input type="button" class="pageCount" onclick="location.href='${ path }/minihome/photo/${minihomeNo}/folder?page=${ status.current }'" value="${ status.current }" />
					</c:otherwise>
				</c:choose>
			</c:forEach> 
			
			
			<input type="button" class="pageCount" value=">" onclick="location.href='${path}/minihome/photo/${minihomeNo}/folder?page=${ pageInfo.nextPage }'">
			<input type="button" class="pageCount" value=">>" onclick="location.href='${path}/minihome/photo/${minihomeNo}/folder?page=${ pageInfo.maxPage }'">
		</div>
			
	</div>

</body>
<script>
$(document).ready(() => {
	
    $('#deleteBtn').on('click', function(event){
        if(confirm("정말로 삭제 하시겠습니까?")){
        	var images = [];
    		if ($('input:checkbox[class="chk"]').is(":checked")){

                // images.push(this.id); //Check된 Check박스의 "Id"태그 얻기.
                $('input:checked[class=chk]').each(function() {
                    // val()값 얻기
                    images.push($(this).val());
                    console.log($(this).val());

                });
                console.log(images)
                var colors = {
                    "images" : images
                };
            };
    		
            $.ajax({
            	type:'get',
            	url:'${path}/minihome/photo/delete/${minihomeNo}',
            	data:colors,
            	success:function(data){
            		document.location.reload();
            	}
            })
        }else{
        	event.preventDefault();
        }
    });
	
	
    
    
    
    
    /* 
	$('#deleteBtn').on('click', (e) => {
		var images = [];
		if ($('input:checkbox[class="chk"]').is(":checked")){

            // images.push(this.id); //Check된 Check박스의 "Id"태그 얻기.
            $('input:checked[class=chk]').each(function() {
                // val()값 얻기
                images.push($(this).val());
                console.log($(this).val());

            });
            console.log(images)
            var colors = {
                "images" : images
            };
        };
		
        $.ajax({
        	type:'get',
        	url:'${path}/minihome/photo/delete/${minihomeNo}',
        	data:colors,
        	success:function(data){
        		document.location.reload();
        	}
        })
        
	}); */
	
	
	
});


</script>
</html>