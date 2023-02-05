<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class frmClientesRegistrados
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()>
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
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmClientesRegistrados))
        Me.mnsmenu = New System.Windows.Forms.MenuStrip()
        Me.Menutmns = New System.Windows.Forms.ToolStripMenuItem()
        Me.DueñosToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.dgvClienteRegistrado = New System.Windows.Forms.DataGridView()
        Me.lblruta = New System.Windows.Forms.Label()
        Me.txtruta = New System.Windows.Forms.TextBox()
        Me.btndelete = New System.Windows.Forms.Button()
        Me.ofdAbrir = New System.Windows.Forms.OpenFileDialog()
        Me.btnmostrar = New System.Windows.Forms.Button()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.txtcedula = New System.Windows.Forms.TextBox()
        Me.gbDelete = New System.Windows.Forms.GroupBox()
        Me.lblborrar = New System.Windows.Forms.Label()
        Me.mnsmenu.SuspendLayout()
        CType(Me.dgvClienteRegistrado, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gbDelete.SuspendLayout()
        Me.SuspendLayout()
        '
        'mnsmenu
        '
        Me.mnsmenu.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.mnsmenu.ImageScalingSize = New System.Drawing.Size(20, 20)
        Me.mnsmenu.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.Menutmns, Me.DueñosToolStripMenuItem})
        Me.mnsmenu.Location = New System.Drawing.Point(0, 0)
        Me.mnsmenu.Name = "mnsmenu"
        Me.mnsmenu.Size = New System.Drawing.Size(1007, 28)
        Me.mnsmenu.TabIndex = 1
        Me.mnsmenu.Text = "MenuStrip1"
        '
        'Menutmns
        '
        Me.Menutmns.Name = "Menutmns"
        Me.Menutmns.Size = New System.Drawing.Size(182, 24)
        Me.Menutmns.Text = "Volver al Menu Principal"
        '
        'DueñosToolStripMenuItem
        '
        Me.DueñosToolStripMenuItem.Name = "DueñosToolStripMenuItem"
        Me.DueñosToolStripMenuItem.Size = New System.Drawing.Size(188, 24)
        Me.DueñosToolStripMenuItem.Text = "Abrir Registro de dueños"
        '
        'dgvClienteRegistrado
        '
        Me.dgvClienteRegistrado.AllowUserToAddRows = False
        Me.dgvClienteRegistrado.AllowUserToDeleteRows = False
        Me.dgvClienteRegistrado.AllowUserToResizeColumns = False
        Me.dgvClienteRegistrado.AllowUserToResizeRows = False
        Me.dgvClienteRegistrado.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgvClienteRegistrado.Location = New System.Drawing.Point(24, 444)
        Me.dgvClienteRegistrado.Name = "dgvClienteRegistrado"
        Me.dgvClienteRegistrado.RowHeadersWidth = 51
        Me.dgvClienteRegistrado.RowTemplate.Height = 24
        Me.dgvClienteRegistrado.Size = New System.Drawing.Size(899, 201)
        Me.dgvClienteRegistrado.TabIndex = 3
        '
        'lblruta
        '
        Me.lblruta.AutoSize = True
        Me.lblruta.Location = New System.Drawing.Point(49, 66)
        Me.lblruta.Name = "lblruta"
        Me.lblruta.Size = New System.Drawing.Size(33, 17)
        Me.lblruta.TabIndex = 4
        Me.lblruta.Text = "ruta"
        '
        'txtruta
        '
        Me.txtruta.Location = New System.Drawing.Point(114, 61)
        Me.txtruta.Name = "txtruta"
        Me.txtruta.Size = New System.Drawing.Size(655, 22)
        Me.txtruta.TabIndex = 5
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
        'ofdAbrir
        '
        Me.ofdAbrir.FileName = "OpenFileDialog1"
        '
        'btnmostrar
        '
        Me.btnmostrar.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.btnmostrar.Location = New System.Drawing.Point(796, 60)
        Me.btnmostrar.Name = "btnmostrar"
        Me.btnmostrar.Size = New System.Drawing.Size(83, 23)
        Me.btnmostrar.TabIndex = 9
        Me.btnmostrar.Text = "mostrar"
        Me.btnmostrar.UseVisualStyleBackColor = False
        '
        'PictureBox1
        '
        Me.PictureBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PictureBox1.Image = Global.Veterinaria.My.Resources.Resources.imagen2
        Me.PictureBox1.Location = New System.Drawing.Point(0, 28)
        Me.PictureBox1.Margin = New System.Windows.Forms.Padding(4)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(1007, 645)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'txtcedula
        '
        Me.txtcedula.Location = New System.Drawing.Point(97, 21)
        Me.txtcedula.Name = "txtcedula"
        Me.txtcedula.Size = New System.Drawing.Size(138, 22)
        Me.txtcedula.TabIndex = 10
        '
        'gbDelete
        '
        Me.gbDelete.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.gbDelete.Controls.Add(Me.lblborrar)
        Me.gbDelete.Controls.Add(Me.txtcedula)
        Me.gbDelete.Controls.Add(Me.btndelete)
        Me.gbDelete.Location = New System.Drawing.Point(186, 382)
        Me.gbDelete.Name = "gbDelete"
        Me.gbDelete.Size = New System.Drawing.Size(471, 46)
        Me.gbDelete.TabIndex = 11
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
        'frmClientesRegistrados
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1007, 673)
        Me.ControlBox = False
        Me.Controls.Add(Me.gbDelete)
        Me.Controls.Add(Me.btnmostrar)
        Me.Controls.Add(Me.txtruta)
        Me.Controls.Add(Me.lblruta)
        Me.Controls.Add(Me.dgvClienteRegistrado)
        Me.Controls.Add(Me.PictureBox1)
        Me.Controls.Add(Me.mnsmenu)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MainMenuStrip = Me.mnsmenu
        Me.Margin = New System.Windows.Forms.Padding(4)
        Me.Name = "frmClientesRegistrados"
        Me.Text = "Clientes Registrados"
        Me.mnsmenu.ResumeLayout(False)
        Me.mnsmenu.PerformLayout()
        CType(Me.dgvClienteRegistrado, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gbDelete.ResumeLayout(False)
        Me.gbDelete.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents mnsmenu As MenuStrip
    Friend WithEvents Menutmns As ToolStripMenuItem
    Friend WithEvents DueñosToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents dgvClienteRegistrado As DataGridView
    Friend WithEvents lblruta As Label
    Friend WithEvents txtruta As TextBox
    Friend WithEvents btndelete As Button
    Friend WithEvents ofdAbrir As OpenFileDialog
    Friend WithEvents btnmostrar As Button
    Friend WithEvents txtcedula As TextBox
    Friend WithEvents gbDelete As GroupBox
    Friend WithEvents lblborrar As Label
End Class
