const table = document.getElementById('employeed-table');
const button = document.getElementById('buttoncsv');

// Function for get employees

function loadEmployees(){
    fetch('http://localhost:3000/getEmployees')
    .then(res => res.json())
    .then(data => {
        table.innerHTML = '';
        data.forEach(element => {
            table.innerHTML += `
            <tr>
                <td>${element.idEmployee}</td>
                <td>${element.name}</td>
                <td>${element.lastname}</td>
                <td>${element.lastname2}</td>
                <td>${element.email}</td>
                <td>${element.charge}</td>
                <td>${element.city}</td>
                <td>${element.salary}</td>
                <td>${element.age}</td>
            </tr>
            `
        });
    });
}

loadEmployees();