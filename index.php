<?php
$persons = [
    ['name' => 'Adam', 'age' => 23],
    ['name' => 'Eva', 'age' => 25],
    ['name' => 'David', 'age' => 32],
    ['name' => 'Michel', 'age' => 19],
    ['name' => 'Aron', 'age' => 28],
    ['name' => 'Denis', 'age' => 36],
    ['name' => 'Gabriel', 'age' => 29],
    ['name' => 'Lars', 'age' => 24],
];
$prs = ['name' => 'Adam', "age" => 23];

foreach ($persons as $p) {
    echo $p['name'] . " " . $p['age'] . "<br>";
}

echo "<hr>";

for ($i = 0; $i < count($persons); $i++) {
    echo $persons[$i]['name'] . " " . $persons[$i]['age'] . "<br>";
}

echo "<hr>";


foreach ($prs as $key => $value) {
    echo "Key: " . $key . " value: " . $value . "<br>";
}

echo "<hr>";

foreach ($persons as $prs) {
    foreach ($prs as $key => $value) {
        echo "key: " . $key . " value: " . $value . "<br>";
    }
}
