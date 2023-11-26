<?php
$conexion = mysqli_connect("localhost", "root", "", "tesco");

if (!$conexion) {
    die("Error en la conexión a la base de datos: " . mysqli_connect_error());
}

// Verifica si se envió el formulario de inicio de sesión
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["Correo"];
    $contrasena = $_POST["contrasena"];

    // Busca el usuario por su email en la tabla Alumno
    $query = "SELECT AlumnoID, Contrasena FROM Alumno WHERE email = '$email'";
    $result = mysqli_query($conexion, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        // El usuario existe, verifica la contraseña
        $row = mysqli_fetch_assoc($result);
        $hash = $row["Contrasena"];

        if (password_verify($contrasena, $hash)) {
            // Contraseña válida, inicio de sesión exitoso
            $AlumnoID = $row["AlumnoID"];
            // Redirecciona a la página de Citas Escolares después del inicio de sesión exitoso
            header("Location: Citas_Escolares.html?id=$AlumnoID");
            exit; // Asegúrate de salir para evitar ejecución adicional
        } else {
            // Contraseña incorrecta
            echo "<p>Error: La contraseña es incorrecta</p>";
        }
    } else {
        // El usuario no existe
        echo "<p>Error: El usuario no está registrado</p>";
    }

    mysqli_close($conexion);
}
?>
