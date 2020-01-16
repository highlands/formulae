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
//= require jquery3
//= require jquery-ui/widgets/sortable
//= require rails_sortable
//= require cocoon
//= require popper
//= require bootstrap
//= require_tree .

$(document).ready(function() {
  $('.sortable').railsSortable({
    handle: '.handle'
  });

  $('body').on('click', '[data-form-prepend]', function(e) {
    var obj = $($(this).attr('data-form-prepend'));
    var target = [];
    var target_selector = $(this).attr('data-selector');

    if (typeof target_selector !== typeof undefined && target_selector !== false) {
      target = $(target_selector);
    }

    obj.find('input, select, textarea').each(function() {
      date = new Date().getTime();

      $(this).attr('name', function() {
        if ($(this).attr('name')) {
          return $(this)
            .attr('name')
            .replace('new_record', date);
        }
      });

      $(this).attr('id', function() {
        if ($(this).attr('id')) {
          return $(this)
            .attr('id')
            .replace('new_record', date);
        }
      });
    });

    if (target.length > 0) {
      target.append(obj);
    } else {
      obj.insertBefore(this);
    }

    return false;
  });
});
