<div class="panel panel-default" style="overflow: auto;height: 350px">
    <div class="panel-heading"><div style="float:left">Users : ${subs.topic.name}</div>

        <div style="margin-left:350px">View all</div>
    </div>

    <div class="panel-body">

    <g:render template ="usercontent" model="['us':us,'subscriptioncount':subscriptioncount,'postscount':postscount]"/>

    </div>

</div>