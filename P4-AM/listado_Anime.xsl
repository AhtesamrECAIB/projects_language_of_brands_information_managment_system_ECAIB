<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="repositorioAnime">
        <html>
            <head>
                <title>Listado Animes</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
                      rel="stylesheet"
                      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
                      crossorigin="anonymous"/>
                <link rel="stylesheet" type="text/css" href="style.css"/>

            </head>
            <body>
                <h2 align="center">Listado Animes</h2>
                <table class="table table-success table-bordered" border="2" align="center">
                    <thead class="table-dark">
                        <tr>
                            <th>Nombre</th>
                            <th>Imagen</th>
                            <th>Generos</th>
                            <th>Ficha</th>
                            <th>Fecha de estreno</th>
                            <th>Temporadas</th>
                        </tr>
                    </thead>
                    <tbody style="vertical-align: middle">
                        <xsl:for-each select="animes/anime">
                            <tr>
                                <td>
                                    <a href="salida_personajes.html#{@protaRef}">
                                        <xsl:value-of select="nombreAnime"/>
                                    </a>
                                </td>
                                <td>
                                    <img src="{imagenAnime/@url}"/>
                                </td>
                                <td>
                                    <xsl:apply-templates select="generos"/>
                                </td>
                                <td>
                                    <p>Estudio:
                                        <xsl:value-of select="ficha/estudio"/>
                                    </p>
                                    <p>Director:
                                        <xsl:apply-templates select="ficha/directores"/>
                                    </p>
                                </td>
                                <td>
                                    <xsl:value-of select="fechaestreno/dia"/>/<xsl:value-of select="fechaestreno/mes"/>/<xsl:value-of
                                        select="fechaestreno/any"/>
                                </td>
                                <td>
                                    <p>Número de temporadas:<xsl:value-of select="temporadas"/>
                                    </p>
                                    <p>Estado:
                                        <xsl:value-of select="temporadas/@estado"/>
                                    </p>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="generos">
        <xsl:for-each select="genero">
            <xsl:if test="position() > 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="."/>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="ficha/directores">
        <xsl:for-each select="director">
            <xsl:if test="position() > 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="."/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
