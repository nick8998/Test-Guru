document.addEventListener('turbolinks:load', function() {
	var control = document.querySelector("#clock")
	
	if (control) {
		window.addEventListener("load", clock(control))
	}
})

function clock(control){
	let timer; 
	var testTimer = control.dataset.testTimer.split(',')
	let hours = testTimer[0].split('[')[1];
	let minutes = testTimer[1];
	let seconds = testTimer[2].split(']')[0]; 
	countdown();

	function countdown(){
		document.getElementById('clock').innerHTML = hours + ':' + minutes + ':' + seconds;
		seconds--; 
		if (seconds<0) {
			if (minutes > 0) {
				seconds = 59;
				minutes--;
				timer = setTimeout(countdown, 1000);
			} else if (minutes == 0 && hours > 0) {
				minutes = 59;
				seconds = 59;
				hours--;
				timer = setTimeout(countdown, 1000);
			} else if(minutes == 0 && hours == 0) {
				minutes = 0;
				seconds = 0;
				hours = 0;
				location.reload()
			} 			
		}
		else {
		  timer = setTimeout(countdown, 1000);
		} 
	}
}
