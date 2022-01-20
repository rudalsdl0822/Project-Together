<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

{"reply_num":${r.reply_num}, "board_num":${r.board_num}, "writer_id":"${r.writer_id}", "reply_content":"${r.reply_content}", "reply_date":"${r.reply_date}", "parent_reply_num":${r.parent_reply_num},"child_reply":[<c:forEach var="rr" items="${r.child_reply}" varStatus="rr_state"><c:if test="${not rr_state.first}">,</c:if>{"reply_num":${rr.reply_num}, "board_num":${rr.board_num}, "writer_id":"${rr.writer_id}", "reply_content":"${rr.reply_content}", "reply_date":"${rr.reply_date}", "parent_reply_num":${rr.parent_reply_num}}</c:forEach>]}