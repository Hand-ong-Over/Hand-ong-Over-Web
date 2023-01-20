let photo_cnt = $('#photos').children("input").length;

function addPhoto() {
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
    if (photo_cnt > 0) {
        $('#photos').children("input:last").remove();
        $('#photos').children("img:last").remove();
        photo_cnt--;
    }
    if (photo_cnt === 0) {
        $('#remove-photo-button').addClass('d-none');
    }
}