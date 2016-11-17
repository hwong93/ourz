$(document).on('ready page:load', function(){
  $('form[name="comments"]').submit(function(ev){
    ev.preventDefault();
    var $input = $('input[name="comment_text"]');
    var postID = $input.data('postid');
    var comment = $input.val();
    var userID = $input.data('userid');

    $.ajax({
      url: '/comments',
      method: 'post',
      dataType: 'script',
      data: {
        comment: {
          user_id: userID,
          post_id: postID,
          comment: comment
        },
        post_id: postID,
      },
      success: function(data){
        $input.val("");
        console.log('it worked');
      },
      error: function(data){
        alert('comment did not save');
      }
    })

  })
})
