$(document).ready(function () {

  $("#form-add-comment").submit(function(e){
      e.preventDefault();
  });

  tinymce.init({
    selector: '.elem-answer-ques',
    height: 500,
    menubar: false,
    plugins: [
      'advlist autolink lists link image charmap print preview anchor',
      'searchreplace visualblocks code fullscreen',
      'insertdatetime media table contextmenu paste code'
    ],
    toolbar: 'undo redo | insert | styleselect | bold italic | alignleft \
      aligncenter alignright alignjustify | bullist numlist outdent indent \
      | link image',
    content_css: '//www.tinymce.com/css/codepen.min.css'
  });

  $('.submit-answer').click(function() {
    tinyMCE.triggerSave();
  });

  $('select[name="verques"]').change(function() {
    var verque_id = $(this).val();
    var question_id = $(this).attr('quesid');
    window.location = '/questions/' + question_id + '/verques/' + verque_id + '/edit';
  });

  $('select[name="verans"]').change(function() {
    var veran_id = $(this).val();
    var answer_id = $(this).attr('ansid');
    window.location = '/answers/' + question_id + '/verans/' + veran_id + '/edit';
  });

  var textOriginal = '';
  var textTitleOriginal = '';

  if (gon.page == 0) {
    textOriginal = $('.original .content').text();
    textTitleOriginal = $('.original .title').text();
  } else if (gon.page == 1) {
    if (typeof(gon.question) != "undefined") {
      gon.objTarget = gon.question;
    } else {
      gon.objTarget = gon.answer;
    }
    textOriginal = gon.objTarget.content;
    textTitleOriginal = gon.objTarget.title;
  }

  function getFragment(original, compare) {
    var diff = JsDiff.diffChars(original, compare);
    var fragment = document.createDocumentFragment();
    diff.forEach(function(part){
      color = part.added ? 'green' :
        part.removed ? 'red' : 'grey';
      span = document.createElement('span');
      span.style.color = color;
      span.appendChild(document
        .createTextNode(part.value));
      fragment.appendChild(span);
    });
    return fragment;
  }
  $('.item-verque .content').each(function(key, item) {
    var text = $(item).text();
    var fragment = getFragment(textOriginal, text);
    $(item).html(fragment);
  });

  $('.item-verque .title').each(function(key, item) {
    var text = $(item).text();
    var fragment = getFragment(textTitleOriginal, text);
    $(item).html(fragment);
  });

  $(".editor_mde").each(function(index, elem) {
    var simplemde = new SimpleMDE({ element: elem });
  });

  function stripQueryStringAndHashFromPath(url) {
    return url.split("?")[0].split("#")[0];
  }

  function appendGet(params, truncate = false) {
    var url = window.location.href;
    if (truncate) {
      url = stripQueryStringAndHashFromPath(url);
    }
    if (url.indexOf('?') > -1){
      url += '&' + params;
    }else{
      url += '?' + params;
    }
    window.location.href = url;
  }

  $('#col-sort').change(function() {
    var status = $(this).val();
    if (status == "all") {
      appendGet("status=all", true);
    } else {
      appendGet("status=" + status, true);
    }
  });

  $(".wr-share").css({display: "none"});
  $(".share-link").click(function() {
    var $divSocial = $(this).next();
    var currentStyle = $divSocial.css("display");
    if (currentStyle == "none") {
      $divSocial.css("display", "block");
    } else {
      $divSocial.css("display", "none")
    }
  });

  $(".marked").each(function(index, elem) {
    var textMarkdown = marked($(elem).html().trim());
    $(elem).html(textMarkdown);
  });
});
