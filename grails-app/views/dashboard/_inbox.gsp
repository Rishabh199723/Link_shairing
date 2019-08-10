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
    </div>
</div>