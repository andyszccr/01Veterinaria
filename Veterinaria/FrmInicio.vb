Imports System.Runtime.InteropServices
Public Class FrmInicio
    <DllImport("user32.DLL", EntryPoint:="ReleaseCapture")>
    Private Shared Sub ReleaseCapture()
    End Sub

    <DllImport("user32.DLL", EntryPoint:="SendMessage")>
    Private Shared Sub SendMessage(ByVal hWnd As System.IntPtr, ByVal wMsg As Integer, ByVal wParam As Integer, ByVal lParam As Integer)
    End Sub
    '*****************************************************************************
#Region "Variables"
    Dim lx, ly As Integer
    Dim sw, sh As Integer
#End Region
    '*****************************************************************************
#Region "Opciones del navbar"
    'Metodo para cerrar el sitio
    Private Sub btnCerrar_Click_1(sender As Object, e As EventArgs) Handles btnCerrar.Click
        Application.Exit()
    End Sub

    'Metodo para maximizar el la ventana.
    'Private Sub btnRestaurar_Click(sender As Object, e As EventArgs)
    '    'btnMaximizar.Visible = False
    '    btnRestaurar.Visible = True
    '    Me.WindowState = FormWindowState.Maximized
    'End Sub

    ''Metodo para minimizar la ventana
    'Private Sub btnMinimizar_Click(sender As Object, e As EventArgs)
    '    Me.WindowState = FormWindowState.Minimized
    'End Sub


#End Region
    '*****************************************************************************
#Region "Metodos de los submenu"
    Private Sub tmMOSTRAR_Tick(sender As Object, e As EventArgs) Handles tmMOSTRAR.Tick
        If PanelMenu.Width >= 220 Then
            Me.tmMOSTRAR.Enabled = False
        Else
            Me.PanelMenu.Width = PanelMenu.Width + 5
        End If
    End Sub

    Private Sub panelBarraTitulo_MouseMove(sender As Object, e As MouseEventArgs)
        ReleaseCapture()
        SendMessage(Me.Handle, &H112&, &HF012&, 0)
    End Sub

    Private Sub btnDashBoard_Click_1(sender As Object, e As EventArgs) Handles btnDashBoard.Click
        AbrirFormEnPanel(Of frmRazas)()
    End Sub
    '*****************************************************************************
    'Boton de informacion
    Private Sub btnInfo_Click(sender As Object, e As EventArgs) Handles btnInfo.Click
        AbrirFormEnPanel(Of frmInfo)()
    End Sub
#End Region
    '*****************************************************************************
#Region "Metodos Generales"
    'Metodo para abrir los paneles con codigo limpio.
    Private Sub AbrirFormEnPanel(Of Miform As {Form, New})()
        Dim Formulario As Form
        Formulario = PanelFormularios.Controls.OfType(Of Miform)().FirstOrDefault() 'Busca el formulario en la coleccion
        'Si form no fue econtrado/ no existe
        If Formulario Is Nothing Then
            Formulario = New Miform()
            Formulario.TopLevel = False

            Formulario.FormBorderStyle = FormBorderStyle.None
            Formulario.Dock = DockStyle.Fill

            PanelFormularios.Controls.Add(Formulario)
            PanelFormularios.Tag = Formulario
            AddHandler Formulario.FormClosed, AddressOf Me.CerrarFormulario
            Formulario.Show()
            Formulario.BringToFront()
        Else
            Formulario.BringToFront()
        End If

    End Sub

    'METODO/EVENTO AL CERRAR FORMS
    Private Sub CerrarFormulario(ByVal sender As Object, ByVal e As FormClosedEventArgs)
        'CONDICION SI FORMS ESTA ABIERTO
        If (Application.OpenForms("Form1") Is Nothing) Then
            Button1.BackColor = Color.FromArgb(4, 41, 68)
        End If
        If (Application.OpenForms("Form2") Is Nothing) Then
            Button2.BackColor = Color.FromArgb(4, 41, 68)
        End If
        If (Application.OpenForms("Form3") Is Nothing) Then
            Button3.BackColor = Color.FromArgb(4, 41, 68)
        End If
    End Sub

    Private Sub btnMenu_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub btnMenu_Click_2(sender As Object, e As EventArgs) Handles btnMenu.Click
        If PanelMenu.Width = 220 Then
            tmOCULTAR.Enabled = True
        ElseIf PanelMenu.Width = 60 Then
            tmMOSTRAR.Enabled = True
        End If
    End Sub

    Private Sub PanelContenedor_Paint(sender As Object, e As PaintEventArgs) Handles PanelContenedor.Paint

    End Sub

    Private Sub tmOCULTAR_Tick(sender As Object, e As EventArgs) Handles tmOCULTAR.Tick
        If PanelMenu.Width <= 60 Then
            Me.tmOCULTAR.Enabled = False
        Else
            Me.PanelMenu.Width = PanelMenu.Width - 5
        End If
    End Sub

    Private Sub btnMenu_Click_1(sender As Object, e As EventArgs)
        If PanelMenu.Width = 220 Then
            tmOCULTAR.Enabled = True
        ElseIf PanelMenu.Width = 60 Then
            tmMOSTRAR.Enabled = True
        End If
    End Sub
#End Region
End Class