document.addEventListener('DOMContentLoaded', event => {
	document.getElementById('continent').addEventListener('change', getData);
	
	document.getElementById('btnSend').addEventListener('click', () => {
		let form = document.getElementsByTagName('form')[0];
		let formData = new FormData(form);
		let json = JSON.stringify(Object.fromEntries(formData));
		postJson(json);
	})
})


getData = async () => {
	let continent = document.getElementsByName('continent')[0].value;
	await fetch('data.php?' + new URLSearchParams({
		continent: continent
	}).toString()).then(res => res.json())
		.then(data => {
			let select = document.getElementById('country');
			addOptionToSelect(select, data)
		})
}

postJson = async (formData) => {
	await fetch("data.php", {
		headers: {
			'Content-Type': 'application/json'
		},
		method: "POST",
		body: formData
	}).then(res => res.json())
		.then(data => console.log(data))
}

addOptionToSelect = (select, data) => {
	select.innerHTML = null;
	let disabledOption = document.createElement("option");
	disabledOption.disabled = true;
	disabledOption.selected = true;
	disabledOption.text = "..."
	select.add(disabledOption);
		for (let i = 0; i < data.length; i++) {
			var option = document.createElement("option");
			option.text = data[i].name;
			option.value = data[i].id;
			select.add(option);
		}
}