
$( document ).ready(function(){

    

    $(".like").click(function(){
        $(this).toggleClass("is-liked");
        var stash = $(this).attr("id").split("-")[1];
        
        console.log(stash);
        $.ajax({
            type: "POST",
            url: "/likes/stash",
            data: {"stash_id":stash}
        });
    });




});

