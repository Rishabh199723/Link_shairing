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