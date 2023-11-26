<?php


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tesco";

// Crear una conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Recuperar los valores del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST["usuario"];
    $contrasena = $_POST["contrasena"];
    
     // Preparar la consulta
     $stmt = $conn->prepare($sql);
     $stmt->bind_param("ss", $NombreUsuario, $ContraseñaHash);
 
     if ($stmt->execute()) {
         // Verificar si se encontró un usuario con las credenciales proporcionadas
         $result = $stmt->get_result();
 
         if ($result->num_rows === 1) {
             // Usuario autenticado
             ?>
<h3 class="exito"> Credenciales incorrectas. Inténtalo de nuevo. </h3> //header("Location: panel_usuario.php"); //
Redirige al panel de usuario
<?php
         } else {
            ?>
<h3 class="success"> Credenciales incorrectas. Inténtalo de nuevo. </h3>
<?php
         }
     } else {
        ?>
<h3 class="error"> Error en la consulta </h3>
<?php
     }
 
     $stmt->close();

    $conn->close();
}
?>