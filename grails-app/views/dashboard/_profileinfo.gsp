<div class="panel panel-default">

    <div class="panel-body">
        <div class="col-md-3">
            <asset:image src="${user.photo}" style="width: 100%;height: 100%" /></div>
        <div class="col-md-9">
            <div style="font-size:23px;"><p ><b>${user.fName} &nbsp ${user.lName}</b></p></div>
            <div>@${user.username}</div>

            <div class="col-md-6">
                Subscriptions:
                <div>${subcounts}</div></div>
            <div class="col-md-6">
                Topics:
                <div><a>${topcounts}</a></div></div>
        </div>
    </div>
</div>