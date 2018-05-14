<%@ include file="/WEB-INF/jsp/include.jsp" %>
<jsp:include page="/WEB-INF/jsp/header.jsp"/>
<form:form id="createCertFormFour" modelAttribute="certificateToolState" action="fourth.form">
    <div>
        <h3><spring:message code="form.text.instruction"/></h3>
        <p><spring:message code="form.text.review.description"/></p>
    </div>
    <div id="submitError" class="alertMessage" style="display:none"></div>
    <c:if test="${statusMessageKey != null}" >
        <div id="statusMessageKey" class="alertMessage" >
            <spring:message code="${statusMessageKey}"/>
        </div>
    </c:if>
    <c:if test="${errorMessage != null}" >
        <div id="errorMessage" class="alertMessage" >
            <spring:message code="${errorMessage}" />
        </div>
    </c:if>
    <div style="margin-left:20px">
    <table cellspacing=5px padding=5px>
        <tr>
            <form:label path="certificateDefinition.name">
                <td><h6><spring:message code="form.label.name" /></h6></td>
                <td><c:out value="${certificateToolState.certificateDefinition.name}"></c:out></td>
            </form:label>
        </tr>
        <tr>
            <form:label path="certificateDefinition.description">
                <td><h6><spring:message code="form.label.description" /></h6></td>
                <td><c:out value="${certificateToolState.certificateDefinition.description}"></c:out></td>
            </form:label>
        </tr>
        <c:if test="${not empty certificateToolState.certificateDefinition.expiryOffset}">
            <tr>
                <form:label path="certificateDefinition.expiryOffset">
                    <td><h6><spring:message code="form.label.expiryOffset1" /></h6></td>
                    <td>
                        ${certificateToolState.certificateDefinition.expiryOffset}&nbsp;
                        <h6 style="display: inline;"><spring:message code="form.label.expiryOffset2" /></h6>
                    </td>
                </form:label>
            </tr>
        </c:if>
        <tr>
        <form:label path="certificateDefinition.documentTemplate">
            <td><h6><spring:message code="form.label.templatefile" /></h6></td>
            <c:choose>
                <c:when test="${certificateToolState.templateFilename != null}">
                    <td>${certificateToolState.templateFilename}</td>
                </c:when>
                <c:otherwise>
                    <td></td>
                </c:otherwise>
            </c:choose>
        </form:label>
        </tr>
        <tr>
            <form:label path="certificateDefinition.awardCriteria">
                <td><h6><spring:message code="form.label.criteria" /></h6></hd>
                <td>
                    <c:forEach items="${certificateToolState.certificateDefinition.awardCriteria}" var="criteria">
                        ${criteria.expression}</br>
                    </c:forEach>
                </td>
            </form:label>
        </tr>
        <tr>
            <td><h6><spring:message code="form.label.hideRequirements" /></h6></td>
            <td>
                <c:choose>
                    <c:when test="${certificateToolState.certificateDefinition.progressHidden}">
                        <spring:message code="form.label.hideRequirements.yes" />
                    </c:when>
                    <c:otherwise>
                        <spring:message code="form.label.hideRequirements.no" />
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
        <form:label path="certificateDefinition.fieldValues">
            <td><h6><spring:message code="form.label.fieldValues" /></h6></td>
            <td>
                <div style="display:inline-block">
                <table class="listHier lines nolines">
                <thead>
                    <tr>
                        <th><spring:message code="form.label.field"/></th>
                        <th><spring:message code="form.label.value"/></th>
                        <th><spring:message code="form.label.overwrite"/></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${certificateToolState.fieldToDescription}" var="tField" >
                        <tr>
                            <td>${tField.key}</td>
                            <td>${tField.value}</td>
                            <c:if test = "${tField.value == '${unassigned}'}" >
                                <td><form:input path="templateFields['${tField.key}']" autocomplete="off"/></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
                </table>
                </div>
            </td>
        </form:label>
        </tr>
    </table>
    </div>
    <div style="display:block; position:relative; margin:5px">
        <input id="back" type="button" value="<spring:message code='form.submit.back' />" />
        <input id="save" type="button" value="<spring:message code='form.submit.activateCert' />" />
        <input id="cancel" type="button" value="<spring:message code='form.submit.cancel' />" />
        <form:hidden path="submitValue" />
    </div>
</form:form>
<script type="text/javascript">

    $(document).ready(function() {

        loaded();

        $("#back").click(function(){
            back();
        });

        $("#save").click(function() {
            save();
        });

        $("#cancel").click(function() {
            cancel();
        });

    });

    function back()
    {
        SPNR.disableControlsAndSpin( this, null );
        $("#submitValue").val("back");
        $("#createCertFormFour").submit();
    }

    function save()
    {
        SPNR.disableControlsAndSpin( this, null );
        $("#submitValue").val("save");
        $("#createCertFormFour").submit();
    }

    function cancel()
    {
        SPNR.disableControlsAndSpin( this, null );
        $("#submitValue").val("cancel");
        $("#createCertFormFour").submit();
    }

</script>
<%@ include file="/WEB-INF/jsp/footer.jsp" %>
