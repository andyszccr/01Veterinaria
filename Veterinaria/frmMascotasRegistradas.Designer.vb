<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmMascotasRegistradas
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Requerido por el Diseñador de Windows Forms
    Private components As System.ComponentModel.IContainer

    'NOTA: el Diseñador de Windows Forms necesita el siguiente procedimiento
    'Se puede modificar usando el Diseñador de Windows Forms.  
    'No lo modifique con el editor de código.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.dgvmascotas = New System.Windows.Forms.DataGridView()
        Me.mnsMenu = New System.Windows.Forms.MenuStrip()
        Me.VolverAlMenuPrincipalToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AbrirArchivoToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ofdabrir = New System.Windows.Forms.OpenFileDialog()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.gbDelete = New System.Windows.Forms.GroupBox()
        Me.lblborrar = New System.Windows.Forms.Label()
        Me.txtcedula = New System.Windows.Forms.TextBox()
        Me.btndelete = New System.Windows.Forms.Button()
        CType(Me.dgvmascotas, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.mnsMenu.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gbDelete.SuspendLayout()
        Me.SuspendLayout()
        '
        'dgvmascotas
        '
        Me.dgvmascotas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgvmascotas.Location = New System.Drawing.Point(51, 274)
        Me.dgvmascotas.Name = "dgvmascotas"
        Me.dgvmascotas.RowHeadersWidth = 51
        Me.dgvmascotas.RowTemplate.Height = 24
        Me.dgvmascotas.Size = New System.Drawing.Size(684, 150)
        Me.dgvmascotas.TabIndex = 0
        '
        'mnsMenu
        '
        Me.mnsMenu.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.mnsMenu.ImageScalingSize = New System.Drawing.Size(20, 20)
        Me.mnsMenu.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.VolverAlMenuPrincipalToolStripMenuItem, Me.AbrirArchivoToolStripMenuItem})
        Me.mnsMenu.Location = New System.Drawing.Point(0, 0)
        Me.mnsMenu.Name = "mnsMenu"
        Me.mnsMenu.Size = New System.Drawing.Size(800, 28)
        Me.mnsMenu.TabIndex = 1
        Me.mnsMenu.Text = "MenuStrip1"
        '
        'VolverAlMenuPrincipalToolStripMenuItem
        '
        Me.VolverAlMenuPrincipalToolStripMenuItem.Name = "VolverAlMenuPrincipalToolStripMenuItem"
        Me.VolverAlMenuPrincipalToolStripMenuItem.Size = New System.Drawing.Size(182, 24)
        Me.VolverAlMenuPrincipalToolStripMenuItem.Text = "Volver al menu Principal"
        '
        'AbrirArchivoToolStripMenuItem
        '
        Me.AbrirArchivoToolStripMenuItem.Name = "AbrirArchivoToolStripMenuItem"
        Me.AbrirArchivoToolStripMenuItem.Size = New System.Drawing.Size(110, 24)
        Me.AbrirArchivoToolStripMenuItem.Text = "Abrir Archivo"
        '
        'ofdabrir
        '
        Me.ofdabrir.FileName = "OpenFileDialog1"
        '
        'PictureBox1
        '
        Me.PictureBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PictureBox1.Image = Global.Veterinaria.My.Resources.Resources.imagen2
        Me.PictureBox1.Location = New System.Drawing.Point(0, 0)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(800, 450)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 2
        Me.PictureBox1.TabStop = False
        '
        'gbDelete
        '
        Me.gbDelete.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.gbDelete.Controls.Add(Me.lblborrar)
        Me.gbDelete.Controls.Add(Me.txtcedula)
        Me.gbDelete.Controls.Add(Me.btndelete)
        Me.gbDelete.Location = New System.Drawing.Point(51, 222)
        Me.gbDelete.Name = "gbDelete"
        Me.gbDelete.Size = New System.Drawing.Size(471, 46)
        Me.gbDelete.TabIndex = 12
        Me.gbDelete.TabStop = False
        Me.gbDelete.Text = "borrar fila"
        '
        'lblborrar
        '
        Me.lblborrar.AutoSize = True
        Me.lblborrar.Location = New System.Drawing.Point(23, 24)
        Me.lblborrar.Name = "lblborrar"
        Me.lblborrar.Size = New System.Drawing.Size(50, 17)
        Me.lblborrar.TabIndex = 11
        Me.lblborrar.Text = "cedula"
        '
        'txtcedula
        '
        Me.txtcedula.Location = New System.Drawing.Point(97, 21)
        Me.txtcedula.Name = "txtcedula"
        Me.txtcedula.Size = New System.Drawing.Size(138, 22)
        Me.txtcedula.TabIndex = 10
        '
        'btndelete
        '
        Me.btndelete.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.btndelete.Location = New System.Drawing.Point(251, 11)
        Me.btndelete.Name = "btndelete"
        Me.btndelete.Size = New System.Drawing.Size(159, 33)
        Me.btndelete.TabIndex = 8
        Me.btndelete.Text = "Eliminar Registro"
        Me.btndelete.UseVisualStyleBackColor = False
        '
        'frmMascotasRegistradas
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(800, 450)
        Me.ControlBox = False
        Me.Controls.Add(Me.gbDelete)
        Me.Controls.Add(Me.dgvmascotas)
        Me.Controls.Add(Me.mnsMenu)
        Me.Controls.Add(Me.PictureBox1)
        Me.MainMenuStrip = Me.mnsMenu
        Me.Name = "frmMascotasRegistradas"
        Me.Text = "frmMascotasRegistradas"
        CType(Me.dgvmascotas, System.ComponentModel.ISupportInitialize).EndInit()
        Me.mnsMenu.ResumeLayout(False)
        Me.mnsMenu.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gbDelete.ResumeLayout(False)
        Me.gbDelete.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents dgvmascotas As DataGridView
    Friend WithEvents mnsMenu As MenuStrip
    Friend WithEvents VolverAlMenuPrincipalToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents AbrirArchivoToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ofdabrir As OpenFileDialog
    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents gbDelete As GroupBox
    Friend WithEvents lblborrar As Label
    Friend WithEvents txtcedula As TextBox
    Friend WithEvents btndelete As Button
End Class
