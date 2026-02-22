<%@ include file="../vista/header.jsp" %>

<%@page import="modelo.dto.juego" %>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Detalles del Juego</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
                integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
        
            
        </head>
        <style>
            /* Estilos generales */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #1a1a1d;
                color: #fff;
            }

            main {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 10px;
                box-sizing: border-box;
            }

            #trailerContainer {
                padding: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100%;
                /* Ajusta la altura según necesites */
            }

            iframe {
                display: block;
                /* Hace que el margin:auto funcione para centrar horizontalmente */
                margin: auto;
            }

            .content {
                display: flex;
                flex-direction: column;
                align-items: center;
                background-color: #28282b;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                max-width: 400px;
                width: 100%;
            }

            .page-container {
                display: flex;
                justify-content: center;/* Centra los elementos horizontalmente */
                align-items: start;
                gap: 10px; /* Añade un espaciado de 20px entre los elementos flex */
                
            }
            
            div h4 {
                align-content: center;
            }

            main,
            .main-content {
                flex: 1; /* Permite que ambos elementos crezcan y llenen el espacio disponible */
                padding: 20px;
                max-width: calc(30% - 10px);  /* Ajusta el ancho máximo para considerar el gap */
               
            }

            .picture img {

                max-width: 400px;
                max-height: 400px;
                min-width: 200px;
                min-height: 400px;
                object-fit: cover;
                border-radius: 10px;
            }

            .info {
                text-align: center;
                margin-top: 20px;
            }

            .info h1 {
                margin: 0;
                font-size: 2.5em;
            }

            .info h4 {
                margin: 10px 0;
                font-weight: normal;
                color: #bbb;
                
            }
            

            .actions {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-top: 20px;
            }

            .btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1em;
            }

            .btn.buy {
                background-color: #ff4500;
                color: #fff;
            }

            .btn.watch {
                background-color: #0073e6;
                color: #fff;
            }

            .main-content {
                
                margin-right: 50px;
                max-width: 400%;
            }

            .content-wrapper {
                background-color: #28282b;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                max-width: 800px;
                width: 100%;
                margin: 20px auto;
            }

            .detalleJuego p {
                margin: 10px 0;
                margin-bottom: 15px;
                /* Añade espacio debajo de cada párrafo */
            }

            .detalleJuego {
                padding: 20px;
                /* Añade espaciado interno alrededor del contenido de detalleJuego */
            }

            /* Estilos responsivos */
            @media (max-width: 600px) {

                .content,
                .content-wrapper {
                    padding: 10px;
                }

                .info h1 {
                    font-size: 2em;
                }

                .actions {
                    flex-direction: column;
                }

                .btn {
                    width: 100%;
                    margin-bottom: 10px;
                }

                .btn:last-child {
                    margin-bottom: 0;
                }
            }
        </style>

        <body>
            <% juego j=(juego) request.getAttribute("juego"); if (j !=null) { %>
                <div class="page-container">
                    <main>

                        <div class="content">
                            <div class="picture">
                                <picture>
                                    <img src="${pageContext.request.contextPath}/<%= j.getImagenJuego()%>" alt="${j.nombreJuego}" />
                                </picture>
                            </div>

                            <div>
                                
                                <h4>
                                    <%= j.getCategoria()%>
                                </h4>
                            </div>
                            <div class="actions">
                                <button class="btn buy" onclick="addCarrito('<%= j.getIdJuego() %>', '<%= j.getNombreJuego() %>', <%= j.getPrecio() %>)">Agregar al Carrito</button>
                                <!-- Botón removido para abrir el trailer en una nueva ventana -->
                                <button class="btn watch" onclick="toggleTrailer()">Ver Trailer</button>
                            </div>
                        </div>
                    </main>
                    <div class="main-content">
                        <div class="content-wrapper">

                            <div class="detalleJuego">
                                <h1>
                                    <%= j.getNombreJuego()%>
                                </h1>
                                <p>Peso: <%= j.getPesoJuego()%>
                                </p>
                                <p>Precio: <%= j.getPrecio()%>
                                </p>
                                <p>Descripción: <%= j.getDetalleJuego().getDescripcionJuego()%>
                                </p>
                                <p>Fecha de Estreno: <%= j.getDetalleJuego().getFechaEsterno()%>
                                </p>
                                <p>Plataforma: <%= j.getDetalleJuego().getPlataforma()%>
                                </p>
                                <p>Idioma del Texto: <%= j.getDetalleJuego().getIdiomaTexto()%>
                                </p>
                                <p>Idioma del Audio: <%= j.getDetalleJuego().getIdiomaAudio()%>
                                </p>
                            </div>
                            <!-- Contenedor para el trailer que se puede mostrar/ocultar -->
                            <div id="trailerContainer" style="display:none;">
                                <iframe width="560" height="315" src="<%=j.getDetalleJuego().getUrlVideo()%>"
                                    title="YouTube video player" frameborder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                    referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                            </div>
                            <% } else { %>
                                <p>No se encontraron detalles para este juego.</p>
                                <% }%>
                        </div>


                    </div>
                </div>
                <script>
                    function toggleTrailer() {
                        var trailerContainer = document.getElementById('trailerContainer');
                        if (trailerContainer.style.display === "none") {
                            trailerContainer.style.display = "block";
                        } else {
                            trailerContainer.style.display = "none";
                        }
                    }
                </script>

        </body>

        </html>