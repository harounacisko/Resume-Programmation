/***********************INDEX.HTML*****************************/
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="script.js" defer></script>

</head>
<body>
    
</body>

</html>
/**********************SCRIPT.JS*******************************/
let list = [
    { team: "Frühdienst", month: 1, name: "Januar", count: 12 },
    { team: "Mitteldienst", month: 1, name: "Januar", count: 3 },
    { team: "Spätdienst", month: 1, name: "Januar", count: 7 },
    { team: "Reserve", month: 1, name: "Januar", count: 2 },


    { team: "Frühdienst", month: 2, name: "Februar", count: 13 },
    { team: "Mitteldienst", month: 2, name: "Februar", count: 3 },
    { team: "Spätdienst", month: 2, name: "Februar", count: 5 },
    { team: "Reserve", month: 2, name: "Februar", count: 3 },


    { team: "Frühdienst", month: 3, name: "März", count: 11 },
    { team: "Mitteldienst", month: 3, name: "März", count: 21 },
    { team: "Spätdienst", month: 3, name: "März", count: 8 },
    { team: "Reserve", month: 3, name: "März", count: 21 },

    { team: "Frühdienst", month: 4, name: "April", count: 21 },
    { team: "Mitteldienst", month: 4, name: "April", count: 21 },
    { team: "Spätdienst", month: 4, name: "April", count: 21 },
    { team: "Reserve", month: 4, name: "April", count: 21 },

    { team: "Frühdienst", month: 5, name: "Mai", count: 21 },
    { team: "Mitteldienst", month: 5, name: "Mai", count: 21 },
    { team: "Spätdienst", month: 5, name: "Mai", count: 21 },
    { team: "Reserve", month: 5, name: "Mai", count: 21 },

    { team: "Frühdienst", month: 6, name: "Juni", count: 21 },
    { team: "Mitteldienst", month: 6, name: "Juni", count: 21 },
    { team: "Spätdienst", month: 6, name: "Juni", count: 21 },
    { team: "Reserve", month: 6, name: "Juni", count: 21 },

    { team: "Frühdienst", month: 7, name: "Juli", count: 21 },
    { team: "Mitteldienst", month: 7, name: "Juli", count: 21 },
    { team: "Spätdienst", month: 7, name: "Juli", count: 21 },
    { team: "Reserve", month: 7, name: "Juli", count: 21 },

    { team: "Frühdienst", month: 8, name: "August", count: 21 },
    { team: "Mitteldienst", month: 8, name: "August", count: 21 },
    { team: "Spätdienst", month: 8, name: "August", count: 21 },
    { team: "Reserve", month: 8, name: "August", count: 21 },

    { team: "Frühdienst", month: 9, name: "September", count: 21 },
    { team: "Mitteldienst", month: 9, name: "September", count: 21 },
    { team: "Spätdienst", month: 9, name: "September", count: 21 },
    { team: "Reserve", month: 9, name: "September", count: 21 },

    { team: "Frühdienst", month: 10, name: "Oktober", count: 21 },
    { team: "Mitteldienst", month: 10, name: "Oktober", count: 21 },
    { team: "Spätdienst", month: 10, name: "Oktober", count: 21 },
    { team: "Reserve", month: 10, name: "Oktober", count: 21 },
]

let getDataByMonth = (m) => {
    return list.filter((l) => l.month == m)
}

let getDataVersionOne = (m) => {
    let data = [];
    list.forEach(element => {
        if (element.month == m) {
            data.push(element);
        }
    });
    return data;
}

let getDataVersionTwo = (m) => {
    let data = [];
    for (const el of list) {
        if (el.month == m) {
            data.push(el);
        }
    }
    return data;
}

let getSum = (list) => {
    const initialValue = 0;
  return  list.reduce((accumulator, currentValue) => accumulator + currentValue.count, initialValue, );
}

console.log(getDataVersionTwo(6));
console.log(getSum(getDataVersionTwo(1)));
