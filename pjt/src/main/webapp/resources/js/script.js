$(document).ready(function() {

    $('.color-choose input').on('click', function() {
        var headphonesColor = $(this).attr('data-image');
  
        $('.active').removeClass('active');
        $('.left-column img[data-image = ' + headphonesColor + ']').addClass('active');
        $(this).addClass('active');
    });

    // $('.color-choose input[type="radio"]#red + label span').css("background", "#C91524");
    // $('.color-choose input[type="radio"]#blue + label span').css("background", "#314780");
    // $('.color-choose input[type="radio"]#black + label span').css("background", "#323232");
  
  });

