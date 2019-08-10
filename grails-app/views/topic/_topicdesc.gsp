<div class="panel panel-default" style="overflow: auto;height: 220px">
    <div class="panel-heading">${subs.topic.name}</div>
    <div class="panel-body">
        <div class="col-md-3">
            <asset:image src="${subs.topic.createdBy.photo}" width="100%" height="120px"></asset:image></div>

        <div class="col-md-9">
            <div style="font-size:23px;"><b
                    style="text-transform: uppercase">${subs.topic.name}</b>(${subs.topic.visibility})</div>

            <div>@${subs.topic.createdBy.username}</div>

            <div class="col-md-6">
                Subscriptions:
                <div>${subscount}</div></div>

            <div class="col-md-6">

                Posts:
                <div><a>${postcount}</a></div></div>
        </div>

        <div class="row">
            <div class="col-md-5">
                <g:if test="${subs.topic.createdBy.username==session.uname}">

                </g:if>
                <g:else>
                    <g:if test="${tids.contains(subs.topic.id)}">
                        <g:link controller="Subscription" action="unsubscribe" params="[id: subs.topic.id,page:'dashboard']">  Unsubscribe </g:link>
                        <br>
                    </g:if>
                    <g:else>
                        <g:link controller="Subscription" action="subscribe" params="[id: subs.topic.id,page:'dashboard']">  Subscribe </g:link>
                        <br>

                    </g:else>
                </g:else>
            </div>

            <div class="col-md-7">
                <g:form controller="subscription" action="updateSerious">
                    <g:field type="hidden" name="sid" value="${subs.id}"></g:field>
                    <g:field type="hidden" name="page" value="topic"></g:field>
                    <g:select onChange="submit()" name="seriousness"
                              from="${['CASUAL', 'SERIOUS', 'VERY_SERIOUS']}"
                              value="${subs.seriousness}"/>
                </g:form></div></div>

    </div>

</div>