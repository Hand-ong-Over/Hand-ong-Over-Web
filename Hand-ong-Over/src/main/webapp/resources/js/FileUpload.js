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
    photo_cnt++;
    console.log(photo_cnt);
    let photo = $("<input>");
    photo.attr("type", "file");
    photo.attr("accept", "image/png, image/jpeg");
    photo.attr("id", "photo" + photo_cnt);
    photo.attr("name", "photo" + photo_cnt);
    photo.attr("class", "form-control photo-upload mt-1");
    $('#photos').append(photo);
    $('#remove-photo-button').removeClass('d-none');
}

function removePhoto() {
    console.log(photo_cnt);
    if (photo_cnt === 0) {
        $('#photo' + photo_cnt).val('');
        $('#img' + photo_cnt).remove();
        $('#remove-photo-button').addClass('d-none');
    } else if (photo_cnt > 0) {
        $('#photo' + photo_cnt).remove();
        $('#img' + photo_cnt).remove();
        photo_cnt--;
        if (photo_cnt === 0 && $('#photos').children('img').length === 0) {
            $('#remove-photo-button').addClass('d-none');
        }
    }
}