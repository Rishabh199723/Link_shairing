<div class="panel panel-default">
    <div class="panel-heading"><div style="float:left">Topics</div>
        <div style="margin-left:350px">View all</div>
    </div>
    <div class="panel-body">
        <g:each in="${subscriptions}" var="us" status="i">
            <g:if test = "${us.topic.createdBy.username==user.username}">
                <ul class="list-inline">
                    <li>
                        <div class="row">
                            <div class="col-md-4">
                                <div style="font-size:23px;"><g:link controller="topic" action="topicshow" params="[ id: us.id]">${us.topic.name}</g:link></div></div>

                            <div class="col-md-3">
                                Subscriptions:
                                <div>${countofsubs.getAt(i) } </div></div>
                            &nbsp  &nbsp &nbsp &nbsp  &nbsp &nbsp &nbsp &nbsp  &nbsp &nbsp

                            <div class="col-md-3">
                                Posts:
                                <div><a>${countofposts.get(i)}</a></div></div>


                            <g:form controller="subscription" action="updateSerious">
                                <g:field type="hidden" name="id" value="${us.id}"></g:field>
                                &nbsp &nbsp &nbsp <g:select onChange="submit()" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                            value="${us.seriousness}" />
                            </g:form>
                    </li>
                </ul>

            </g:if>
        </g:each>


    </div>

</div>