$(document).on('ready page:load', function(){

  $('button[name="get_location"]').on('click', function(ev){
    findMe(ev);
  })

  $('.like_btn').on('click', function(){
    var postID = $(this).data('postid')

    var userID = $(this).data('userid')
    // console.log($(this).hasClass('already_liked'))

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

      });
    }

    if($(this).hasClass('already_liked')){
      var likeId = $(this).data('likeid');
      $.ajax({
        url: '/likes/' + likeId,
        method: 'DELETE'
      });
    }
  });

  $('button[name="follow"]').on('click', function(){
    console.log('follow')

    var follower = $(this).data('current');
    var followed = $(this).data('user');

    $.ajax({
      url: '/relationships',
      method: 'POST',
      dataType: 'html',
      data: {
        relationship: {
          follower_id: follower,
          followed_id: followed
        }
      },
      success: function(){
        alert('success');
      },
      error: function(){
        alert('You are already following this user');
      }
    })
  });

});

var findMe = function(){
  if ('geolocation' in navigator){
    navigator.geolocation.getCurrentPosition(function(position){
      success(position);
    }, failure);

  } else {
    alert ("Geolocation not supported");
  }

  function success(position){
    console.log(position.coords.latitude);
    console.log(position.coords.longitude);

  }


  function failure(err){
    console.log('ERROR(' + err.code + '): ' + err.message);
  }
}
