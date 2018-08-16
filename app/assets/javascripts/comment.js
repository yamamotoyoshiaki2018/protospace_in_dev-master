$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    :
                  </strong>
                    ${comment.text}
                    <p>
                    <a href=/prototypes/${comment.prototype_id}/comments/${comment.id} data-remote="true" rel="nofollow" data-method="delete" >削除</a>
                    </p>
                </p>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + '/comments'
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textbox').val('')
    })
    .fail(function () {
      alert('error');
    })
  })
})

