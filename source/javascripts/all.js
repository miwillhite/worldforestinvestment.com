;(function($) {
  /*
   * Formspree
   */

  // Submits the form and renders the appropriate modal
  $('.formspree .submit').on('click', function(e) {
    e.preventDefault();

    var $form = $(e.target).parents('form');

    // Serialize the form data
    var data = $form.serializeArray();

    // Submit the form
    $.ajax({
      url: '//formspree.io/matthew.willhite@gmail.com',
      method: 'POST',
      data: data,
      dataType: 'json'
    }).done(function(data) {
      reveal(modal(true, $form));
    }).fail(function(error) {
      reveal(modal(false, $form));
    });
  });

  // Setups and returns the appropriate modal (success or failure)
  var modal = function(success, $form) {
    var result = success ? 'success' : 'failure';
    var $modal = $('#form-submission-' + result + '-modal');
    $('.message', $modal).text($form.data(result));

    return $modal;
  };

  // Reveals the provided modal
  var reveal = function($modal) {
    $modal.foundation('reveal', 'open');
  };


  /*
   * A/B Testing
   */
  window.WFI = {};
  window.WFI.test = function(version) {
    $('.test').hide();
    $('.test-' + version).show();
  };

  // Detect based on URL
  var version = 'a';
  window.WFI.test(version);

  // Provide A/B tool
  var $testPanel = $('<div id="test-panel" class="panel hide"><a class="button tiny">A</a> <a class="button tiny">B</a></div>');
  $('body').append($testPanel);
  $('#test-panel a').on('click', function(e) {
    e.preventDefault();
    window.WFI.test(e.target.innerText.toLowerCase());
  });

  if (window.location.search.slice(1).split('&')[0] == 'debug') {
    $testPanel.removeClass('hide');
  }

}(jQuery));
