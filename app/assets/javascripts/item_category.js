$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){ 
    var childSelectHtml = '';
      childSelectHtml = `<div class='product_category-select' id= 'children_wrapper'>
                          <select class="category_select-box" id="child_category" name="item[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>`;
    $('.product_select-children').append(childSelectHtml);
  }
  function appendgrandChidrenBox(insertHTML){ 
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='product_category-select' id= 'grandchildren_wrapper'>
                                <select class="category_select-box" id="grandchild_category" name="item[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                <select>
                              </div>`;
    $('.product_select-grandchildren').append(grandchildrenSelectHtml);
  }
  $(document).on('change', '#category_select', function(){ 
    var productcategory = document.getElementById('category_select').value; 
    if (productcategory != ''){
      $.ajax({
        url: '/items/category_children',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
      .done(function(children){  
        var insertHTML = '';
        children.forEach(function(child){  
          insertHTML += appendOption(child); 
        });
        appendChidrenBox(insertHTML); 
        $(document).on('change', '#category_select', function(){
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });
  $(document).on('change', '#child_category', function(){
    var productcategory = document.getElementById('child_category').value;
    if (productcategory != ''){
      $.ajax ({
        url: '/items/category_grandchildren',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
    .done(function(grandchildren){
      var insertHTML = '';
      grandchildren.forEach(function(grandchild){
        insertHTML += appendOption(grandchild);
        });
        appendgrandChidrenBox(insertHTML);  
        $(document).on('change', '#child_category',function(){
          $('#grandchildren_wrapper').remove();
          })
        })  
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
    }
  });
});
