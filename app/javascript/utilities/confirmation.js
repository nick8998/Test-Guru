document.addEventListener('turbolinks:load', function(){
	var	passwordField2 = document.querySelector('#user_password_confirmation')
	if (passwordField2) { passwordField2.addEventListener('input', checkConfirmation) }
})

function checkConfirmation() {
	var	passwordField1 = document.querySelector('#user_password').value
	var	passwordField2 = document.querySelector('#user_password_confirmation').value
	if (passwordField1 == passwordField2) {
		document.querySelector('.confirm_alert').classList.add('hide')
		document.querySelector('.confirm_notice').classList.remove('hide')
	} else if (passwordField2 == "") {
		document.querySelector('.confirm_alert').classList.add('hide')
		document.querySelector('.confirm_notice').classList.add('hide')
	} else {
		document.querySelector('.confirm_alert').classList.remove('hide')
		document.querySelector('.confirm_notice').classList.add('hide')
	}
}
