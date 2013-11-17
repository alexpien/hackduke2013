
$( document ).ready(function(){
    $(".thumbnail").mouseenter(function(){
        stash = $(this).attr("id").split("-")[1];
        $(".buttons-"+stash).removeClass("hide");
    }).mouseleave(function(){
        stash = $(this).attr("id").split("-")[1];
        $(".buttons-"+stash).addClass("hide");
        });


    $("#edit").click(function(){
        console.log("hi");
        $(".flipper").toggleClass("flipit");
        $(".flip-container").toggleClass("flipper");
        $(".flipper").toggleClass("flipit");
        
  

});
    $(".delete").click(function(){
        var stash = $(this).attr("id").split("-")[1];
        $.ajax({
            type: "DELETE",
            url: "/stash/"+stash,
            success: function(response){
                console.log(response["deleted"]);
                $("#stash-col-"+stash).remove();
            }
            });
        });
    
    
    $(".delete-post").click(function(){
        var post = $(this).attr("id").split("-")[1];
        $.ajax({
            type: "DELETE",
            url: "/post/"+post,
            success: function(response){
                $("#post-col-"+post).remove();
            }
            });
        });

    $.ajaxSetup({
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $(".like").click(function(){
        
        var stash = $(this).attr("id").split("-")[1];
        $("#icon-"+stash).toggleClass("glyphicon-heart-empty");
        $("#icon-"+stash).toggleClass("glyphicon-heart");
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

    $('.editButton').click(function() {
        $('.stashCommentEdit').show();
    });

});

