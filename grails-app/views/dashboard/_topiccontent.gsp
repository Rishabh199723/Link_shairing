<g:each var="topic" in="${toptopics}" status="i">
    <div class="panel-body">
        <g:link controller="topic" action="topicshow" params="[id: topic.id]">${topic.name}</g:link>
        <br>
        <i>@${topic.createdBy.username}</i>
        <br>
        <g:if test="${tids.contains(topic.id)}">
            <g:link controller="Subscription" action="unsubscribe" params="[id: topic.id,page:'dashboard']">Unsubscribe</g:link> &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
            <br>
        </g:if>
        <g:else>
            <g:link controller="Subscription" action="subscribe" params="[id: topic.id,page:'dashboard']">Subscribe</g:link> &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
            <br>
        </g:else>
    %{-- <a href="#" >Unsubscribe</a> &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
     <br>--}%

    </div>
</g:each>