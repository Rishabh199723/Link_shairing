<g:each in="${resources}" var="res" status="i">
    <ul class="list-inline">
        <li>
            <div class="row">
                <div class="col-md-3">
                    <asset:image src="${res.createdBy.photo}" style="width:100%;height:120px"/></div>
                <div class="col-sm-9">
                    <div class="row">
                        <div class="col-sm-4">
                            <b>${res.createdBy.fName}&nbsp${res.createdBy.lName}</b></div>
                        <div class="col-sm-5">@${res.createdBy.username}</div>
                        <a class=col-sm-3>${res.topic.name}</a></div>
                    <div class="row">
                        ${res.description}
                    </div>
                <div class="row">
                <div class="col-md-3">
                    <g:if test="${res.hasProperty("link")}">
                        <a >Download</a>
                        </div>
                        <div class="col-md-3">
                            <a href="${res.link}">View Full Site</a>
                        </div></g:if>
                    <g:else>

                        <g:link controller="Document" action="download" params="[id:res.id , tid:res.id ,page:"dashboard"]" >Download</g:link>
                        </div>
                        <div class="col-md-3">
                            <a>View Full Site</a>
                        </div>
                    </g:else>
                    <div class="col-md-3">
                        <g:link controller="reading" action="editread" params="[id:res.id]">Mark as read</g:link>
                    </div>
                    <div class="col-md-3">
                        <g:link controller="resources" action="index" params="[id: res.id]">View post</g:link>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</g:each>