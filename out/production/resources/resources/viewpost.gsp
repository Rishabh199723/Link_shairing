<!doctype html>
<%@ page import="rx.bootcamp.*" %>
<html>
<head>

    <meta name="layout" content="mainlayout"/>
    <script>
        function Rating(username , resourceId , value)
        {

            for(var i=1;i<=5;i++)
            {
                document.getElementById(i).style.color="black";
            }

            for(var i=1;i<=value;i++)
            {
                document.getElementById(i).style.color="orange";
            }

            url="${createLink(controller:'Rating',action:'save')}"


            $.ajax({
                "url":     url,
                "type":    "get",
                "data":    {username : username , resourceId : resourceId , value : value},
                success: function(){
                    document.getElementById("test").innerHTML="SUCCESS"
                }
            });

        }
        function Ratingsprint(value)
        {
            for(var i=1;i<=5;i++)
            {
                document.getElementById(i).style.color="black";
            }

            for(var i=1;i<=value;i++)
            {
                document.getElementById(i).style.color="orange";
            }
        }
    </script>
</head>
<body onload="Ratingsprint('${rating}')">
<br>





               %{--MODEL FOR EDIT link post--}%
               <div class="modal fade" id="editlink">
                   <div class="modal-dialog">
                       <!-- Modal content-->
                       <div class="modal-content">
                           <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal">&times;</button>
                               <h4 class="modal-title" >Edit Link</h4>
                           </div>
                           <div class="modal-body">
                               <g:form class="form-horizontal" controller="Link" action="updatelink" name="linkcreate">
                                   <g:field type="hidden" name="id" value="${resource.id}"></g:field>
                                   <div class="form-group">
                                       <div class="col-sm-2 control-label">Link</div>
                                       <div class="col-sm-10">
                                           <input  name="url" <g:if test = "${resource.hasProperty("link")}">value="${resource.link}"</g:if>
                                                   class="form-control col-sm-8" />
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <div class="col-sm-2 control-label">Description</div>
                                       <div class="col-sm-10">
                                           <textarea class="form-control col-sm-8" name="description" rows="5" id="comment" name="text" >${resource.description}</textarea>
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <div class="col-sm-2 control-label">Topic</div>
                                       <div class="col-sm-10">
                                           <input name="topic" value="${resource.topic.name}" disabled
                                           />
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <div class="col-sm-offset-2 col-sm-10">
                                           <button type="submit" class="btn btn-default">Edit</button>
                                       </div>
                                   </div>
                               </g:form>
                           </div>
                       </div>
                   </div></div>


               %{--MODAL FOR EDIT DOCUMENT--}%
               <div class="modal fade" id="editdocument">
                   <div class="modal-dialog">
                       <!-- Modal content-->
                       <div class="modal-content">
                           <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal">&times;</button>
                               <h4 class="modal-title" >Edit Document</h4>
                           </div>
                           <div class="modal-body">
                               <g:form class="form-horizontal" controller="Document" action="updatedocument" name="documentcreate" enctype="multipart/form-data">
                                   <g:field type="hidden" name="id" value="${resource.id}"></g:field>
                                   <div class="form-group">
                                       <div class="col-sm-2 control-label">Document</div>
                                       <div class="col-sm-10">
                                           <div class="custom-file mb-3">

                                               <input type="file" class="custom-file-input" id="filename" name="doc" />
                                           </div>
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <div class="col-sm-2 control-label">Description</div>
                                       <div class="col-sm-10">
                                           %{--  <input type="email" name="topicName" placeholder="Topic Name"
                                                    class="form-control col-sm-8" />--}%
                                           <textarea class="form-control col-sm-8" name="description" rows="5" id="comment" name="text" >${resource.description}</textarea>
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <div class="col-sm-2 control-label">Topic</div>
                                       <div class="col-sm-10">
                                           <input name="topic" value="${resource.topic.name}" disabled
                                           />
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <div class="col-sm-offset-2 col-sm-10">
                                           <button type="submit" class="btn btn-default">Edit</button>
                                       </div>
                                   </div>
                               </g:form>
                           </div>
                       </div>
                   </div></div>








             <div class="container">
             <div class="row">
             <div class="col-md-6">


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
                                  %{-- <div class="rate" >

                                       <input type="radio" id="5" name="rate" value="5" onclick="Rating('${session.uname}' , '${resource.id}' , '${5}')" />
                                       <label for="5" title="text">5 stars</label>
                                       <input type="radio" id="4" name="rate" value="4" onclick="Rating('${session.uname}' , '${resource.id}' , '${4}')"/>
                                       <label for="4" title="text">4 stars</label>
                                       <input type="radio" id="3" name="rate" value="3" onclick="Rating('${session.uname}' , '${resource.id}' , '${3}')"/>
                                       <label for="3" title="text">3 stars</label>
                                       <input type="radio" id="2" name="rate" value="2" onclick="Rating('${session.uname}' , '${resource.id}' , '${2}')"/>
                                       <label for="2" title="text">2 stars</label>
                                       <input type="radio" id="1" name="rate" value="1" onclick="Rating('${session.uname}' , '${resource.id}' , '${1}')"/>
                                       <label for="1" title="text">1 star</label>

                                   </div>--}%
                               </div></div><br><br>
                                    <div class="row">
                                   <div class="col-md-9"> ${resource.description}<br><br><br>
                                   </div>
                                   <div class="col-md-3">

                                       <span id="1" onclick="Rating('${session.uname}' , '${resource.id}' , '${1}')"class="glyphicon glyphicon-star"></span>
                                       <span id="2" onclick="Rating('${session.uname}' , '${resource.id}' , '${2}')"class="glyphicon glyphicon-star"></span>
                                       <span id="3" onclick="Rating('${session.uname}' , '${resource.id}' , '${3}')"class="glyphicon glyphicon-star"></span>
                                       <span id="4" onclick="Rating('${session.uname}' , '${resource.id}' , '${4}')"class="glyphicon glyphicon-star"></span>
                                       <span id="5" onclick="Rating('${session.uname}' , '${resource.id}' , '${5}')"class="glyphicon glyphicon-star"></span>

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
                                </div></div>
                 <div class="col-md-6">

                     <div class="panel panel-default" style="overflow: auto;height: 500px">
                         <div class="panel-heading">Top Topics</div>
                         <div class="panel-body">
                             <g:each var="topic" in="${trending}" status="i">
                                 <div class="panel-body">
                                     <g:link controller="topic" action="topicshow" params="[id: topic.id]">  ${topic.name} </g:link>
                                     <br>
                                     <i>@${topic.createdBy.username}</i>
                                     <br>
                                     <g:if test="${tids.contains(topic.id)}">


                                         <g:link controller="Subscription" action="unsubscribe" params="[id: topic.id ,td:resource.topic.id,page:"viewpost"]">  Unsubscribe </g:link>  &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}


                                         <br>
                                     </g:if>
                                     <g:else>
                                         <g:link controller="Subscription" action="subscribe" params="[id: topic.id,page:"viewpost"]">  subscribe </g:link>  &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
                                         <br>

                                     </g:else>
                                  %{--<a href="#" >Unsubscribe<s/a> &nbsp &nbsp &nbsp Subscription: &nbsp ${toptopicsub.get(i)} &nbsp &nbsp Posts:${toptopicpost.get(i)}
                                  <br>--}%


                                 </div>
                             </g:each>

                         </div>
                     </div>
                 </div>

             </div>
             </div>


</body>
</html>









