$(function(){
  function buildHTML(comment){
    var html = 
                `<div class="comment__box">
                <div class="comment__box__user">
                ${comment.user_name}
                </div>
                <div class="comment__box__text">
                ${comment.text}
                </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.comments').animate({ scrollTop: $('.comments')[0].scrollHeight});
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('コメントが送信されませんでした');
    })
  })
});