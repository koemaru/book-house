$(function(){
  $(".js-accordion-title").on('click', function() {
    console.log(this)
    /*クリックでコンテンツを開閉*/
    $(this).next().slideToggle(200);
    /*矢印の向きを変更*/
    $(this).toggleClass('open');
  });
});