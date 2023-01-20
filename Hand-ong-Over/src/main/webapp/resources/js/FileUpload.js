let photo_cnt = 0;
$(function () {
    photo_cnt = $('#photos').children("input").length - 1;

    console.log($('#photos').children("img").length);
    if ($('#photos').children("img").length > 0) {
        $('#remove-photo-button').removeClass('d-none');
    }

    console.log(photo_cnt);
});

function addPhoto() {
    console.log(photo_cnt);
    let photo = $("<input>");
    photo.attr("type", "file");
    photo.attr("accept", "image/png, image/jpeg");
    photo.attr("id", "photo" + photo_cnt);
    photo.attr("name", "photo" + photo_cnt);
    photo.attr("class", "form-control photo-upload mt-1");
    $('#photos').append(photo);
    $('#remove-photo-button').removeClass('d-none');
    photo_cnt++;
}

function removePhoto() {
    console.log(photo_cnt);
    if (photo_cnt === 0) {
        $('#photos').children("input:last").val('');
        $('#photos').children("img:last").remove();
    } else if (photo_cnt > 0) {
        $('#photos').children("input:last").remove();
        $('#photos').children("img:last").remove();
        photo_cnt--;
        if (photo_cnt === 0) {
            $('#remove-photo-button').addClass('d-none');
        }
    }
}