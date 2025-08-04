    fetch('http://localhost:3000/clientes')
    .then(response => response.json())
    .then(data => {
        const clientesList = document.getElementById('clientes');
        data.forEach(cliente => {
            const listItem = document.createElement('li');
            listItem.textContent = `Usuario: ${cliente.usuario}, Email: ${cliente.email}`;
            clientesList.appendChild(listItem);
        })
    })
    .catch(err => console.log('Error data.', err)); 