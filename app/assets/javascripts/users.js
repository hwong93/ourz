$(document).on('ready page:load', function(){

  $('.like_btn').on('click', function(){
    var postID = $(this).data('postid')

    var userID = $(this).data('userid')
    // console.log($(this).hasClass('already_liked'))
    console.log(postID)

    if ($(this).hasClass('not_liked')){
      // $(this).removeClass('already_liked').addClass('not_liked');

      $.ajax({
        url: '/likes',
        method: 'post',
        dataType: 'html',
        data: {
          like: {
            user_id: userID,
            post_id: postID
          }
        },
        success: function(data){
          console.log('it worked!')
        }

      })
    }
  })



});
