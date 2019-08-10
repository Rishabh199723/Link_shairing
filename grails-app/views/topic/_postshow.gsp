<div class="panel panel-default">
    <div class="panel-heading"><div style="float:left">Posts : ${subs.topic.name}</div>

        <div class="input-group" style="margin-left:350px">
            <input type="text" class="form-control" placeholder="Search" id="txtSearch"/>

            <div class="input-group-btn">
                <button class="btn btn-basic" type="submit">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </div>
        </div>
    </div>

<div class="panel-body">
<g:render template="postcontent" model="['resources':resources]"></g:render>
</div>
</div>