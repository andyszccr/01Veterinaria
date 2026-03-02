Imports Entidades

Public Class frmInfo
#Region "Variables"
    Dim vgGeneral As New Generales
#End Region

#Region "Metodos"
    Private Sub btnCerrar_Click(sender As Object, e As EventArgs) Handles btnCerrar.Click
        Me.Close()
    End Sub

    Private Sub frmInfo_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        vgGeneral._nombre = "Andrey Sanchez Zuñiga"
        vgGeneral._version = "Version 1.2"
        vgGeneral._email = "andreyszcr@gmail.com"

        txtDesarrollador.Text = vgGeneral._nombre
        txtVersion.Text = vgGeneral._version
        TxtEmail.Text = vgGeneral._email
    End Sub
#End Region
End Class