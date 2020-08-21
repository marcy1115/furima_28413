const pay = () => {
  Payjp.setPublicKey('sk_test_47716e19f2788d5ef00c2262');
  const form = document.getElementsByName('commit');
  form.addEventListener('submit', (e) => {
    e.preventDefault();

    const formResult = document.getElementById('credit-card-form');
    const formData = new FormData(formResult);

    const card = {
      number:    formData.get('number'),
      cvc:       formData.get('cvc'),
      exp_month: formData.get('exp_month'),
      exp_year:  formData.get('exp_year')
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById('credit-card-form');
        const tokenObj = `<input value=${token} type='hidden' name="token">`;
        renderDom.insertAdjacentHTML('beforeend', tokenObj);

        document.getElementById('number').removeAttribute('name');
        document.getElementById('cvc').removeAttribute('name');
        document.getElementById('exp_month').removeAttribute('name');
        document.getElementById('exp_year').removeAttribute('name');
        
        document.getElementById('commit').onsubmit();
      };
    });
  });
};

window.addEventListener('load', pay);