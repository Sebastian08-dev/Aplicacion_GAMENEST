
<!DOCTYPE html>
<html>
<head>
	<script src="https://kit.fontawesome.com/e8fa2e31b4.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../css/card.css">
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
    
</head>
    <style>
        .container{
            padding-top: 10%; /*Espacio entre el header y form*/
        }
    </style>
<body>
    <form action="<%=request.getContextPath()%>/ControladorProcesarCompra" method="post" accept-charset="UTF-8" ">
    <div class="container">
        <div class="left">
            <p>Métodos de Pago</p>
            <hr style="border:1px solid #ccc; margin: 0 15px;">
            <div class="methods">
                <div onclick="doFun()" id="tColorA" style="color: #2C2C3E;">
                    <i class="fa-solid fa-credit-card" style="color: #2C2C3E;"></i> Tarjeta de crédito
                </div>
                <div onclick="doFunA()" id="tColorB" style="color: #2C2C3E;">
                    <i class="fa-solid fa-building-columns"></i> Yape
                </div>
                <div onclick="doFunB()" id="tColorC" style="color: #2C2C3E;">
                    <i class="fa-solid fa-wallet"></i> Plin
                </div>
            </div>
            <hr style="border:1px solid #ccc; margin: 0 15px;">
        </div>
        <div class="center">
            <a href="">
                <img alt="Credit Card Logos" title="Logos" src="https://www.shift4shop.com/images/credit-card-logos/cc-lg-4.png" width="250" height="auto"/>
            </a>
            <hr style="border:1px solid #ccc; margin: 0 15px;">
            <div class="card-details">
                <p>Número de la tarjeta</p>
                <div class="c-number" id="c-number">
                    <input id="number" name="number" class="cc-number" placeholder="Número de la tarjeta" maxlength="19" required>
                    <i class="fa-solid fa-credit-card" style="margin: 0;"></i>
                </div>
                <div class="c-details">
                    <div>
                        <p>Fecha de expiración</p>
                        <input id="e-date" name="e-date" class="cc-exp" placeholder="MM/YY" required maxlength="5">
                    </div>
                    <div>
                        <p>CVV</p>
                        <div class="cvv-box" id="cvv-box">
                            <input id="cvv" name="cvv" class="cc-cvv" placeholder="CVV" required maxlength="3">
                            <i class="fa-solid fa-circle-question" title="3 digits on the back of the card" style="cursor: pointer;"></i>
                        </div>
                    </div>
                </div>
                <div class="email">
                    <p>Nombres</p>
                    <input type="text" name="nombres" id="nombres" value="<%=nombre%>" <% if (usuarioAutenticado) { %>readonly<% }%> style="margin-bottom: 20px;" required>
                    
                    <p>Email</p>
                    <input type="email" name="email" id="email" value="<%=correo%>" <% if (usuarioAutenticado) { %>readonly<% }%> required>
                    
                    <!-- ID  -->
                    <input type="hidden" name="idCliente" id="idCliente" value="<%=id%>" <% if (usuarioAutenticado) { %>readonly<% }%> style="margin-bottom: 20px;" required>
                    
                </div>
                
                <input type="hidden" name="total" id="total" value="0">
                <button type="submit"  id="payButton">Pagar</button>
            </div>
        </div>
        <div class="right">
            <p>Información del pedido</p>
            <div class="details">
                <div style="font-weight: bold;" id="order-details"></div>
            </div>
            <div class="final-price">
                <div style="font-weight: bold;" id="total-price"></div>
            </div>
        </div>
    </div>
</form>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        displayOrderDetails();
    });

    function displayOrderDetails() {
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        let orderDetails = document.getElementById('order-details');
        let totalPrice = document.getElementById('total-price');
        let total = 0;
        orderDetails.innerHTML = '';
        if (cart.length === 0) {
            orderDetails.innerHTML = '<p>No hay productos en el carrito.</p>';
        } else {
            for (let i = 0; i < cart.length; i++) {
                let subtotal = cart[i].precio * cart[i].quantity;
                total += subtotal;
                orderDetails.innerHTML += '<p>' + cart[i].quantity + ' x ' + cart[i].nombre + ' - $' + cart[i].precio + '</p>';
            }
            totalPrice.innerHTML = 'Total a pagar: $' + total;
        }
        document.getElementById('total').value = total;
    }
   
</script>
    <script src="../js/card.js" type="text/javascript"></script>
</body>
</html>