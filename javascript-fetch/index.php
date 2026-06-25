<!DOCTYPE html>
<html lang="de">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script src="script.js"></script>
</head>

<body>
	<form>
		<label for="continent">Continent: </label>
		<select name="continent" id="continent">
			<option value="" disabled selected>Select your option</option>
			<option value="europe">Europe</option>
			<option value="afrique">Afrique</option>
		</select>
		<label for="country">Country: </label>
		<select name="country" id="country">
			<option value="" disabled selected>...</option>
		</select>
		<label for="day">Day: </label>
		<input type="number" name="day" id="day">
		<button type="button" id="btnSend">send</button>
	</form>
</body>

</html>