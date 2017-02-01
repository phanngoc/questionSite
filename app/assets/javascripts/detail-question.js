/**
 * Created by Ngoc on 1/29/2017.
 */
$(document).ready(function () {
    // $('.act-add-comment').click(function () {
    //     $('.frame-add-comment').show();
    // })
   	
   	$("#form-add-comment").submit(function(e){
        e.preventDefault();
    });

  //   $('.btn-add').click(function() {
  //   	var token = $('meta[name="csrf-token"]').attr('content');
  //   	var formdata = new FormData($('#form-add-comment')[0]);

  //   	$.ajax({
		//     url: gon.comment_path,
		//     method: 'POST',
		//     processData: false,
  //           contentType: false,
		//     data: formdata
		// }).done(function(result) {
		  
		// });
  //   });

    tinymce.init({
	  selector: '.elem-answer-ques',
	  height: 500,
	  menubar: false,
	  plugins: [
	    'advlist autolink lists link image charmap print preview anchor',
	    'searchreplace visualblocks code fullscreen',
	    'insertdatetime media table contextmenu paste code'
	  ],
	  toolbar: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
	  content_css: '//www.tinymce.com/css/codepen.min.css'
	});

	$('.submit-answer').click(function() {
		tinyMCE.triggerSave();
	});
});