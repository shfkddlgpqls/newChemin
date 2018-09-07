/**
 * 
 */
$('#calendar').fullCalendar({
	header : {
		left : 'prev,next today',
		center : 'title',
		right : 'month, basicWeek, basicDay'
	},
	defaultDate : new Date(),
	editable : false,
	allDay : true,
	eventLimit : true,
	events : function(start, end, timezone, callback) {
		$.ajax({
			url : "${pageContext.request.contextPath}/ajax/test.do",
			type : "get",
			dataType : "json",
			success : function(data) {
				console.log("load (CalData) success");
				var events = [];

				$(data).each(function() {
					var clue = $(this).attr('TYPE_NUM');
					switch (clue) {

					case 101:
						events.push({
							title : $(this).attr('COST'),
							start : $(this).attr('AC_DATE'),
							allDay : true,
							color : 'white',
							textColor : 'blue'
						});
						break;
					case 201:
						events.push({
							title : $(this).attr('COST'),
							start : $(this).attr('AC_DATE'),
							allDay : true,
							color : 'white',
							textColor : 'salmon'
						});
						break;
					}
				});
				callback(events);
			},
			error : function(jqxhr, textStatus, errorThrown){
				console.log("error");
				console.log(jqxhr);
				console.log(textStatus);
				console.log(errorThrown);
			}
		});
	}
});