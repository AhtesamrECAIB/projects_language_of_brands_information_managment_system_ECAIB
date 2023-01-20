<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/picnic"/>
            </head>
            <body>
                <h2 align="center">Repositorio de Anime</h2>
                <table border="2" align="center">
                    <thead>
                        <tr class='warning'>
                            <th>Nombre</th>
                            <th>Imagen</th>
                            <th>Generos</th>
                            <th>Ficha</th>
                            <th>Fecha de estreno</th>
                            <th>Temporadas</th>
                        </tr>

                    </thead>
                    <tbody>
                        <xsl:for-each select="repositorioAnime/animes/anime">
                            <xsl:sort select="nombreAnime"/>
                            <tr>
                                <td>
                                    <xsl:value-of select="nombreAnime"/>
                                </td>
                                <td>
                                    <img width="100px" src="{imagenAnime/@url}"/>
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