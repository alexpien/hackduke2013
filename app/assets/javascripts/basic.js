$('#new_post_form').submit(function() {  
    var valuesToSubmit = $(this).serialize();
    $.ajax({
        url: "post/create", //sumbits it to the given url of the form
        data: valuesToSubmit,
        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
        //act on result.
       alert("success"
    });
    return false; // prevents normal behaviour
});
