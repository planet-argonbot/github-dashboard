$(document).on('page:fetch', function() { NProgress.start(); });
$(document).on('page:change', function() { NProgress.done(); });
$(document).on('page:restore', function() { NProgress.remove(); });

$(document).ready(function() {
  $('.sparkline').sparkline('html', {
    type: 'line',
    width: '136',
    height: '28',
    lineColor: '#000000',
    fillColor: null,
    spotColor: '#000000',
    minSpotColor: '#000000',
    maxSpotColor: '#000000',
    highlightSpotColor: '#000000',
    highlightLineColor: '#000000'
  });
});
