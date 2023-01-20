<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/picnic"/>
            </head>
            <body>
                <h2 align="center">Listado de personajes</h2>
                <table border="2" align="center">
                    <thead>
                        <tr class='success'>
                            <th>Protagonista</th>
                            <th>Imagen</th>
                            <th>Datos</th>
                            <th>Caracteristicas</th>
                            <th>Merchandising</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="repositorioAnime/personajes/personaje">
                            <xsl:sort select="nombreProta"/>
                            <tr>
                                <td>

                                    <xsl:value-of select="nombreProta"/>
                                </td>
                                <td>
                                    <img width="100px" src="{imagenProta/@url}"/>
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
                                    <xsl:apply-templates select="merchandising/producto"/>
                                    <xsl:apply-templates select="merchandising/precio"/>

                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="merchandising/producto">
        <xsl:for-each select=".">
            <xsl:if test="position() > 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="."/>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="merchandising/precio">
        <xsl:for-each select=".">
            <xsl:if test="position() > 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="."/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>