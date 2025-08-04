const formLogin = document.getElementById('formLogin');

formLogin.addEventListener('submit', (event)=>{
    event.preventDefault();

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    fetch('http://localhost:3000/clientes')
    .then(response => response.json())
    .then(
        clientes => {
            const clienteValido = clientes.find(cliente => 
                cliente.email == email && cliente.contrasena == password
            );
            
            if(clienteValido){
                alert('ACCESO CONCEDIDO.')
            }
            else{
                alert('CREDENCIALES INVÁLIDAS.')
            }
            
        })
        .catch(err => console.log('Error de conexion con el servidor.', err));
});