<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/headers.jsp"/>
					
	<div class="container-fluid my-5">
        <div class="row mb-0">
            <div class="col-4 offset-4">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link ${formNumber != 2 ? 'active' : ''}" data-toggle="tab" href="#login_tab" role="tab"> Login </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${formNumber == 2 ? 'active' : ''}" data-toggle="tab" href="#recover_password_tab" role="tab"> Recuperar senha </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row mt-0">
            <div class="col-4 offset-4 tab-content">
                <div class="tab-pane fade show ${formNumber != 2 ? 'active' : ''}" id="login_tab">
                    <div class="card standard-color-blue p-5 rounded">
                    	<c:if test="${formNumber == 1}">
							<div class="alert alert-${status} alert-dismissible fade show text-center" role="alert">
								<button type="button" class="close" data-dismiss="alert" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								${message}
							</div>
						</c:if>
                        <form method="POST" action="<c:url value='/login'/>">
                            <input type="email" name="email" id="login_email_input" class="form-control my-2" placeholder="Email">
                            <input type="password" name="password" id="login_password_input" class="form-control my-2" placeholder="Senha">
                            <button type="submit" id="login_submit_input" class="btn btn-block rounded btn-danger mt-3"> Entrar </button>
                        </form>
                    </div>
                </div>
                <div class="tab-pane fade show ${formNumber == 2 ? 'active' : ''}" id="recover_password_tab">
                    <div class="card standard-color-blue p-5 rounded">
                        <c:if test="${formNumber == 2}">
							<div class="alert alert-${status} alert-dismissible fade show text-center" role="alert">
								<button type="button" class="close" data-dismiss="alert" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								${message}
							</div>
						</c:if>
                        <form method="POST" action="<c:url value='/recoverPassword'/>">
                            <input type="email" id="recover_password_email_input" name="email" class="form-control my-2" placeholder="Email">
                            <button type="submit" id="recover_password_submit_input" class="btn btn-block rounded btn-danger mt-3"> Enviar email de recuperação </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
<c:import url="/includes/footers.jsp"/>