
$( document ).ready(function(){

    $.ajaxSetup({
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $(".like").click(function(){
       
        var stash = $(this).attr("id").split("-")[1];
        $("#icon-"+stash).toggleClass("glyphicon-heart-empty");
        $("#icon-"+stash).toggleClass("glyphicon-heart");
        console.log(stash);
        $.ajax({
            type: "POST",
            url: "/likes/stash",
            data: {"stash_id":stash},
            success: function(response){
                console.log(response["score"]);
                
                $("#num-likes-"+stash).text(response["score"]);
}
        });
        
    });




});

