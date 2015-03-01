$(".groups.new").ready(function(){
  $('#group_type').on('change', function(){
    var timeframe = $('#group_type').val();
    console.log(timeframe)  
  });
});