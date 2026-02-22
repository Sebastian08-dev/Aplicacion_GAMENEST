

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <title>Confirmación de Compra</title>
    <link rel="stylesheet" href="../css/confirmaciones.css">
    <%@ include file="../vista/header.jsp" %>
    
    <%
        // Obtener el usuario, id y correo de la sesión
        String nombre = "";
        String correo = "";
        int id = -1;
        boolean usuarioAutenticado = false;
        if (usuario != null) {
            nombre = usuario.getNombres();
            correo = usuario.getEmail();
            id = usuario.getId();
            usuarioAutenticado = true;
        }
    %>
    <style>
        .container {
            padding-top: 5%; /*Espacio entre el header y form*/
            width: 80%; 
            max-width: 800px; 
            margin: 0 auto;       
        }
        .precio {
            float: right;
            color: #555;
        }
        .precio-total {
            float: right;
            color: #333;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Boleta de Compra</h1>
        <div class="info">
            <p>Nombre</p>
            <input type="text" name="nombres" id="nombres" value="<%=nombre%>" style="margin-bottom: 20px;" required>

            <p>Email</p>
            <input type="email" name="email" id="email" value="<%=correo%>" required>
        </div>
        <div class="purchase-info">
            <h2>Información de la Compra</h2>
            <div id="order-details"></div>
            <p><strong>Monto Total:</strong> <span class="precio-total">$<span id="total-price"></span></span></p>
            <button id="download-pdf" type="button">Descargar PDF</button>
            <button id="end-buy"  onclick="payAndClearCart()" type="button">Finalizar compra</button>
        </div>
    </div>
        
    <script> //Obtener informacion y precios del carrito
        document.addEventListener('DOMContentLoaded', function () {
            displayOrderDetails();
            document.getElementById('download-pdf').addEventListener('click', generatePDF);
        });

        function displayOrderDetails() {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            let orderDetails = document.getElementById('order-details');
            let total = 0;

            orderDetails.innerHTML = '';
            if (cart.length === 0) {
                orderDetails.innerHTML = '<p>No hay productos en el carrito.</p>';
            } else {
                for (let i = 0; i < cart.length; i++) {
                    let subtotal = cart[i].precio * cart[i].quantity;
                    total += subtotal;
                    orderDetails.innerHTML +=
                        '<p>' + cart[i].quantity + ' x ' + cart[i].nombre + '  <span class="precio">$' + cart[i].precio + '</span></p>';
                }
            }
            document.getElementById('total-price').textContent = total.toFixed(2);
        }
        ///////////////////////////////////// PDF ////////////////////////////////////////////////
        function generatePDF() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            // Detalles de la compra
            const orderDetails = document.getElementById('order-details').innerText || 'No disponible';
            const total = document.getElementById('total-price').textContent || '0.00';

            // Agregar contenido al PDF
            doc.setFontSize(16);
            doc.text('Boleta de Compra', 10, 10);
            doc.setFontSize(12);
            doc.text(`Nombre: <%=nombre%>`, 10, 20); //Mostrar nombre
            doc.text(`Email: <%=correo%>`, 10, 30); //Mostrar correo
            doc.text('Información de la Compra:', 10, 40);
            ;
             // Ajustar la posición para los detalles de la compra
            let y = 50;
            const lines = doc.splitTextToSize(orderDetails, 190);
            lines.forEach(line => {
                doc.text(line, 10, y);
                y += 10;
            });

            doc.text(`Monto Total: $${total-price}`, 10, y + 10); //Mostar monto total

            // Descargar el PDF
            doc.save('GAMENEST_boleta_compra.pdf');
        }
        function clearCart() {
        localStorage.setItem('cart', JSON.stringify([])); // Vacia el carrito en localStorage
        showCart(); // Actualiza la visualización del carrito
    }

    // Función para pagar y vaciar el carrito
    function payAndClearCart() {
        clearCart(); // Vacia el carrito
        redirectToCard(); // Redirige a la página de pago
    }
    function redirectToCard() {
        window.location.href = "<%=request.getContextPath()%>/ControladorJuego";
    }
    </script>
</body>
</html>
