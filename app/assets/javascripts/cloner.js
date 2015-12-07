$(function(){

  var incrementBulletPoint = function(str){
    incrementedVal = parseInt(str.charAt(0)) + 1;
    return(incrementedVal + '.');
  };

  var clickClonerOnEnter = function(e){
    if (e.which == 13){
      e.preventDefault();

      $(this).closest('.form-group').find('.js-cloner').click();
    }
  }

  $('.js-cloner').click(function(){
    var $target = $($(this).data('target') + ':last'),
        $parent = $target.parents(':first');

    newBullet = incrementBulletPoint($target.find('.input-group-addon').html());

    $clone = $target.clone();
    $clone.find('.input-group-addon').html(newBullet);
    $clone.find('input').val('');

    $clone.insertAfter($target);
    $clone.find('input').focus();
    $clone.keydown(clickClonerOnEnter);
  });

  $('.js-cloneable').keydown(clickClonerOnEnter);

});
