$(".groups.new").ready(function(){
  $('#group_type').on('change', function(){
    var timeframe = $('#group_type').val();
    var beginDate = calculateBeginDate(timeframe);

    var endDate = calculateEndDate(timeframe, beginDate);

    beginDate = formatDate(beginDate);
    endDate = formatDate(endDate);

    $('#group_begin_date').val(beginDate);
    $('#group_end_date').val(endDate);
  });
});

function calculateBeginDate(timeframe) {
  var beginDate = null;
  switch(timeframe) {
    case "weekly":
      beginDate = getMonday(new Date());
      break;
    case "daily":
      beginDate = new Date();
      break;
  }
  return beginDate;
}

function calculateEndDate(timeframe, beginDate) {
  var endDate = new Date(beginDate);
  switch(timeframe) {
    case "weekly":
      endDate.setDate(beginDate.getDate()+6);
      break;
    case "daily":
      endDate = beginDate;
      break;
  }  return endDate;
}

function getMonday(d) {
  var day = d.getDay(),
  diff = d.getDate() - day + (day == 0 ? -6 : 0); 
  return new Date(d.setDate(diff));
}

function formatDate(date) {
  return date.getFullYear() +'-'+ ("0" + (date.getMonth() + 1)).slice(-2) +'-'+ ("0" + date.getDate()).slice(-2);
}

