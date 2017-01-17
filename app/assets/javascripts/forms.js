function change() {
    var selectBox = document.getElementById("selects");
    var selected = selectBox.options[selectBox.selectedIndex].value;

    if(selected === 'SimpleTask'){
        $('#select_long').hide(600);
        $('#select_temp').hide(600);
        $('#select_status').show(600);
    }
    else{
      if(selected === 'LongTask'){
        $('#select_long').show(600);
        $('#select_status').hide(600);
        $('#select_temp').hide(600);
      }
      else {
        if(selected === 'TemporaryTask'){
          $('#select_temp').show(600);
          $('#select_long').hide(600);
          $('#select_status').show(600);
        }
      }

    }
}

function simple_default() {
  $('#select_long').hide(0);
  $('#select_temp').hide(0);
  $('#select_status').show(0);
}
