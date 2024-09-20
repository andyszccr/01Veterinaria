Imports System.Windows.Forms.VisualStyles.VisualStyleElement.Button
Imports Entidades
Imports Negocios
Public Class frmRazas
    Dim vlRaza As New RaceE
    Dim vlGenerales As New Generales
    Dim GeneralesN As New GeneralesN
    Dim RazaN As RaceN

#Region "Metodos del sistema"
    Private Sub btnCerrar_Click(sender As Object, e As EventArgs) Handles btnCerrar.Click
        Me.Close()
    End Sub

    Private Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click
        Limpiar()
    End Sub

    Private Sub rbActivo_CheckedChanged(sender As Object, e As EventArgs) Handles rbActivo.CheckedChanged
        Estados()
    End Sub

    Private Sub rbInactivo_CheckedChanged(sender As Object, e As EventArgs) Handles rbInactivo.CheckedChanged
        Estados()
    End Sub

    Private Sub BtnAdd_Click(sender As Object, e As EventArgs) Handles BtnAdd.Click

        If (String.IsNullOrEmpty(txtRaza.Text)) Then
            MessageBox.Show("Campos sin completar, por favor llenar los datos", "Campos vacios", MessageBoxButtons.OK, MessageBoxIcon.Information)

        ElseIf (txtCodigo.Text <> "") Then
            'Pregunta si desea el siguiente dato. 
            If MessageBox.Show("¿Deseas registrar a " & txtRaza.Text & "?", "Mensaje", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = System.Windows.Forms.DialogResult.Yes Then

                'metodo para realizar con el 1 el insert en sql
                mantenimiento("1")
            End If
        End If
    End Sub
#End Region

#Region "Metodos Generales"
    Private Sub Limpiar()
        txtCodigo.Text = ""
        txtRaza.Text = ""
        'gvRazas.da
    End Sub


    Private Sub mantenimiento(ByVal accion As String)
        vlRaza._RaceCode = txtCodigo.Text
        vlRaza._RaceName = txtRaza.Text
        vlGenerales._accion = accion
        GeneralesN.FechasGenerales(accion)
        vlRaza._RaceCreate = vlGenerales._FechaCreate
        vlRaza._RaceUpdate = vlGenerales._FechaUpate
        vlRaza._RaceDelete = vlGenerales._FechaDelete
        vlGenerales._msj = RazaN.mantenimientoRazas(vlRaza, vlGenerales._accion)
        MessageBox.Show(vlGenerales._msj, "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub

    'Metodo general para activar y desactivar
    Private Sub Estados()
        If rbActivo.Checked Then
            rbInactivo.Checked = False
            vlRaza._RaceStatus = rbActivo.Checked
        ElseIf rbInactivo.Checked Then
            rbActivo.Checked = False
            vlRaza._RaceStatus = rbInactivo.Checked
        End If
    End Sub
#End Region

End Class