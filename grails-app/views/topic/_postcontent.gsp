<g:each in="${resources}" var="res" status="i">
    <div class="row">
        <div class="col-md-3">
            <asset:image src="${res.createdBy.photo}" style="width:100%;height:120px"/>
        </div>

        <div class="col-md-9">${res.description}
        <div class="row">
        <div class="col-md-3">
            <g:if test="${res instanceof project.LinkResource}">
                <a  >Download</a>
                </div>
                <div class="col-md-3">
                    <a href="${res.link}" target="_blank">View Full Site</a>
                </div></g:if>
            <g:else>
                <g:link controller="Document" action="download" params="[id:res.id , tid:subs.id]" >Download</g:link>
                </div>
                <div class="col-md-3">
                    <a >View Full Site</a>
                </div>
            </g:else>




            <div class="col-md-3">
                <g:link controller="Reading" action="editread" params="[id:res.id]" >Mark as read</g:link>
            </div>




            <div class="col-md-3">
                <g:link controller="Resources" action="index" params="[id:res.id]" >View post</g:link>

            </div>
        </div>
    </div>

    </div>
    <br>
</g:each>