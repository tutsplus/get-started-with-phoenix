import "phoenix_html";
import socket from "./socket";

let BandRegex = /^\/([0-9a-f-]{36})$/i;
let path = document.location.pathname;
let match = path.match(BandRegex);

if (match) {
  let band_id = match[1];
  let channel = socket.channel("rating:" + band_id, {});

  channel.on("rating:changed", (response) => {
    for (var i = 1; i <= 5; i++) {
      let ratingStar = $('#rating-' + response.song + '-' + i);

      ratingStar.removeClass('glyphicon-star glyphicon-star-empty');
      ratingStar.addClass('glyphicon-star' + (Math.round(response.rating) < i ? '-empty' : ''));
    }
  });

  channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) });

  $('.rating-star').on('click', function () {
    let el = $(this);

    channel.push('rating:add', { song: el.data('song'), rating: el.data('rating') });
    el.parent().addClass('rated');
  })
}
