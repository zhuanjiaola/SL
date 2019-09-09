<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/head.jsp"%>
<div>
	<ul class="breadcrumb">
		<li><a href="#">信息管理</a> <span class="divider">/</span></li>
		<li><a href="/informanage/download.html">下载中心</a></li>
	</ul>
</div>
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i> 资源列表</h2>
					</div>
					
					<div class="box-content">
					
						<form action="/informanage/download.html" method="post">
							<div class="control-group">
								<label class="control-label" for="appendedInputButton">按文件名搜索：</label>
								<div class="controls">
								  <div class="input-append">
									<input id="appendedInputButton" size="16" type="text" name="k" value="${k}"><button class="btn" type="submit">搜</button>
								  </div>
								</div>
							  </div>
						</form>
					
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th width="40px;" class="center">文档类型</th>
								  <th class="center">文件名</th>
								  <th class="center">文件大小</th>
								  <th class="center">上传时间</th>
								  <th class="center">操作</th>
							  </tr>
						  </thead>   
						  <tbody>
						  
						  <c:if test="${page.items != null}">
						  <c:forEach items="${page.items}" var="infor">
							<tr>
							
								<td class="center">
								<c:if test="${infor.typeName == '视频'}"><span class="icon32 icon-green icon-video"/></c:if>
								<c:if test="${infor.typeName == '图片'}"><span class="icon32 icon-green icon-image"/></c:if>
								<c:if test="${infor.typeName == '文本'}"><span class="icon32 icon-green icon-document"/></c:if>
								</td>
								<td class="center">${infor.fileName}</td>
								<td class="center">${infor.fileSize/1000}KB</td>
								<td class="center"><fmt:formatDate value="${infor.uploadTime}" pattern="yyyy-MM-dd"/></td>
								<td class="center">
									<a class="btn btn-success viewinformation" href="${infor.filePath}" id="${infor.id}" title="${infor.fileName}">
										<span class="icon icon-white icon-archive"></span>  
										下载(或者另存为...)                                    
									</a>
								</td>
							</tr>
						  </c:forEach>
						 </c:if>
						  </tbody>
					  </table>   
					<div class="pagination pagination-centered">
					  <ul>
					  <c:choose>
					  	<c:when test="${page.page == 1}">
					  	<li class="active"><a href="javascript:void();" title="首页">首页</a></li>
					  	</c:when>
					  	<c:otherwise>
					  	<li><a href="/informanage/download.html?p=1&k=${k}" title="首页">首页</a></li>
					  	</c:otherwise>
					  </c:choose>
						
						<c:if test="${page.prevPages!=null}">
							<c:forEach items="${page.prevPages}" var="num">
								<li><a href="/informanage/download.html?p=${num}&k=${k}"
									class="number" title="${num}">${num}</a></li>
							</c:forEach>
						</c:if>
						<li class="active">
						  <a href="#" title="${page.page}">${page.page}</a>
						</li>
						<c:if test="${page.nextPages!=null}">
							<c:forEach items="${page.nextPages}" var="num">
								<li><a href="/informanage/download.html?p=${num}&k=${k}" title="${num}">
								${num} </a></li>
							</c:forEach>
						</c:if>
						<c:if test="${page.pageCount !=null}">
							<c:choose>
						  	<c:when test="${page.page == page.pageCount}">
						  	<li class="active"><a href="javascript:void();" title="尾页">尾页</a></li>
						  	</c:when>
						  	<c:otherwise>
						  	<li><a href="/informanage/download.html?p=${page.pageCount}&k=${k}" title="尾页">尾页</a></li>
						  	</c:otherwise>
						    </c:choose>
					    </c:if>
						<c:if test="${page.pageCount == null}">
						<li class="active"><a href="javascript:void();" title="尾页">尾页</a></li>
					  	</c:if>
					  </ul>
				  </div>
				</div>
			</div><!--/span-->
		</div><!--/row-->

	 
	 
	 
<%@include file="/WEB-INF/pages/common/foot.jsp"%>
