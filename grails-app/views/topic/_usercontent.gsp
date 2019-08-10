<g:each in="${subscription}" var="us" status="i">

    <div class="row">
        <div class="col-md-4">
            <asset:image src="${us.user.photo}" style="width:100%;height:120px"></asset:image></div>

        <div class="col-sm-8">
            <div style="font-size:23px;"><b
                    style="text-transform: uppercase">${us.user.fName}&nbsp${us.user.lName}</b></div>

            <div>@${us.user.username}</div>

            <div class="col-sm-6">
                Subscriptions:
                <div>${subscriptioncount.getAt(i)}</div></div>

            <div class="col-sm-6">

                Topics:
                <div><a>${postscount.getAt(i)}</a></div></div>


        </div></div>
    <br>

</g:each>