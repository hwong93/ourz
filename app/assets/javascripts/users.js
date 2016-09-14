$(document).on('ready page:load', function(){

  $('.like_btn').on('click', function(){
    var postID = $(this).data('postid')
    // console.log($(this).hasClass('already_liked'))
    console.log(postID)

    if ($(this).hasClass('already_liked')){
      $(this).removeClass('already_liked').addClass('not_liked');

      $.ajax({
        
      })
    }


  })



});
