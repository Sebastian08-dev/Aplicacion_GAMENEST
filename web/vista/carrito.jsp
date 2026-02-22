<%-- 
    Document   : carrito
    Created on : 7 may 2024, 16:56:25
    Author     : misaj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../css/tabla.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <title>Carrito</title>
</head>
<body>
    <div class="purchase-container">
        <h2>Datos de la Compra</h2>
        <table class="purchase-table">
            <thead>
                <tr>                   
                    <th>Nombre del juego</th>
                    <th>Imagen</th>                   
                    <th>Peso</th>
                    <th>Categoria</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody >
                <c:forEach var="juego" items="${juegosCarrito}">
                    <tr>
                        <td>${juego.idJuego}</td>
                        <td><img src="${juego.imagenJuego}" alt="${juego.nombreJuego}" /></td>
                        <td>${juego.nombreJuego}</td>
                        <td>${juego.pesoJuego}</td>
                        <td>${juego.precio}</td>
                    </tr>
                
                    <tr>
                        
                        <td>Horizon Forbidden West Complete Edition <button onclick="eliminarJuego(this)"><i class="fas fa-trash-alt"></i></button></td>
                        <td><img src="img/1.jpg" alt="imagen"/></td>
                        <td>98,9 GB</td>
                        <td>Aventura</td>
                        <td>$59.99</td>
                    </tr>
                    <tr>
                        <td>Inmortals of Aveum Deluxe Edition <button onclick="eliminarJuego(this)"><i class="fas fa-trash-alt"></i></button></td>
                        <td><img src="img/2.jpg" alt="imagen"/></td>
                        <td>55,3 GB</td>
                        <td>Accion</td>
                        <td>$49.99</td>
                    </tr>
                    <tr>
                        <td>MotorGP 24 <button onclick="eliminarJuego(this)"><i class="fas fa-trash-alt"></i></button></td>
                        <td><img src="img/3.jpg" alt="imagen"/></td>
                        <td>13,2 GB</td>
                        <td>Carrera</td>
                        <td>$39.99</td>
                    </tr>
                    <tr>
                        <td>Tekken 8 Ultimate Edition <button onclick="eliminarJuego(this)"><i class="fas fa-trash-alt"></i></button></td>
                        <td><img src="img/4.jpg" alt="imagen"/></td>
                        <td>76,8 GB</td>
                        <td>Lucha</td>
                        <td>$69.99</td>
                    </tr>
                </c:forEach>

                </tbody>
           
        </table>
    </div>
                   
 
   
</body>
</html>