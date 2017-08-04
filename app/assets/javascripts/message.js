

$(document).on('turbolinks:load', function () {

  function buildHTML(message) {

    if (message.image) {
      var image = '<p class="message__image">\n                        <img src="' + message.image + '" width="100" height="100">\n                  </p>';
    } else {
      var image = '';
    };
    var html = '<div class="message">\n                  <span class="message__username">\n                          ' + message.user_name + '\n                  </span>\n                  <span class="message__date">\n                          ' + message.created_at + '\n                  </span>\n                  <p class="message__text">\n                          ' + message.body + '\n                  </p>\n                  ' + image + '\n                </div>';
    return html;
  }

  function scroll() {
    $('.messages').animate({ scrollTop: $(".messages")[0].scrollHeight }, "slow");
  }

  function autoupdate() {
    if (document.location.href.match("/messages")) {
      $.ajax({
        url: window.location.href,
        type: 'GET',
        dataType: 'json'
      }).done(function (data) {
        for (var i = $('.message').length; i < data.messages.length; i++) {
          html = buildHTML(data.messages[i]);
          $('.messages').append(html);
          if (i = data.messages.length) {
            scroll();
          };
        };
      }).fail(function () {
        alert('error');
      });
    }
  }

  $('#new_message').on('submit', function (e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    }).done(function (message) {
      var html = buildHTML(message);
      $('.messages').append(html);
      $('#new_message')[0].reset();
      $('input').prop('disabled', false);
      scroll();
    }).fail(function (message) {
      alert("メッセージを入力してください。");
      $('#new_message')[0].reset();
      $('input').prop('disabled', false);
    });
  });

  if (document.location.href.match("/messages")) {
    setInterval(autoupdate, 5000);
  }
});
