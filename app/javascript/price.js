window.addEventListener('load', function(){

  const itemPrice   = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit      = document.getElementById("profit");

  itemPrice.addEventListener( 'input', function(){
    // ①：入力された金額を取得
    tax = itemPrice.value
    // ②：①で取得した金額を使って計算
    fee = tax * 0.1
    profitPrice = tax - fee
    // ③：②計算した値をビューに表示
    addTaxPrice.innerHTML = fee
    profit.innerHTML = profitPrice
  });
});