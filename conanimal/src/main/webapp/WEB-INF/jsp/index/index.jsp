<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:import url="/includes/headers.jsp"/>
<c:import url="/includes/main-header.jsp"/>
	
<div class="row w-100 mt-5 mx-0 mb-0 p-0">
	<!-- Menu lateral -->
	<c:import url="/includes/side-menu.jsp"/>
	
	<!-- Animais para adoção -->
    <div class="col-6 px-0">
    	<div class="px-3 pb-4 pt-0 mx-4 mb-5">
        	<div class="p-3 rounded-top standard-color-blue">
            	<h4 class="text-white my-0"> Animais para adoção </h4>
            </div>
            <c:choose>
            	<c:when test="${animals.size() > 0}"> 
            		<c:forEach items="${animals}" var="eachAnimal">
						<div class="card border-top-0">
							<div class="card-block row">
								<div class="col-3">
									<div class="img-wrapper border-0">
										<img src="<c:url value='/animal/${eachAnimal.getId()}/image'/>" class="img-fluid" alt="">
									</div>
			                   </div>
			                   <div class="m-0 pt-1 col-9">
			                       <h6> ${eachAnimal.getTitle()} </h6>
			                       <hr>
			                       <p class="text-justify"> ${eachAnimal.getDescription().length() > 250 ? fn:substring(eachAnimal.getDescription(), 0, 250).concat('...') : eachAnimal.getDescription()} </p>
			                       <p class="float-right p-0 m-0"> Cadastrado em: ${eachAnimal.getRegisterDate()} </p>
			                       <br>
			                       <a class="float-right" href="<c:url value='/animal/${eachAnimal.getId()}/view'/>"> Mais informações </a>
			                   </div>
			               </div>
			           </div>
		           </c:forEach>
            	</c:when>
            	<c:otherwise> 
            		<div class="card border-top-0">
	                    <div class="card-block">
	                        <div class="m-0 pt-1 pb-0">
	                            <p> Nenhum animal cadastrado. </p>
	                        </div>
	                    </div>
	                </div>
            	</c:otherwise>
            </c:choose>
 		</div>
 	</div>
 	
 	<div class="col-2 px-0">
	    <!-- Notícias recentes -->
	    <c:if test="${news.size() > 0}"> 
		    <div class="p-3 rounded-top standard-color-blue">
		    	<h4 class="my-0 text-white"> Notícias recentes </h4>
		    </div>
		    <div class="card mb-5">
		        <div class="card-block mx-0 my-2">
        			<c:forEach var="i" begin="0" end="4"> 
		        		<c:if test="${news.size() > i}">
		        			<span class="badge badge-danger">${fn:substring(news.get(i).getRegisterDate(),0, 10)}</span> <br>
		            		<a class="" href="<c:url value='/news/${news.get(i).getId()}/view'/>">
		            			${news.get(i).getTitle().length() > 18 ? fn:substring(news.get(i).getTitle(), 0, 17).concat('...') : news.get(i).getTitle()}
		            		</a>
		            		<hr class="my-2">	
		        		</c:if>
		        	</c:forEach>
		      	</div>
	    	</div>
	    </c:if>
	
		<!-- Informações para contato -->
		<div class="p-3 rounded-top standard-color-blue">
	    	<h4 class="my-0 text-white"> Contatos úteis </h4>
	    </div>
	  	<div class="card px-0 mb-5">
	  		<div class="card-block mx-0 my-2">
	  			<p> <span class="badge badge-warning"> ${emailContact.getType()} </span> <br> ${emailContact.getUrl()} </p>
	  			<hr class="my-0">
	  			<a href="//${facebookContact.getUrl()}"> 
					<span class="badge badge-warning"> ${facebookContact.getType()} </span>
					<br> 
					${facebookContact.getUrl().length() > 18 ? fn:substring(facebookContact.getUrl(), 0, 17).concat('...') : facebookContact.getUrl()}
				</a>
				<hr class="my-0">
	  			<c:forEach items="${contacts}" var="eachContact">
	  				<c:if test="${eachContact.getUrl().length() > 0}">
  						<a href="//${eachContact.getUrl()}"> 
  							<span class="badge badge-warning"> ${eachContact.getType()} </span>
  							<br> 
  							${eachContact.getUrl().length() > 18 ? fn:substring(eachContact.getUrl(), 0, 17).concat('...') : eachContact.getUrl()}
  						</a>
	         			<hr class="my-0">
	         		</c:if>
	  			</c:forEach>
	       	</div>
	   	</div>
   	</div>
</div>

<c:import url="/includes/main-footer.jsp"/>
<c:import url="/includes/footers.jsp"/>


