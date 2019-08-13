<ul>
    <g:each in="${subs}" var="sub" status="i">
        <g:link controller="topic" action="topicshow" params="[id:sub.id]"><li>${sub.topic.name}</li></g:link>
    </g:each>
</ul>