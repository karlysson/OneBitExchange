$(document).ready ->
  $('.btn-exchange').click ->
    source_currency = $("#source_currency").val();
    target_currency = $("#target_currency").val();
    $('#source_currency').val(target_currency);
    $('#target_currency').val(source_currency);
    amount_valid();
    exchange();

  $('#source_currency, #target_currency, #amount').change -> 
    if amount_valid() == true
      exchange();

  amount_valid = -> 
    if $("#amount").val() < 1
      alert "O valor a ser convertido deve ser maior que 1."
      return false;
    else
      return true;

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

