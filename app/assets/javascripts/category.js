$(function(){
  // 子カテゴリーにてoptionタグの作成
  function appendOption(category) {
    let html = 
      `<option value="${category.id}">${category.name}</option>`
    return html;
  }
  
  // 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML) {
    let childrenSelectHtml = '';
    childrenSelectHtml = `<div class="js-category-form" id="child-wrapper">
    <select class="book-container__right__category--input" id="child-category" name="product[category_id]"><option value="">選択してください</option>
    ${insertHTML}
    </select>
    </div>`;
    $('.js-category-form').append(childrenSelectHtml);
  }

  // 親カテゴリー選択後のイベント
  $("#parent-category").on('change', function(){
    let parentID = $("#parent-category").val();
    if (parentID != "") { //親カテゴリーが初期値でないことを確認してAjax通信を開始
      $.ajax({
        type: 'GET',
        url: '/books/get_category_children',
        data: { parent_id: parentID },
        dataType: 'json'
      })
        .done(function (children) {
          $('#child-wrapper').remove(); //親が変更された時、子以下を削除する
          let insertHTML = '';
          children.forEach(function(children){
            insertHTML += appendOption(children);
          });
          appendChildrenBox(insertHTML);
        })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      });
    }
    else { //親カテゴリーが初期値の場合は、子以下を削除する
      $('#child-wrapper').remove();
    }
  });
});