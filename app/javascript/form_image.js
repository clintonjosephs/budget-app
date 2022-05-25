
let image_div = document.getElementById('img_container');
let image_picker = document.getElementById('image_picker');

image_div.addEventListener('click', () => {
  image_picker.click();
});

readURL = (input) => {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_prev')
          .attr('src', e.target.result)
          .width(100)
          .height(100);
      };

      reader.readAsDataURL(input.files[0]);
    }
  }