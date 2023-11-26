<?php
$conexion = mysqli_connect("localhost", "root", "", "tesco");

if (!$conexion) {
    die("Error en la conexión a la base de datos: " . mysqli_connect_error());
}
$idAlumno = null;
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
    $telefono =  $_POST["telefono"]; 
    $email = $_POST["email"];
    $contrasena = $_POST["contrasena"];

    // Asigna el ID de la carrera en función del nombre de la carrera
    $carreraID = 0;

    // Aquí asignamos el ID de la carrera basado en el nombre
    if ($carrera === "Ingenieria Sistemas Computacionales") {
        $carreraID = 1;
    } elseif ($carrera === "Ingeniería Industrial") {
        $carreraID = 2;
    } elseif ($carrera === "Ingeniería Electromecánica") {
        $carreraID = 3;
    } elseif ($carrera === "Ingeniería Mecatrónica") {
        $carreraID = 4;
    } elseif ($carrera === "Ingeniería Ambiental") {
        $carreraID = 5;
    } elseif ($carrera === "Ingeniería Materiales") {
        $carreraID = 6;
    } elseif ($carrera === "Ingeniería Gestión Empresarial") {
        $carreraID = 7;
    } elseif ($carrera === "Ingeniería Tecnologías de Información y Comunicación") {
        $carreraID = 8;
    } elseif ($carrera === "Ingeniería Química") {
        $carreraID = 9;
    } elseif ($carrera === "Ingeniería Civil") {
        $carreraID = 10;
    } elseif ($carrera === "Licenciatura en Administración") {
        $carreraID = 11;
    }

    // Hash de la contraseña
    $hashedPassword = password_hash($contrasena, PASSWORD_DEFAULT);

    // Realiza la inserción en la base de datos con la contraseña hasheada
    $query = "INSERT INTO Alumno (Nombre, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, Sexo, CarreraID, Telefono, Email, Contrasena) VALUES ('$nombre', '$paterno', '$materno', '$fechanac', '$sexo', $carreraID, '$telefono', '$email', '$hashedPassword')";
    
    if (mysqli_query($conexion, $query)) {
        // Obtener el ID del usuario insertado
        $idAlumno = mysqli_insert_id($conexion);

        echo "<script>
            alert('Guarde el número que se muestra para su registro: " . $idAlumno . "');
            setTimeout(function() {
                window.location.href = 'login.html';
            }, 1000); 
        </script>";

        // header("Location: login.html");
        // exit;
    } else {
        echo "Error al insertar datos: " . mysqli_error($conexion);
    }

    mysqli_close($conexion);
}
?>
