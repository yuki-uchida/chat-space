'use strict';

$(document).on('turbolinks:load', function () {

  function buildHTML(user) {
    var html = '<div class=\'chat-group-user clearfix\'>\n                  <div class=\'chat-group-user__name\'>' + user.name + '</div>\n                  <div class=\'chat-group-user__btn chat-group-user__btn--add\'\n                  data-name="' + user.name + '" data-id="' + user.id + '">\u8FFD\u52A0</div>\n                </div>';
    return html;
  };

  function removeHTML(user) {
    var html = '<div class=\'chat-group-user clearfix\'>\n                  <div class=\'chat-group-user__name\'>' + user.name + '</div>\n                  <div class=\'chat-group-user__btn\n                  chat-group-user__btn--remove\'>\u524A\u9664</div>\n                  <input type=\'hidden\' value="' + user.id + '" name="group[user_ids][]">\n                </div>';
    return html;
  };

  $('.chat-group-form__search').on('keyup', function () {
    $('#user-search-result').empty();
    var name = $('#user-search-field').val();
    $.ajax({
      type: 'GET',
      url: '/users/search',
      data: { keyword: name
      },
      dataType: 'json'
    }).done(function (data) {
      var html = "";
      if (name.length !== 0) {
        $.each(data.users, function (i, user) {
          html += buildHTML(user);
        });
      };
      $('#user-search-result').append(html);
    }).fail(function () {
      alert("ユーザー検索に失敗しました");
    });
    return false;
  });

  $('#user-search-result').on('click', '.chat-group-user__btn--add', function (user) {
    var data = $(this).data();
    var rmv_html = removeHTML(data);
    $('#chat-group-users').append(rmv_html);
    $(this).parent().remove();
  });

  $('#chat-group-users').on('click', '.chat-group-user__btn--remove', function () {
    $(this).parent().remove();
  });
});
