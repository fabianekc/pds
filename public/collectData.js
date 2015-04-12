function collectData(pds, quest_id) {
  $('#searchForm').submit(function(event) {
    event.preventDefault();
    var term = $('#searchField').val();
    var url = pds + "/api/responses";
    $.ajax({url: url, dataType: 'jsonp',
      data: { response: { value: term, vat: quest_id } }
    });
    $('#searchForm').hide();
    $('#result').innerHTML("done");
  });
  return false;
}
