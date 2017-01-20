function show_simple_task(delay) {
  $('#select_long').hide(delay);
  $('#select_temp').hide(delay);
  $('#select_status').show(delay);
}

function show_long_task(delay){
  $('#select_long').show(delay);
  $('#select_status').hide(delay);
  $('#select_temp').hide(delay);
}

function show_temporary_task(delay){
  $('#select_temp').show(delay);
  $('#select_long').hide(delay);
  $('#select_status').show(delay);
}

function change() {
    var delay= 600;
    var selectBox = document.getElementById("selects");
    var selected = selectBox.options[selectBox.selectedIndex].value;
    if(selected === 'SimpleTask'){
      show_simple_task(delay)
    }
    else{
      if(selected === 'LongTask'){
        show_long_task(delay)
      }
      else {
        if(selected === 'TemporaryTask'){
          show_temporary_task(delay)
        }
      }

    }
}
