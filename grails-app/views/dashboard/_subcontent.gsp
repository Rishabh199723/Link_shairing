<g:each var="sub" in="${subs}" status="i">
    <div class="panel-body">
    <g:if test="${i < 5}">
<g:link controller="topic" action="topicshow" params="[id: sub.id]">${sub.topic.name}</g:link>
<br>
<i>@${sub.topic.createdBy.username}</i>
<br>
<g:if test="${sub.topic.createdBy.username == userdata.username}">

    Subscription : ${countofsubs.get(i)} Posts:${countofposts.get(i)}

</g:if>
<g:else>
    <g:link controller="Subscription" action="unsubscribe" params="[id:sub.id, page:'dashboard']">Unsubscribe</g:link> &nbsp &nbsp &nbspSubscription: &nbsp ${countofsubs.get(i)} &nbsp &nbsp Posts:${countofposts.get(i)}
</g:else>
<br>
<g:if test="${sub.topic.createdBy.username == userdata.username}">
    <div class="row">
        <div class="col-md-12">
            <ul class="list-inline">
                <li>
                    <g:form controller="subscription" action="updateSerious">
                        <g:field type="hidden" name="sid" value="${sub.id}"></g:field>
                        <g:field type="hidden" name="page" value="dashboard"></g:field>
                        <g:select onChange="submit()" name="seriousness"
                                  from="${['CASUAL', 'SERIOUS', 'VERY_SERIOUS']}"
                                  value="${sub.seriousness}"/>
                    </g:form>
                </li>
                <li>
                    <g:form controller="topic" action="updatevisibility">
                        <g:field type="hidden" name="id" value="${sub.topicId}"></g:field>
                        <g:select onChange="submit()" name="visibility"
                                  from="${['PUBLIC', 'PRIVATE']}"
                                  value="${sub.topic.visibility}"/>
                    </g:form>
                </li>
                <li>
                    <g:link controller="topic" action="deletetopic"
                            params="[id: sub.topic.id]"><i class="fa fa-trash"
                                                           aria-hidden="true"
                                                           style="color: black"></i></g:link>
                </li>
            </ul>
        </div>
    </div>
</g:if>
<g:else>
    <g:form controller="subscription" action="updateSerious">
        <g:field type="hidden" name="sid" value="${sub.id}"></g:field>
        <g:field type="hidden" name="page" value="dashboard"></g:field>
        <g:select onChange="submit()" name="seriousness"
                  from="${['CASUAL', 'SERIOUS', 'VERY_SERIOUS']}" value="${sub.seriousness}"/>
    </g:form>
</g:else>
    </g:if>
    </div>
</g:each>