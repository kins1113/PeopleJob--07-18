<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
						<ul class="p-t-35" style="padding-top: 0px"> 
						<c:set value="0" var="i"/>
						<c:forEach items="${list}" var="vo">
						<c:set value="${i+1}" var="i"/>
						<c:if test="${i<=3 }">  
						
									<li style="margin-bottom: 5px;" >
										<a href="<c:url value='/notice/countUpdate.do?notifyCode=${vo["NOTIFY_CODE"]}'/>"class="size-w-3 f1-s-7 cl3 hov-cl10 trans-03" style="margin-left: 30px;  margin-bottom: 7px;  margin-right: 30px;">
															<!-- 제목이 긴경우 30글자만 보여주기 --> <c:if
																test="${fn:length(vo['NOTIFYTITLE'] ) >=30}">
  							${fn:substring(vo['NOTIFYTITLE'],0,30)}...
  						</c:if> <c:if test="${fn:length(vo['NOTIFYTITLE'])<30 }">
  				${vo['NOTIFYTITLE']}
  					</c:if> <!-- 24시간 이내 글인 경우 new 이미지 보여주기 --> <c:if
																test="${vo['NEW_IMG_TERM']<24 }">
																<img src="<c:url value='/resources/images/new.gif'/>"
																	alt="new이미지">
															</c:if>
													</a>
									</li>
									<br> 
							</c:if>	
						</c:forEach>
								</ul>