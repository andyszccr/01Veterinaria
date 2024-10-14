Imports System.Runtime.CompilerServices.RuntimeHelpers
Imports Entidades
Imports Negocios


Public Class FrmRoles


    Dim vlRole As RolesE = New RolesE()
    Dim vlGenerales As Generales = New Generales()
    Dim GeneralesN As GeneralesN = New GeneralesN()
    Dim RoleN As RolesN = New RolesN()

    Private Sub FrmRoles_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        gvRoles.DataSource = RoleN.VistaRoles()
    End Sub

    Private Sub btnCerrar_Click(sender As Object, e As EventArgs) Handles btnCerrar.Click
        Me.Close()
    End Sub

    Private Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click
        Limpiar()
    End Sub

    Private Sub BtnAdd_Click(sender As Object, e As EventArgs) Handles BtnAdd.Click
        If (String.IsNullOrEmpty(txtRol.Text)) Then
            MessageBox.Show("Campos sin completar, por favor llenar los datos", "Campos vacios", MessageBoxButtons.OK, MessageBoxIcon.Information)

        ElseIf (txtCodigo.Text = "") Then
            'Pregunta si desea el siguiente dato. 
            If MessageBox.Show("¿Deseas registrar a " & txtRol.Text & "?", "Mensaje", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = System.Windows.Forms.DialogResult.Yes Then

                'metodo para realizar con el 1 el insert en sql
                mantenimiento("1")
                Limpiar()
            End If
        End If
    End Sub

    Private Sub btnModificar_Click(sender As Object, e As EventArgs) Handles btnModificar.Click
        If (txtCodigo.Text <> "") Then
            'Pregunta si desea el siguiente dato. 
            If MessageBox.Show("¿Deseas modificar " & txtRol.Text & "?", "Mensaje", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = System.Windows.Forms.DialogResult.Yes Then

                mantenimiento("2")
                Limpiar()
            End If
        End If
    End Sub

    Private Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        If (txtCodigo.Text <> "") Then
            'Pregunta si desea el siguiente dato. 
            If MessageBox.Show("¿Deseas Eliminar " & txtRol.Text & "?", "Mensaje", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = System.Windows.Forms.DialogResult.Yes Then

                mantenimiento("3")
                Limpiar()
            End If
        End If
    End Sub

    Private Sub btnExport_Click(sender As Object, e As EventArgs) Handles btnExport.Click

    End Sub

    Private Sub rbActivo_CheckedChanged(sender As Object, e As EventArgs) Handles rbActivo.CheckedChanged
        Estados()
    End Sub

    Private Sub rbInactivo_CheckedChanged(sender As Object, e As EventArgs) Handles rbInactivo.CheckedChanged
        Estados()
    End Sub


#Region "Metodos Generales"
    Private Sub Limpiar()
        txtCodigo.Text = ""
        txtRol.Text = ""
        gvRoles.DataSource = RoleN.VistaRoles()
    End Sub


    Private Sub mantenimiento(ByVal accion As String)
        vlRole._RoleCode = txtCodigo.Text
        vlRole._RoleName = txtRol.Text
        vlGenerales._accion = accion
        GeneralesN.FechasGenerales(accion)
        vlRole._RoleCreate = vlGenerales._FechaCreate
        vlRole._RoleUpdate = vlGenerales._FechaUpate
        vlRole._RoleDelete = vlGenerales._FechaDelete
        vlGenerales._msj = RoleN.mantenimientoRazas(vlRole, vlGenerales._accion)
        MessageBox.Show(vlGenerales._msj, "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub

    'Metodo general para activar y desactivar
    Private Sub Estados()
        If rbActivo.Checked Then
            rbInactivo.Checked = False
            vlRole._RoleStatus = rbActivo.Checked
        ElseIf rbInactivo.Checked Then
            rbActivo.Checked = False
            vlRole._RoleStatus = rbInactivo.Checked
        End If
    End Sub


#End Region
End Class