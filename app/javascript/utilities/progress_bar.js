document.addEventListener('turbolinks:load', function() {
	var control = document.querySelector(".progress-bar")
	
	if (control) {
	window.addEventListener("load", function() {

		var progressBar = control.dataset.progressBar
		document.querySelector(".progress-bar").innerHTML = progressBar
		document.querySelector(".progress-bar").style.width = progressBar + '%'
	})}
}) 
