<%@ include file="../vista/header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/faq.css" rel="stylesheet" type="text/css"/>
                <link href="../css/header.css" rel="stylesheet" type="text/css"/>
        <link href="../css/carrusel.css" rel="stylesheet" type="text/css"/>
        <link href="../css/gestionarjuegos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class='sidebar'>   
                <div class='top'> <!-- ICONO MENU -->
                    <i class="fa-solid fa-bars" id='btn'></i>
                </div>     
                <ul>
                    <li>
                        <a href='<%=request.getContextPath()%>/index.jsp'>
                            <i class="fa-solid fa-house"></i>
                            <span class='nav-item'>Inicio</span>
                        </a>

                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/ControladorJuego">
                            <i class="fa-solid fa-gamepad"></i>
                            <span class='nav-item'>Juegos</span>
                        </a>                   

                    </li>
                    <li>
                        <a href='<%=request.getContextPath()%>/vista/sugerencias.jsp'>
                            <i class="fa-regular fa-comment"></i>
                            <span class='nav-item'>Sugerencias</span>
                        </a>    
                    </li>
                    <li>
                        <a href='<%=request.getContextPath()%>vista/libroReclamaciones.jsp'>
                            <i class="fa-solid fa-file-circle-exclamation"></i>
                            <span class='nav-item'>Reportes</span>
                        </a>    
                    </li>
                    <li>
                        <a href="vista/FAQ.jsp">
                            <i class="fa-regular fa-circle-question"></i>
                            <span class='nav-item'>Soporte</span>
                        </a>                    
                    </li>
                </ul>
            </div>  
     <!--   <h1>Preguntas Frecuentes</h1>-->
          <div class="accordion">
            <div class="item">
                <div class="question">¿Como comprar en GameNest?</div>
                <div class="answer">
                    <p>   1. Seleccione un juego</p>
                    <p>   2. Presione el botón de agregar el carrito</p>
                    <p>   3. Dentro del carrito presione "Proceder al pago"</p>
                    <p>   4. Seleccione su método de pago y presione "Pagar"</p>
                    <p>   5. Su juego estará disponible para su descarga</p>

                </div>    
                <div class="question">¿Como puedo realizar un reembolso?</div>
                    <p class="answer"> 
                        Para realizar un reembolso dirijasé al apartado de 'Soporte' y seleccione 'Solicitar reembolso'.
                        Tendrá que rellenar un formulario y pasará a revisión.
                    </p>    
                <div class="question">¿Cuales son sus métodos de pago?</div>
                <div class="answer">
                    <p>   Tenemos los siguientes métodos de pago:</p>
                    <p>   1. Yape/Plin</p>
                    <p>   2. Pago Efectivo</p>
                    <p>   3. Tarjeta de crédito/débito</p>

                </div>   
                
                <div class="question">¿Puedo cancelar o modificar mi pedido?</div>
                <div class="answer">
                    <p>Normalmente, los pedidos en nuestra página de venta de videojuegos online no pueden ser cancelados 
                        ni modificados una vez que se ha canjeado el código del producto. Esto se debe a que una vez 
                        que el código se ha canjeado, el producto se considera entregado 
                        y no podemos revertir este proceso. Sin embargo, si aún no has canjeado el código del producto, 
                        puedes ponerte en contacto con nuestro equipo de atención al cliente para discutir opciones 
                        de cancelación o modificación.</p>
                </div> 
                
                <div class="question">¿Tienen servicio de atención al cliente?</div>
                <div class="answer">
                    <p>Puedes contactarnos a nuestro correo: atencioncliente@gamenest.com</p>
                </div> 
                
                <div class="question">¿Tienen ofertas especiales, descuentos o programas de fidelización?</div>
                <div class="answer">
                    <p>Sí, en nuestra página de venta de videojuegos online ofrecemos regularmente ofertas especiales, 
                        descuentos exclusivos y programas de fidelización para nuestros clientes. Estas promociones 
                        pueden incluir descuentos por tiempo limitado en juegos populares, ofertas de temporada, 
                        bundles con contenido adicional y beneficios exclusivos para miembros del programa de fidelización, 
                        como acceso anticipado a lanzamientos, descuentos adicionales y recompensas por compras frecuentes. </p>
                </div>                 
            </div>
            
        </div> 
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const questions = document.querySelectorAll('.question');

                questions.forEach(function (question) {
                    question.addEventListener('click', function () {
                        const answer = this.nextElementSibling;
                        if (answer.style.display === 'block') {
                            answer.style.display = 'none';
                        } else {
                            answer.style.display = 'block';
                        }
                    });
                });
            });
        </script>
    </body>
</html>
