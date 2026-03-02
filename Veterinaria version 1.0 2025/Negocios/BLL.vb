'se importa la libreria de tipo biblioteca de clases llamado Datos 
Imports Datos
Imports System.IO
Imports System.Xml

Public Class BLL
    'variable de tipo clase archivo 
    Dim archivo As New XMLdato

#Region "variables del cliente"
    'cedula del cliente 
    Dim cedula As Integer
    '-------------------------
    'nombre del cliente
    Dim nombre As String
    '--------------------------
    'apellidos del cliente
    Dim apellido As String
    '--------------------------
    'direccion de la persona 
    Dim address As String
    '--------------------------------
    'numero de telefono de la persona 
    Dim celular As Integer
    'correo electronico del cliente 
    Dim correoElectronico As String
    '---------------------------
    'cantidad de mascotas que posee 
    Dim cantidad As Integer
#End Region
    '-----------------------------------------------------
#Region "variables de animales"
    'nombre de la mascota 
    Dim nombreMascota As String
    '-------------------------------
    'tipo de mascota 
    Dim tipoMascota As String
    '------------------------------
    'raza de la mascota
    Dim raza As String
    '----------------------------
    'peso de la mascota 
    Dim peso As Double
    '-----------------------------
    'fecha de nacimiento de la mascota 
    Dim nacimiento As String
    '-----------------------------
    'salud que lleva la mascota 
    Dim salud As String

#End Region
    '-----------------------------------------------------------
#Region "Properties de los datos del cliente "
    'property de cedula del cliente 
    '----------------------------------------
    Public Property ID As Integer
        ' se le da salida en el programa 
        Get
            'se le devuelve un valor 
            Return cedula
        End Get
        Set(value As Integer)
            'se le de valor en el sistema 
            cedula = value
        End Set
    End Property
    '---------------------------------------
    '-----
    'property del nombre del cliente 
    Public Property name As String
        'se le da salida en el programa
        Get
            'se le devuelve un valor 
            Return nombre
        End Get
        Set(value As String)
            'se le da un valor en el sistema 
            nombre = value
        End Set
    End Property
    '---------------------------------------
    '--------
    'property del primer apellido del cliente 
    Public Property lastname As String
        ' se le sa salida en el programa
        Get
            'se le devuelve un valor 
            Return apellido
        End Get
        Set(value As String)
            'se le de valor en el sistema 
            apellido = value
        End Set
    End Property

    '--------------------------------------
    '-----
    'property de la direccion del cliente 
    Public Property claddress As String
        'se le da salida en el programa 
        Get
            'se le devuelve un valor 
            Return address
        End Get
        Set(value As String)
            'se le da un valor 
            address = value
        End Set
    End Property
    '------------------------------------------
    '--------
    'property del trlrfono del cliente 
    Public Property cellphone As Integer
        Get
            'se le devuelve un valor 
            Return celular
        End Get
        Set(value As Integer)
            'se le da un valor 
            celular = value
        End Set
    End Property
    '-----------------------------------------------
    'property de la cantidad de mascotas 
    Public Property count As Integer
        Get
            'se le devuelve un valor
            Return cantidad
        End Get
        Set(value As Integer)
            'se le da un valor en el sistema 
            cantidad = value
        End Set
    End Property

    'property del correo elctronico 
    Public Property email As String
        Get
            'se le devuelve un valor 
            Return correoElectronico
        End Get
        Set(value As String)
            'se le da un valor
            correoElectronico = value
        End Set
    End Property
#End Region
    '-----------------------------------------------------------
#Region "properties de los datos de la mascota"
    'property del nombre de la mascota 
    Public Property namemascota As String
        'se le da salida al programa
        Get
            'se le devuelve un valor 
            Return nombreMascota
        End Get
        Set(value As String)
            nombreMascota = value
        End Set
    End Property
    '---------------------------------------------------------
    '-------------
    'property del tipo de mascota 
    Public Property typemascota As String
        'se le devuelve un valor 
        Get
            'se le devuelve un valor 
            Return tipoMascota
        End Get
        Set(value As String)
            'se le da un valor 
            tipoMascota = value
        End Set
    End Property
    '----------------------------------------------------
    '-----------------------------
    'property  de raza 
    Public Property petraza As String
        'se le da una salida en el sistema
        Get
            'se le devuelve un valor
            Return raza
        End Get
        Set(value As String)
            'se le da un valor 
            raza = value
        End Set
    End Property
    '------------------------------
    '-------
    'property del peso de la mascota
    Public Property heightpeso As Double
        'se le da salida en el sistema 
        Get
            'se le devuelve un valor
            Return peso
        End Get
        Set(value As Double)
            'se le da un valor 
            peso = value
        End Set
    End Property
    '-----------------------------
    'property  de salud de la mascota 
    Public Property healthyPet As String
        'se le da una salida en el sistema
        Get
            'se le devuelve un valor
            Return salud
        End Get
        Set(value As String)
            'se le da un valor 
            salud = value
        End Set
    End Property
    '----------------------------------
    '-------
    'property de la fecha de nacimiento de la mascota
    Public Property birthPet As String
        Get
            'se le devuelve un valor
            Return nacimiento
        End Get
        Set(value As String)
            'se le da un valor 
            nacimiento = value
        End Set
    End Property
#End Region


    '************************************************************************************
#Region "Validacion de los datos del cliente"
    Sub validacionCedula()
        'condicion de la longitud de la cedula 
        If Not (cedula > 100000000 And cedula < 1000000000) Then
            MsgBox("Supera el rango establecido,los datos de la cedula del cliente no puede tener caracteres, vuelva a digitarlo ")
        End If

    End Sub
    '----------------------------------------------------------------------------------------
    'validacion de nombre 
    Sub validacionNombre()

        'condicion de la longitud del nombre 
        If nombre.Length > 150 Then
            MsgBox("Supera  el rango establecido de nombre")
        End If


        'validacion si es numerico o el tamaño es igual a 0 
        If IsNumeric(nombre) Or nombre.Length = 0 Or nombre.Trim.Length = 0 Then
            MsgBox("el nombre no es valido, vuelve a digitarlo")
        End If
    End Sub
    '---------------------------------------------------------------------------------
    Sub validacionapellido1()

        'validacion de la longitud del primer  apellido 
        If apellido.Length > 150 Then
            MsgBox("supera el rango establecido de primer apellido")
        End If


        'validacion si es numerico o el tamaño es igual a 0
        If IsNumeric(apellido) Or apellido.Length = 0 Or apellido.Trim.Length = 0 Then
            MsgBox("los datos del apellido no es valido, vuelva a digitarlo")
        End If
    End Sub
    '-----------------------------------------------------------------------------------------

    ''----------------------------------------------------------------------------------------
    Sub validaciontelefono()
        'validacion de la longitud del relefono
        'condicion de la longitud de la cedula 
        If (celular > 1000000000 And celular < 10000000000) Then
            MsgBox("Supera el rango establecido,los datos el celular del cliente no puede tener caracteres, vuelva a digitarlo ")
        End If
    End Sub
    ''------------------------------------------------------------------------------------
    Sub validacionAddress()
        If address.Trim.Length = 0 Then
            MsgBox("Datos vacios, digite de nuevo la direccion del cliente")
        End If
    End Sub
    ''------------------------------------------------------------------------------------
    Sub validacionEmail()
        'validacion de la loigntud del correo electronico 
        If correoElectronico.Length > 150 Then
            MsgBox("supera el limite establecido del correo electronico")
        End If

        'si no tiene un arroba en el email
        If Not correoElectronico.Contains("@") Or String.IsNullOrEmpty(correoElectronico.Trim.Length) Then
            MsgBox("no es un correo electronico, no contiene un @ en los datos, vuelva a digitarlo")
        End If
    End Sub
#End Region
    '************************************************************************************
#Region "Validacion de los datos de las mascotas "
    'validacion del nombre de la mascota 
    Sub validacionNombreMascota()

        'la longitud del nombre de la mascota 
        If nombreMascota.Length > 150 Then
            MsgBox("sobrepasa el rango del nombre de la mascota ")
        End If


        'si el nombre de la mascota de mascota es numerico o esta vacio 
        If IsNumeric(nombreMascota) Or nombreMascota.Length = 0 Or nombreMascota.Trim.Length = 0 Then
            MsgBox("no puede ser numerico o estar vacio el nombre de la mascota ")
        End If
    End Sub
    '---------------------------------------------------------------------------
    Sub validaciontipoMascota()
        If tipoMascota.Length > 150 Then
            Throw New Exception("sobrepasa el rango del tipo de mascota ")
        End If

        'si la el tipo de numerico de la mascota es numerico o esta vacio 
        If IsNumeric(tipoMascota) Or tipoMascota.Length = 0 Or tipoMascota.Trim.Length = 0 Then
            MsgBox("no puede ser numerico o estar vacio la raza, vuelva a digitarlo")
        End If

    End Sub
    '--------------------------------------------------------------------------
    'validacion de la raza de la mascota
    Sub validacionRaza()
        'longitud  de la raza de la mascota 
        If raza.Length > 15 Then
            MsgBox("sobrepasa el rango de la raza de la mascota ")
        End If

        'si la raza es numerico de la mascota es numerico o esta vacio 
        If IsNumeric(raza) Or raza.Length = 0 Or raza.Trim.Length = 0 Then
            MsgBox("no puede ser numerico o estar vacio la raza, vuelva a digitarlo")
        End If
    End Sub
    '--------------------------------------------------------------------------
    'validacion del peso de la mascota 
    Sub validacionPesoMascota()

        'condicion de la longitud del peso de la mascota 
        If (peso > 10000 And peso < 100000) Then
            MsgBox(" sobrepasa el rango del peso de la mascota")
        End If


    End Sub

    '-------------------------------------------------------------------------------------------------------------
    Sub validacionSalud()

        'condicion de la salud de la mascota 
        If salud.Length > 15 Then
            MsgBox("sobrepasa el rango de la salud de la mascota")
        End If


        'condicion si es numerico o esta vacio 
        If IsNumeric(salud) Or salud.Length = 0 Or salud.Trim.Length = 0 Then
            MsgBox("no puede estar vacio o tener numeros, vuelva a digitar la salud de la mascota")
        End If
    End Sub
    '------------------------------------------------------------------------------
    Sub validacionFechaNacimiento()



        'si la fecha de naimiento esta vacia entonces 
        If nacimiento.ToString.Length > 10 Then
            MsgBox("la fecha de nacimiento esta vacia, vuelva a digitar la fecha de nacimiento")
        End If
    End Sub
#End Region
    '*************************************************************************************

#Region "conexion para guardar archivo "
    Public Property ruta As String
        Get
            Return archivo.nruta
        End Get
        Set(value As String)
            archivo.nruta = value
        End Set
    End Property
    '-------------------------------------------------

    Public Property formato As String
        Get
            'se le devuelve un valor 
            Return archivo.archivo
        End Get
        Set(value As String)
            'se le da un valor desde la capa datos 
            archivo.archivo = value
        End Set
    End Property
#End Region



#Region "lectura del xml"
    'property de tipo dataset 
    Public Property DataSet As DataSet
        Get
            'retorn aun valor 
            Return archivo.data
        End Get
        Set(value As DataSet)
            'se le da un valor 
            archivo.data = value
        End Set
    End Property
    '----------------------------------
    'property de lectura de xml
    Public Property xmlreader As XmlReader
        Get
            'se le devuelve un valor 
            Return archivo.xmlfile
        End Get
        Set(value As XmlReader)
            'se le da un valor 
            archivo.xmlfile = value
        End Set
    End Property
    '--------------------------------------
    'property de tipo xmlwritter
    Public Property xmlwritter As XmlWriter
        Get
            'se le devuelve un valor 
            Return archivo.xmlwrite
        End Get
        Set(value As XmlWriter)
            'se le da un valor 
            archivo.xmlwrite = value
        End Set
    End Property
    '------------------------------------------------------
    Public Property datatable As DataTable
        Get
            'se le devuelve un valor
            Return archivo.tableData
        End Get
        Set(value As DataTable)
            'se le da un valor 
            archivo.tableData = value
        End Set
    End Property
    '------------------------------------------------------------------------
    'property de tipo datatable 2
    Public Property datatable2 As DataTable
        Get
            'se le devuelve un valor 
            Return archivo.table2
        End Get
        Set(value As DataTable)
            'se le da un valor 
            archivo.table2 = value
        End Set
    End Property


    Public Property idnodo As Integer
        Get
            'se le devuelve un valor
            Return archivo.id
        End Get
        Set(value As Integer)
            archivo.id = value
        End Set

    End Property







#Region "metodos de xml"
    Sub tablas()
        'metodo para leer tablas 
        archivo.leerXMLDueño(cedula, nombre, apellido, claddress, celular, correoElectronico)
    End Sub
    '*************************************************************************************************
    Sub escribirDueñosXML()
        archivo.escrituraDueños(cedula, nombre, apellido, claddress, celular, correoElectronico)
    End Sub


    Sub escribirMascotasXML()
        archivo.EscrituraMascotas(cedula, nombreMascota, tipoMascota, raza, peso, nacimiento, salud)
    End Sub

    Sub tablas2()
        archivo.leerXMLMascotas(cedula, nombreMascota, tipoMascota, raza, peso, nacimiento, salud)

    End Sub



    Sub eliminarXmlDueños()
        MsgBox(idnodo.ToString)
        archivo.eliminarDatoCliente()

    End Sub




#End Region

#End Region
End Class
