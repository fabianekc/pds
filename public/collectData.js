function collectData(pds, quest_id) {
  document.getElementById('searchForm').submit(function(event) {
    event.preventDefault();
    var term = document.getElementById('searchField').val();
    var url = pds + "/api/responses";
    $.ajax({url: url, dataType: 'jsonp',
      data: { response: { value: term, vat: quest_id } }
    });
    document.getElementById('searchForm').hide();
    document.getElementById('result').innerHTML("done");
  });
  return false;
}
