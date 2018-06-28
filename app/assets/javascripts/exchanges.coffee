$(document).ready ->
  $('.btn-exchange').click ->
    source_currency = $("#source_currency").val();
    target_currency = $("#target_currency").val();
    $('#source_currency').val(target_currency);
    $('#target_currency').val(source_currency);
    exchange();

  $('#source_currency, #target_currency, #amount').change -> exchange();


  exchange = -> 
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
        type: 'GET'
        dataType: 'json'
        data: {
                source_currency: $("#source_currency").val(),
                target_currency: $("#target_currency").val(),
                amount: $("#amount").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
      return false;
