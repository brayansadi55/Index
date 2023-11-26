<?php
    $conex = mysqli_connect("localhost", "root", "","tesco");

    $conexion = mysqli_connect($host, $usuario, $contrasena, $base_de_datos);

if (!$conexion) {
    die("Error en la conexión a la base de datos: " . mysqli_connect_error());
}

// Verifica si el formulario se envió
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recopila los datos del formulario
    $nombre = $_POST["nombre"];
    $paterno = $_POST["paterno"];
    $materno = $_POST["materno"];
    $fechanac = $_POST["fechanac"];
    $sexo = $_POST["sexo"];
    $semestre = $_POST["semestre"];
    $carrera = $_POST["carrera"];
    $usuario = $_POST["usuario"];
    $contrasena = $_POST["contrasena"];

    // Realiza la inserción en la base de datos
    $query = "INSERT INTO Alumno (Nombre, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, Sexo, CarreraID) VALUES ('$nombre', '$paterno', '$materno', '$fechanac', '$sexo', $carrera)";
    
    if (mysqli_query($conexion, $query)) {
        echo "Datos insertados correctamente.";
    } else {
        echo "Error al insertar datos: " . mysqli_error($conexion);
    }

    // Cierra la conexión a la base de datos
    mysqli_close($conexion);
}
?>