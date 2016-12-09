// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

// Place in top-left corner of screen regardless of scroll position.
textArea.style.position = 'fixed';
textArea.style.top = 0;
textArea.style.left = 0;

// Ensure it has a small width and height. Setting to 1px / 1em
// doesn't work as this gives a negative w/h on some browsers.
textArea.style.width = '2em';
textArea.style.height = '2em';

// We don't need padding, reducing the size if it does flash render.
textArea.style.padding = 0;

// Clean up any borders.
textArea.style.border = 'none';
textArea.style.outline = 'none';
textArea.style.boxShadow = 'none';

// Avoid flash of white box if rendered for any reason.
textArea.style.background = 'transparent';


textArea.value = text;

document.body.appendChild(textArea);

textArea.select();

try {
  var successful = document.execCommand('copy');
  var msg = successful ? 'successful' : 'unsuccessful';
  console.log('Copying text command was ' + msg);
} catch (err) {
  console.log('Oops, unable to copy');
}

document.body.removeChild(textArea);
}

function CopyLink() {
copyTextToClipboard(location.href);
}
