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
<title>MBTI 설정 화면</title>
<style>
        #st-wrapper {
            width: 800px;
            height: auto;
        }

        #box1 {
            background-color: rgb(243, 156, 18);
            width: 9px;
            height: 9px;
            float: left;
            margin-top: 6px;
            margin-right: 10px;
        }

        #my-mbti {
            float: left;
        }

        #select-mbti {
            width: 800px;
            height: auto;
            float: left;
            margin-top: 10px;
        }
        
        #mbti-btn {
            margin-top: 15px;
        }
    </style>
</head>

<body>
    <div id="st-wrapper">
        <div id="box1"></div>
        <div id="my-mbti">
            <span>현재 내 MBTI</span>
        </div>

        <div id="select-mbti">
            <form method="get">
                <table>
                    <tr>
                        <td>
                            <label>
                                <input type="checkbox" name="mbti" id="mbti1" value="ISTP"
                                ${ fn:contains(memberMinihome.mbti, 'ISTP') ? 'checked' : '' }>ISTP
                                
                            </label>
                        </td>
                        <td>
                            <label>
                                <input type="checkbox" name="mbti" id="mbti2" value="INFJ"
                                ${ fn:contains(memberMinihome.mbti, 'INFJ') ? 'checked' : '' }>INFJ
                            </label>
                        </td>
                        <td>
                            <label>
                                <input type="checkbox" name="mbti" id="mbti3" value="INTP"
                                ${ fn:contains(memberMinihome.mbti, 'INTP') ? 'checked' : '' }>INTP
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                <input type="checkbox" name="mbti" id="mbti4" value="ENFJ"
                                ${ fn:contains(memberMinihome.mbti, 'ENFJ') ? 'checked' : '' }>ENFJ
                            </label>
                        </td>
                        <td>
                            <label>
                                <input type="checkbox" name="mbti" id="mbti5" value="INTJ"
                                ${ fn:contains(memberMinihome.mbti, 'INTJ') ? 'checked' : '' }>INTJ
                            </label>
                        </td>
                    </tr>
                </table>
                <input id="mbti-btn" type="submit" value="등록">
            </form>
        </div>
    </div>
</body>

</html>