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

    <g:render template="postcontent"/>
       </div>
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









