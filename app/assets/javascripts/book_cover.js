$(function(){
// 画像をプレビュー表示させる.prev-contentを作成
function buildHTML(image) {
  var html =
    `
    <div class="prev-content">
      <img src="${image}", alt="preview" class="prev-image">
    </div>
    `
  return html;
}
  $(".book-container__left__btn").change(function(){
    console.log(this)
    let file = this.files[0];
    console.log(file)
    var reader = new FileReader();
    console.log(reader)
    reader.readAsDataURL(file);
    reader.onload = function () {
      var image = this.result;
      console.log(image)
      if ($('.prev-content').length == 0) {
        // 読み込んだ画像ファイルをbuildHTMLに渡す
        var html = buildHTML(image)
        // 作成した.prev-contentを表示
        $('.prev-contents').prepend(html);
        // 画像が表示されるのでiconとコメントを隠す
        $('.book-container__left__icon').hide();
        $('.book-container__left__comment').hide();
      } else {
        // もし既に画像がプレビューされていれば画像データのみを入れ替える
        $('.prev-content .prev-image').attr({ src: image });
      }
    }
  });
});