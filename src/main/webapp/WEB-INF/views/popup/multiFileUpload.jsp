<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <style>
    .img-box {position:relative; width:100px; height:100px; display:block;}
    .img-box img {width:100%}
    .img-box a {position:absolute;top:2px;right:2px;color:#fff;box-size: content; border:1px solid #fff;line-height:12px;width:12px;text-align:center}

  </style>

 <body>
  <h1>첨부파일 이미지 미리보기</h1>
  <script>
    $(function() {
        $('#preview').on('change', 'input[type=file]', function(e) {
            var that = this;
            var reader = new FileReader();
            reader.onload = function(r) {
                if (!$(that).next().is('img')) {
                    $(that).after('<img width="200" />');
                }
               $(that).next().attr('src', r.target.result);
            }
            reader.readAsDataURL(e.target.files[0]);
        });
    });
  </script>
  <div id="preview">
    <input type="file" name="file"/>    
  </div>
    
    
  <h1>첨부파일 이미지 다중 업로드</h1>
  <script>
    $(function() {
        $('#multi').on('change', 'input[type=file]', function(e) {
            var that = this;
            var reader = new FileReader();
            reader.onload = function(r) {
                var $img = $('<img width="200" />');
                var $span = $('<span class="img-box"><a href="javascript:void(0)">x</a></span>');
                
                var $cloneFile = $(that).clone().val('');
                var cloneName = $cloneFile.attr('name') + '_' + $('#multi input[type=file]').size();

                $(that).before($cloneFile);
                $(that).hide();
                $(that).attr('name', cloneName);
                $('#multi #file_append').append(that);
                
                $img.attr('src', r.target.result);
                $img.attr('data-name', cloneName);

                $span.append($img);
                $span.find('a').on('click', function() {
                    $('input[type=file][name=' + cloneName + ']').remove();   
                    $(this).closest('span').remove();
                });
                $('#multi').find('p').append($span);
            }
            reader.readAsDataURL(e.target.files[0]);
        });
    });
  </script>
  <div id="multi">
    <div id="file_append"></div>
    <input type="file" name="file"/>
    <p></p>
  </div>

  
  <h1>첨부파일 이미지 Drag & Drop 업로드</h1>
  <script>
    $(function() {
        function init() {
            var appendFiles = [];

            var $dnd = $('#dnd');
            var xhr = new XMLHttpRequest();
	        if (xhr.upload) {
                $dnd.on("dragenter", function(e) {
                    e.stopPropagation();
                    e.preventDefault();

                    e.originalEvent.dataTransfer.dropEffect = "copy";
                    $dnd.css('background-color','#ccc');
                });
                $dnd.on("dragleave", function(e) {
                    e.stopPropagation();
                    e.preventDefault();

                    $dnd.css('background-color','#fefefe');
                });
                $dnd.on("dragover", function(e) {
                    e.stopPropagation();
                    e.preventDefault();

                    e.originalEvent.dataTransfer.dropEffect = "copy";
                    $dnd.css('background-color','#ccc');
                });
                $dnd.on("drop", function(e) {
                    e.preventDefault();

                    $dnd.css('background-color','#fefefe');

                    var files = e.originalEvent.dataTransfer.files;
                    
                    appendFiles = appendFiles.concat(files);
                    $.each(files, function(k, y) {
                        var reader = new FileReader();
                        reader.onload = function(r) {
                        console.log('r', r);
                        };
                        reader.readAsDataURL(files[k]);
                        console.log('drop', files[k]);
                    });
                });
            }
        }
        init();
     //// var formData = new FormData(form);
     //// formData.append('files', appendFiles);

     /// var $f = $('<input type="file" name="files" multiple="multiple" />');
     /// $f.files = appendFiles;
     /// form.append($f);

    });
  </script>
  <div id="dragNdrop">
  <form  enctype="multipart/form-data" method="post">
    <p id="dnd"></p> 
  </form>
  </div>

 </body>