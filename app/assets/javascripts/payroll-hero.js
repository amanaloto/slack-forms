$(function(){
  $('.js-payroll-hero-select').change(function(){
    var selected = $(this).val(),
        $target = $($(this).data('target'));

    if (selected == 'Overtime') {
      $target.hide();
      $target.removeClass('hidden');

      $target.fadeIn();
      $target.find('select').prop('disabled', false);
    }
    else {
      $target.fadeOut('fast', function(){
        $(this).addClass('hidden');
        $(this).find('select').prop('disabled', true);
      });
    }
  });
});
