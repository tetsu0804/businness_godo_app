document.addEventListener('DOMContentLoaded', function(){
  var btn = document.getElementById('btn-search')
  var search = document.getElementById('search-work')
  var table = document.getElementById('table-work')
  var thisMonth = document.getElementById('this-month-btn')

  btn.addEventListener('click', function(){
    search.style.display = 'block'
    table.style.display = 'none'
  });

  thisMonth.addEventListener('click', function(){
    table.style.display = 'block'
    search.style.display = 'none'
  });
});
