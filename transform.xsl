<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/items">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Список элементов</title>
                <style>
                    table { border-collapse: collapse; width: 50%; }
                    th, td { border: 1px solid black; padding: 5px; text-align: left; }
                    th { background-color: #f0f0f0; }
                    .highlight { background-color: #d3d3d3; } 
                </style>
            </head>
            <body>
                <h3>Всего элементов: <xsl:value-of select="count(element)"/></h3>
                <table>
                    <tr>
                        <th>Тип</th>
                        <th>Наименование</th>
                    </tr>
                    <xsl:for-each select="element">
                        <tr>
                            <xsl:attribute name="class">
                                <xsl:if test="@name='Монитор' or (@name='Компьютер' and position()=4) or (@name='Принтер' and position()=6)">
                                    highlight
                                </xsl:if>
                            </xsl:attribute>
                            <td><xsl:value-of select="@name"/></td>
                            <td><xsl:value-of select="@value"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>