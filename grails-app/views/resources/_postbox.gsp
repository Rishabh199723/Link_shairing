<div class="panel panel-default">


    <div class="panel-body">
        <div class="row">
            <div class="col-md-2">
                <asset:image src="${resource.createdBy.photo}" style="width:100%;height:100%"/></div>
            <div class="col-md-4">
                <div style="font-size:18px;"><b>${resource.createdBy.fName}&nbsp${resource.createdBy.lName}</b></div>
                <div>@${resource.createdBy.username}</div></div>
            <div class="col-md-6">
                <g:link controller="topic" action="topicshow" params="[id: resource.topic.subscriptions1.id.getAt(0)]">${resource.topic.name}</g:link><br>
                ${resource.dateCreated}
            </div></div><br><br>
        <div class="row">
            <div class="col-md-9"> ${resource.description}<br><br><br>
            </div>
            <div class="col-md-3">

                <span id="1" onclick="rating('${userdata.username}' , '${resource.id}' , '${1}')"class="glyphicon glyphicon-star"></span>
                <span id="2" onclick="rating('${userdata.username}' , '${resource.id}' , '${2}')"class="glyphicon glyphicon-star"></span>
                <span id="3" onclick="rating('${userdata.username}' , '${resource.id}' , '${3}')"class="glyphicon glyphicon-star"></span>
                <span id="4" onclick="rating('${userdata.username}' , '${resource.id}' , '${4}')"class="glyphicon glyphicon-star"></span>
                <span id="5" onclick="rating('${userdata.username}' , '${resource.id}' , '${5}')"class="glyphicon glyphicon-star"></span>

            </div></div><br><br><br>
        <p id="test"></p>


        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-2">
                <g:link controller="Resources" action="deletepost" params="[id:resource.id]">Delete post</g:link>
            </div>
            <g:if test="${resource.hasProperty('link')}">
                <div class="col-md-2">
                    <a href="" data-toggle="modal" data-target="#editlink">Edit Link</a>
                </div>
            </g:if>
            <g:else>
                <div class="col-md-2">
                    <a href="" data-toggle="modal" data-target="#editdocument">Edit Document</a>
                </div>
            </g:else>


            <g:if test="${resource.hasProperty('link')}">
                <div class="col-md-2">
                    <a>Download</a>
                </div>

                <div class="col-md-2">
                    <a href="${resource.link}" target="_blank">View full site</a>   </div>
            </g:if>
            <g:else>
                <div class="col-md-2">
                    <g:link controller="Document" action="download" params="[id:resource.id]">Download</g:link>
                </div>

                <div class="col-md-2">
                    <a>View full site</a>   </div>
            </g:else>

        </div>




    </div>
</div>