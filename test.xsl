<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Examen tipo test</title>
                <style>
                    body {
                        font-family: "Montserrat", sans-serif;
                        margin: 20px;
                        background-color: antiquewhite;
                    }
                    .pregunta {
                        background: white;
                        padding: 15px;
                        margin-bottom: 15px;
                        border-radius: 8px;
                    }
                    .enunciado {
                        font-weight: bold;
                        margin-bottom: 10px;
                    }
                    .a_subtitulo{
                        text-decoration: none;
                        color: grey;
                    }
                        .a_subtitulo:hover{
                        color: orange;
                    }

                    .menu {
    position: relative;
    display: inline-block;
}

.menu-btn {
    background-color: red;
    color: antiquewhite;
    padding: 10px;
    border: none;
    cursor: pointer;
}

.menu-contenido {
    display: none;
    position: absolute;
    background-color: white;
    min-width: 150px;
    box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
}

.menu-contenido a {
    color: black;
    padding: 10px;
    display: block;
    text-decoration: none;
}

.menu-contenido a:hover {
    background-color: orange;
}

/* 👇 Aquí ocurre la magia */
.menu:hover .menu-contenido {
    display: block;
}

                </style>
            </head>
            <body>
                    

                <div class="menu">
                    <button class="menu-btn">Menú</button>
                    <div class="menu-contenido">
                        <a href="index.html">→Pagina principal </a>
                        <a href="paginaSetup.html">→Instalación</a>
                        <a href="paginaIntroduccion.html">→Introducción</a>
                    </div>
                </div>

                <h2>Tipo test </h2>


                <form>

                    <xsl:for-each select="quiz/pregunta">
                        <div class="pregunta">
                            <div class="enunciado">
                                <xsl:value-of select="@id"/>. 
                                <xsl:value-of select="enunciado"/>
                            </div>

                            <xsl:for-each select="opciones/opcion">
                                <div>
                                    <label>
                                        <input type="radio">
                                            <xsl:attribute name="name">
                                                pregunta<xsl:value-of select="../../@id"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="data-correcta">
                                                <xsl:value-of select="@correcta"/>
                                            </xsl:attribute>
                                        </input>
                                        <xsl:value-of select="."/>
                                    </label>
                                </div>
                            </xsl:for-each>

                        </div>
                    </xsl:for-each>

                    <button type="button">Corregir</button>

                </form>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>