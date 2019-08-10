<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <div class="col-md-4">
                <asset:image src="${userdata.photo}" width="100%" height="130px"></asset:image>
            </div>
            <div class="col-md-8">
                <div style="font-size:23px;"><g:link controller="Dashboard" action="viewprofile">${userdata.fName} &nbsp ${userdata.lName}</g:link>
                    <p>@${userdata.username}</p>
                    <p><a href="" data-toggle="modal" data-target="#showtopics">Topics:  &nbsp${topcount}</a>  &nbsp  <a href="" data-toggle="modal" data-target="#showsubscriptions">Subscriptions:${subcounts}</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <br>
</div>