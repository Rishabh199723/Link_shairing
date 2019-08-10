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