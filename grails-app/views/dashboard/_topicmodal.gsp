<ul>
    <g:each in="${subs}" var="sub" status="i">
        <g:if test="${sub.topic.createdBy.username==userdata.username}">
            <g:link controller="topic" action="topicshow" params="[id:sub.id]"><li>${sub.topic.name}</li></g:link>
        </g:if>
    </g:each>
</ul>