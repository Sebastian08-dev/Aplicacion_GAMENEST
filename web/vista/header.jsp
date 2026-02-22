<%@page import="modelo.dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="../css/header.css" rel="stylesheet" type="text/css"/>
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
        <link href="../css/carrusel.css" rel="stylesheet" type="text/css"/> 
        <link href="../css/barraLateral.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>    
    <body>
    <!---------------------------------------- BARRA SUPERIOR ---------------------------------------->    
    <header class="main-header">
        <a href="<%=request.getContextPath()%>/index.jsp">
            <i class="fa-solid fa-dragon icon-white"></i>
        </a>
        <div class="search-bar">
            <input type="text" placeholder="Buscar...">
            <button type="button">
                <i class="fa-solid fa-search"></i>
            </button>
        </div>
        <div class="dropdown">
            <button class="btn rounded-pill btn-cart-icon float-end text-white dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="false" aria-expanded="false">
                <i class="fa-solid fa-cart-shopping"></i>
                <span id="cuenta-carrito">0</span>
            </button>
            <ul id="cart-items" class="p-4 dropdown-menu" style="width: 500px">
                <h2 class="text-center">Carrito de compras</h2>
                <hr>
                <h5 class="text-center">No hay productos</h5>
            </ul>
        </div>
        <div class="user-info-container">
            <%
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                if (usuario != null && usuario.getRol().equals("cliente")) {
                    out.print("<span class='user-greeting'>Hola, " + usuario.getNombres() + "</span>");
            %>
            <a href="${pageContext.request.contextPath}/ControladorLogin?accion=cerrar"><i class="fa-solid fa-right-to-bracket cerrar"></i></a>
                <% } else { %>
            <a href="${pageContext.request.contextPath}/vista/login.jsp"><i class="fa-solid fa-user usuario"></i></a>
                <% }%>
        </div>
    </header>
    <!--------------------------------------------------------------------------------------------------> 
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            showCart();
        });

        let total = 0; // Inicializa el total del carrito en 0

        // Función para agregar al carrito
        function addCarrito(productId, producto, precio) {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            const index = cart.findIndex(p => p.id === productId); // Encuentra el índice del producto existente
            if (index !== -1) {
                // Si el producto existe, incrementa su cantidad
                cart[index].quantity += 1;
            } else {
                // Si el producto no existe, lo agrega al carrito
                const product = {id: productId, nombre: producto, precio: precio, quantity: 1};
                cart.push(product);
            }
            localStorage.setItem('cart', JSON.stringify(cart));
            window.location.href = "<%= request.getContextPath() %>/ControladorJuego";
            showCart();
        }

        // Mostrar el carrito
        function showCart() {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            console.log('Carrito:' + cart);
            $('#cart-items').empty();
            $('#cart-items').append('<h2 class="text-center">Carrito de compras</h2><hr>');
            if (cart.length === 0) {
                $('#cart-items').append('<h5 class="text-center">No hay productos</h5>');
            } else {
                total = 0;
                for (let i = 0; i < cart.length; i++) {
                    let subtotal = cart[i].precio * cart[i].quantity; // Calcula el subtotal del producto

                    total += subtotal; // Suma el subtotal al total
                    $('#cart-items').append(
                            '<li>' +
                            cart[i].quantity + ' x ' + cart[i].nombre + ' - $' + cart[i].precio +
                            '<button class="btn btn-danger" onclick="removeFromCart(\'' + cart[i].id + '\')"><i class="fa-solid fa-trash"></i></button>' +
                            '</li>'
                            );
                }

                $('#cart-items').append(
                        '<div class="d-flex justify-content-between mt-3">' +
                        '<h4 class="text-right">Total a pagar: $' + total + '</h4>' +
                         '<button type="button" onclick="redirectToCard()" class="btn btn-primary">Pagar</button>' +
                '</div>'
                        );
            }
            $('#cuenta-carrito').text(cart.length);
        }

        // Eliminar producto del carrito
        function removeFromCart(productId) {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            for (let i = 0; i < cart.length; i++) {
                if (cart[i].id === productId) {
                    if (cart[i].quantity > 1) {
                        // Disminuir la cantidad en 1 si hay más de un producto
                        cart[i].quantity -= 1;
                    } else {
                        // Eliminar el producto del carrito si la cantidad es 1
                        cart.splice(i, 1);
                    }
                    break; // Salir del bucle una vez que se encuentra y actualiza el producto
                }
            }
            localStorage.setItem('cart', JSON.stringify(cart));
            showCart(); // Actualizar la visualización del carrito
        }
        
         function redirectToCard() {
        window.location.href = "<%=request.getContextPath()%>/vista/card.jsp";
    }
    </script>
    </body>
</html>
