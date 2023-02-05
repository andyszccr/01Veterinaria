'se coloca la libreria de tipo xml para la lectura de archivos
Imports System.Xml
Imports System.Xml.XmlText
Imports System.IO


Public Class XMLdato
    'lectura de archivos de tipo xml

    'variables 
    Dim ruta As String
    Dim linea As String
    Dim split As String
    Dim tipoArchivo As String = "xml files (*.xml)|*.xml|All files (*.*)|*.*"
    Dim cedulanode As Integer
    '-------------------------------------------------------------------------------------


    'la lectura del xml 
    Dim readxml = New XmlTextReader("Dueños.xml")
    Dim readxml2 = New XmlTextReader("Mascotas.xml")




    Dim documentxml As New XmlDocument
    Dim Archivoxml As XmlReader
    Dim Dataset As New DataSet
    Dim escribir As XmlWriter
    'tablas 
    Dim nodlist As XmlNodeList
    Dim tabla As DataTable
    Dim tabla2 As DataTable

    'nodos
    Dim nodos As XmlNode
    Dim nodos2 As XmlNode
    Dim nodoID As XmlNode
    Dim nodoDueño As XmlNode


#Region "PROPERTIES "

    'property de ruta 
    Public Property _ruta As String
        Get
            'se le devuelve un valor 
            Return ruta
        End Get
        Set(value As String)
            'se le da un valor 
            ruta = value
        End Set
    End Property
    '------------------------------------------------
    'property de linea 
    Public Property _line As String
        Get
            'se le devuelve un valor
            Return linea
        End Get
        Set(value As String)
            linea = value
        End Set
    End Property
    '--------------------------------------------------
    Public Property nruta As String
        Get
            'se le devuelve un valor 
            Return _ruta
        End Get
        Set(value As String)
            _ruta = value
        End Set
    End Property
    '-----------------------------------------------------
    'property del tipo de archivo a guardar o a cargar
    Public Property archivo As String

        Get
            'se le devuelve un valor 
            Return tipoArchivo
        End Get
        Set(value As String)
            'se le da un valor 
            tipoArchivo = value
        End Set
    End Property
    '-----------------------------------------------
    'property de tipo dataset
    Public Property data As DataSet
        Get
            'se le devuelve un valor 
            Return Dataset
        End Get
        Set(value As DataSet)
            'se le da un valor 
            Dataset = value
        End Set
    End Property
    '--------------------------------------------------
    'property de tipo xmlreader
    Public Property xmlfile As XmlReader
        Get
            'se le devuelve un valor 
            Return Archivoxml
        End Get
        Set(value As XmlReader)
            'se le da un valor 
            Archivoxml = value
        End Set
    End Property
    '------------------------------------------------------
    'property de tipo xmlwritter
    Public Property xmlwrite As XmlWriter
        Get
            'se le devuelve un valor 
            Return escribir
        End Get
        Set(value As XmlWriter)
            'se le da un valor 
            escribir = value
        End Set
    End Property
    '-----------------------------------------------
    'property de tipo data table 
    Public Property tableData As DataTable
        Get
            'se le devuelve un valor 
            Return tabla
        End Get
        Set(value As DataTable)
            tabla = value
        End Set
    End Property
    '----------------------------------------------------
    'property de tipo data table tabla2
    Public Property table2 As DataTable
        Get
            'se le devuelve un valor 
            Return tabla2
        End Get
        Set(value As DataTable)
            'se le da un valor 
            tabla2 = value
        End Set
    End Property


    Public Property id As Integer
        Get
            'se le devuelve 
            Return cedulanode
        End Get
        Set(value As Integer)
            'se le da un valor 
            cedulanode = value
        End Set
    End Property
#End Region

    'escritura de archivos 



    'lectura de archivos desde el txt
#Region "METODOS "



    Sub leerXMLDueño(ByVal id As Integer, ByVal nombre As String, ByVal apellido As String, ByVal address As String, ByVal telefono As String, ByVal correo As String)

        Dim dcxml As XmlDocument
        dcxml = New XmlDocument



        dcxml.Load("Dueños.xml")


        'nodos donde abren y cierran lo datos 
        nodlist = dcxml.SelectNodes("/tabla/Dueños")



        For Each nodos In nodlist

            id = nodos.ChildNodes(0).InnerText

            nombre = nodos.ChildNodes(1).InnerText
            apellido = nodos.ChildNodes(2).InnerText
            address = nodos.ChildNodes(3).InnerText
            telefono = nodos.ChildNodes(4).InnerText
            correo = nodos.ChildNodes(5).InnerText

            tabla.Rows.Add(id, nombre, apellido, address, telefono, correo)
        Next

    End Sub




    'lectura de la tabla del los clientes 
    Sub estructuraTabla()

        tabla = New DataTable("Dueños.xml")
        'tipo columna 
        Dim column As New DataColumn

        'columna de la cedula 
        column.DataType = System.Type.GetType("System.Int32")
        column.AllowDBNull = False
        'nombre de la columna 
        column.ColumnName = "Id"
        tabla.Columns.Add(column)
        column = New DataColumn

        'columnas de nombre 
        column.DataType = System.Type.GetType("System.String")
        column.AllowDBNull = False
        'nombre de la columna 
        column.ColumnName = "nombre"
        tabla.Columns.Add(column)
        column = New DataColumn

        'columna de apellido
        column.DataType = System.Type.GetType("System.String")
        column.AllowDBNull = False
        'nombre de la columna 
        column.ColumnName = "apellido"
        tabla.Columns.Add(column)
        column = New DataColumn

        'columna de direccion
        column.DataType = System.Type.GetType("System.String")
        column.AllowDBNull = False
        'nombre de la columna 
        column.ColumnName = "direccion"
        tabla.Columns.Add(column)
        column = New DataColumn

        'columna de telefono
        column.DataType = System.Type.GetType("System.Int32")
        column.AllowDBNull = False
        'nombre de la columna 
        column.ColumnName = "telefono"
        tabla.Columns.Add(column)
        column = New DataColumn

        'columna de correo
        column.DataType = System.Type.GetType("System.String")
        column.AllowDBNull = False
        'nombre de la columna 
        column.ColumnName = "correo"
        tabla.Columns.Add(column)

    End Sub



    '----------------------------------------------------------------------
    'escritura de xml
    Sub escrituraDueños(ByVal id As Integer, ByVal nombre As String, ByVal apellido As String, ByVal address As String, ByVal telefono As String, ByVal correo As String)


        Dim doc As XmlDocument = New XmlDocument
        doc.Load("Dueños.xml")
        Dim root As XmlNode = doc.DocumentElement
        Dim element As XmlElement = doc.CreateElement("Dueños")

        'variables para que no se sobrescriba los datos 
        Dim nid As XmlElement
        Dim nNombre As XmlElement
        Dim napellido As XmlElement
        Dim naddress As XmlElement
        Dim ntelefono As XmlElement
        Dim ncorreo As XmlElement


        'creacion del elemento 
        nid = doc.CreateElement("ID")
        nid.InnerText = id
        nNombre = doc.CreateElement("nombre")
        nNombre.InnerText = nombre
        napellido = doc.CreateElement("apellido")
        napellido.InnerText = apellido
        naddress = doc.CreateElement("direccion")
        naddress.InnerText = address
        ntelefono = doc.CreateElement("telefono")
        ntelefono.InnerText = telefono
        ncorreo = doc.CreateElement("correo")
        ncorreo.InnerText = correo


        root.AppendChild(element)
        element.AppendChild(nid)
        element.AppendChild(nNombre)
        element.AppendChild(napellido)
        element.AppendChild(naddress)
        element.AppendChild(ntelefono)
        element.AppendChild(ncorreo)
        doc.Save("Dueños.xml")


    End Sub

    Sub eliminarDatoCliente()
        'validacion en caso de error
        'Try
        'carga el documento


        documentxml.Load("Dueños.xml")
        nodlist = documentxml.SelectNodes("/tabla/Dueños")


        'nodo es igual al xmldocument. elemento de documento 
        nodoDueño = documentxml.DocumentElement

        MsgBox(id.ToString)
        'por cada item de xmlnode en nodolista 
        For Each item As XmlNode In nodlist

            'si selecciona el id entonces 
            If item.SelectSingleNode("ID").InnerText = id Then

                'node de cedula igual al item escogido 
                nodoID = item


                'se vorra el nodo de nodo de cedila 
                nodoDueño.RemoveChild(nodoID)
            End If
            documentxml.Save("Dueños.xml")
        Next
        'Catch ex As Exception
        '    MsgBox("error no se elimino losa datos ")
        'End Try
    End Sub
#End Region
    '*********************************************************************************
#Region "metodos de las mascotas "


    Sub estructuratabla2()
        'tabla de las mascotas 
        tabla2 = New DataTable("Mascotas.xml")

        Dim column As New DataColumn

        'columnade cedula del dueño
        column.DataType = System.Type.GetType("System.Int32")
        column.AllowDBNull = False
        column.ColumnName = "Id"
        tabla2.Columns.Add(column)
        column = New DataColumn

        'noombre de mascota 
        column.DataType = System.Type.GetType("System.String")
        column.AllowDBNull = False
        column.ColumnName = "nommbre De Mascota"
        tabla2.Columns.Add(column)
        column = New DataColumn

        'ripo de mascota 
        column.DataType = System.Type.GetType("System.String")
        column.AllowDBNull = False
        column.ColumnName = "Tipo Mascota"
        tabla2.Columns.Add(column)
        column = New DataColumn

        'raza de la mascota 
        column.DataType = System.Type.GetType("System.String")
        column.AllowDBNull = False
        column.ColumnName = "Raza"
        tabla2.Columns.Add(column)
        column = New DataColumn

        ''peso de la mascota 
        column.DataType = System.Type.GetType("System.Int32")
        column.AllowDBNull = False
        column.ColumnName = "peso"
        tabla2.Columns.Add(column)
        column = New DataColumn

        ''fecha de nacimiento de la mascota
        column.DataType = System.Type.GetType("System.String")
        column.AllowDBNull = False
        column.ColumnName = "fecha de nacimiento"
        tabla2.Columns.Add(column)
        column = New DataColumn

        'salud de la mascota
        column.DataType = System.Type.GetType("System.String")
        column.AllowDBNull = False
        column.ColumnName = "salud"
        tabla2.Columns.Add(column)
    End Sub


#Region "lectura de tablas "
    'lectura de las tablas 1 y2
    Sub New()
        estructuraTabla()
        estructuratabla2()

    End Sub
#End Region

    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'metodo de escritura de datos en formato xml 
    Sub EscrituraMascotas(ByVal id As Integer, ByVal nombremascota As String, ByVal tipo As String, ByVal raza As String, ByVal peso As Integer, ByVal nacimiento As String, ByVal salud As String)

        'de tipo xmldocumento
        Dim doc2 As XmlDocument = New XmlDocument
        doc2.Load("Mascotas.xml")
        Dim root As XmlNode = doc2.DocumentElement
        Dim element As XmlElement = doc2.CreateElement("mascota")

        'variables para que no se sobrescriba los datos 
        Dim nid As XmlElement
        Dim nNombreMascota As XmlElement
        Dim ntipo As XmlElement
        Dim nraza As XmlElement
        Dim npeso As XmlElement
        Dim nNacimiento As XmlElement
        Dim nsalud As XmlElement


        'creacion del elemento de cedula
        nid = doc2.CreateElement("Id")
        nid.InnerText = id

        'crea el elemento de nombre de la mascota
        nNombreMascota = doc2.CreateElement("nombre_Mascota")
        nNombreMascota.InnerText = nombremascota

        'crea el elemento de tipo de mascota 
        ntipo = doc2.CreateElement("tipo_Mascota")
        ntipo.InnerText = tipo

        'crea el elemento de tipo de mascota 
        nraza = doc2.CreateElement("raza")
        nraza.InnerText = raza

        'crea el elemento de tipo de mascota
        npeso = doc2.CreateElement("peso")
        npeso.InnerText = peso

        nNacimiento = doc2.CreateElement("Fecha_De_Nacimiento")
        nNacimiento.InnerText = nacimiento


        nsalud = doc2.CreateElement("Salud")
        nsalud.InnerText = salud

        root.AppendChild(element)
        element.AppendChild(nid)
        element.AppendChild(nNombreMascota)
        element.AppendChild(ntipo)
        element.AppendChild(nraza)
        element.AppendChild(npeso)
        element.AppendChild(nNacimiento)
        element.AppendChild(nsalud)
        doc2.Save("Mascotas.xml")

    End Sub


    Sub leerXMLMascotas(ByVal id As Integer, ByVal nombremascota As String, ByVal tipo As String, ByVal raza As String, ByVal peso As Integer, ByVal nacimiento As String, ByVal salud As String)
        Dim dcxml As XmlDocument
        dcxml = New XmlDocument

        'carga el archivo de xml
        dcxml.Load("Mascotas.xml")


        'nodos donde abren y cierran lo datos 
        nodlist = dcxml.SelectNodes("/tabla/mascota")


        'por cada nodo de tipo xmlnno en nodelista
        For Each nodos2 In nodlist

            'nodo de cedula
            id = nodos2.ChildNodes(0).InnerText
            'nodo de nombre dde mascota 
            nombremascota = nodos2.ChildNodes(1).InnerText
            'nmbre de tipo de mascota
            tipo = nodos2.ChildNodes(2).InnerText
            'nodo de raza
            raza = nodos2.ChildNodes(3).InnerText
            'nodo de peso
            peso = nodos2.ChildNodes(4).InnerText
            'nodo de gecha de nacimiento
            nacimiento = nodos2.ChildNodes(5).InnerText
            'nodo de salud
            salud = nodos2.ChildNodes(6).InnerText

            'se agrega en la tabla 
            tabla2.Rows.Add(id, nombremascota, tipo, raza, peso, nacimiento, salud)
        Next

    End Sub
#End Region
End Class
