window.onload = function () {
  var code = document.getElementsByTagName('pre');
  Array.from(code).forEach(function (itemA) {
    var span = itemA.getElementsByTagName('span');
    Array.from(span).forEach(function (itemB) {
      if (itemB.firstChild.nodeType === Node.TEXT_NODE) {
        itemB.style['font-family'] = 'jetbrainsmono,normal';
      }
    });
  });
};
