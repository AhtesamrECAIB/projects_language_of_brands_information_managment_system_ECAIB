<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="repositorioAnime">
        <html>
            <head>
                <title>Listado Personajes</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
                      rel="stylesheet"
                      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
                      crossorigin="anonymous"/>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <h2 align="center">Listado Personajes</h2>

                <table class="table table-warning table-bordered" border="2" align="center">
                    <thead class="table-dark">
                        <tr>
                            <th>Protagonista</th>
                            <th>Imagen</th>
                            <th>Datos</th>
                            <th>Caracteristicas</th>
                            <th>Merchandising</th>
                        </tr>
                    </thead>
                    <tbody style="vertical-align: middle">
                        <xsl:for-each select="personajes/personaje">
                            <tr>
                                <td>
                                    <a href="salida_animes.html#{@animeRef}">
                                        <xsl:value-of select="nombreProta"/>
                                    </a>
                                </td>
                                <td>
                                    <img src="{imagenProta/@url}"/>
                                </td>
                                <td>
                                    <xsl:value-of select="datos/edad"/>
                                    <br/>
                                    <xsl:value-of select="datos/altura"/>
                                    <br/>
                                    <xsl:value-of select="datos/sexo"/>
                                </td>
                                <td>
                                    IQ:
                                    <xsl:value-of select="caracteristicas/@IQ"/>
                                    Cuerpo
                                    <xsl:value-of select="caracteristicas/cuerpo"/>
                                </td>
                                <td>

                                    <xsl:for-each select="merchandising">
                                        <xsl:value-of select="."/>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
                        crossorigin="anonymous"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
