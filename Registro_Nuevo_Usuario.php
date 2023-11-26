<?php
// Verificar si se está enviando el formulario de registro
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["registro"])) {
    // Aquí va el código para el registro de nuevos usuarios
    $nombre = $_POST["nombre"];
    $usuario = $_POST["usuario"];
    $contrasena = $_POST["contrasena"];
    $contrasena_cifrada = password_hash($contrasena, PASSWORD_DEFAULT);

    // Conectar a la base de datos
    $conexion = mysqli_connect("localhost", "root", "", "tesco");

    // Verificar la conexión
    if (!$conexion) {
        die("Error en la conexión a la base de datos: " . mysqli_connect_error());
    }

    // Realizar la inserción en la tabla de usuarios (reemplaza con tu tabla)
    $query = "INSERT INTO usuarios (nombre, usuario, contrasena) VALUES ('$nombre', '$usuario', '$contrasena_cifrada')";

    if (mysqli_query($conexion, $query)) {
        echo "Usuario registrado exitosamente.";
    } else {
        echo "Error al registrar el usuario: " . mysqli_error($conexion);
    }

    // Cerrar la conexión a la base de datos
    mysqli_close($conexion);
}

