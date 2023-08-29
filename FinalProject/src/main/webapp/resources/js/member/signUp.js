console.clear();

$('#checkall').change(function() {
  if ( this.checked ) {
    $('.form-1__checkbox-item:not(:checked)').prop('checked', true);
  }
  else {
    $('.form-1__checkbox-item:checked').prop('checked', false);
  }
});

$('.form-1__checkbox-item').change(function() {
  let allChecked = $('.form-1__checkbox-item:not(:checked)').length == 0;
  $('.form-1__checkbox-all').prop('checked', allChecked);
});

console.clear();

function Form1__init() {
  $('form input[type="email"]').focus(function() {
    $(this).addClass('started');
  });
  
  $('form input[name="password"]').focus(function() {
    $(this).addClass('started');
  });
  
  $('form input[type="tel"]').focus(function() {
    $(this).addClass('started');
  });
}

Form1__init();