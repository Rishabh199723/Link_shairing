<!doctype html>
<html>
<head>
    <meta name="layout" content="mainlayout"/>
    <script>
        function searchfun() {
            var input, filter;


            input = document.getElementById("search");
            filter = input.value.toLowerCase();
            var url = "${createLink(controller:'Resources',action:'search')}"

            $.ajax({
                "url": url,
                "type": "get",
                "data": {value: filter},
                success: function (resp) {
                    console.log(resp.resources)
                    document.getElementById("showResources").innerHTML = resp.resources

                }
            });
        }

        function Show() {
            console.log("hey")
            document.getElementById("drop").style.display = "block";
        }
    </script>
</head>

<body>
<br>
<br>

<div class="col-md-6">

    <p style="color:red">${flash.message3}</p>

    <div class="panel panel-default">

        <div class="panel-body">
            <div class="row">
                <div class="col-md-4">
                    <asset:image src="${userdata.photo}" width="100%" height="130px"></asset:image>
                </div>

                <div class="col-md-8">
                    <div style="font-size:23px;"><g:link controller="Dashboard"
                                                         action="viewprofile">${userdata.fName} &nbsp ${userdata.lName}</g:link>

                        <p>@${userdata.username}</p>

                        <p><a href="" data-toggle="modal"
                              data-target="#showtopics">Topics:   &nbsp${topcount}</a>  &nbsp  <a href=""
                                                                                                  data-toggle="modal"
                                                                                                  data-target="#showsubscriptions">Subscriptions:${subcounts}</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <br>
    </div>

    <div class="panel panel-default" style="overflow: auto;height: 500px">
        <div class="panel-heading">Subscriptions  &nbsp ${flash.message1}</div>

        <div class="panel-body">
            <g:each var="sub" in="${subs}" status="i">
                <g:if test="${i < 5}">
                    <div class="panel-body">
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

                    </div>
                </g:if>
            </g:each>
        </div>

    </div>


    <div class="panel panel-default" style="overflow: auto;height: 500px">
        <div class="panel-heading">Top Topics</div>

        <div class="panel-body">
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

        </div>
    </div>
</div>

%{--RIGHT SIDE-----------------------------------}%
<div class="col-md-6">
    <div class="panel panel-default">
        <div class="panel-heading"><div style="float:left">Inbox</div>

            <div class="input-group" style="margin-left:350px">
                <input type="text" class="form-control" placeholder="Search" id="search" onkeyup="searchfun()"/>

                <div class="input-group-btn">
                    <button class="btn btn-basic" type="submit">
                        <span class="glyphicon glyphicon-search" style="height: 21px"></span>
                    </button>
                </div>
            </div>
        </div>

        <div class="panel-body" id="showResources">
            <g:render template="/resources/showunread" model="['resources': resources]"/>
            %{--<g:each in="${resources}" var="res" status="i">
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
            </g:each>--}%
        </div>
    </div>
</div>

</body>

</html>