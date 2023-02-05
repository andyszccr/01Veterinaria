<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmClientesNuevos
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
        Me.mnsClientesNuevos = New System.Windows.Forms.MenuStrip()
        Me.VolverAlMenuPrincipalToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SalirToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.lblnombre = New System.Windows.Forms.Label()
        Me.lblapellido = New System.Windows.Forms.Label()
        Me.lblCedula = New System.Windows.Forms.Label()
        Me.lbladdress = New System.Windows.Forms.Label()
        Me.lblcellphone = New System.Windows.Forms.Label()
        Me.txtemail = New System.Windows.Forms.TextBox()
        Me.lblemail = New System.Windows.Forms.Label()
        Me.txtcellphone = New System.Windows.Forms.TextBox()
        Me.txtaddress = New System.Windows.Forms.TextBox()
        Me.txtlastname1 = New System.Windows.Forms.TextBox()
        Me.txtname = New System.Windows.Forms.TextBox()
        Me.txtId = New System.Windows.Forms.TextBox()
        Me.btnRegistrar = New System.Windows.Forms.Button()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.dgvCliente = New System.Windows.Forms.DataGridView()
        Me.clID = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.clname = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.cllastname = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.claddress = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.cltelefono = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.clemail = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.sfdXML = New System.Windows.Forms.SaveFileDialog()
        Me.txtruta = New System.Windows.Forms.TextBox()
        Me.lblruta = New System.Windows.Forms.Label()
        Me.mnsClientesNuevos.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.dgvCliente, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'mnsClientesNuevos
        '
        Me.mnsClientesNuevos.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.mnsClientesNuevos.ImageScalingSize = New System.Drawing.Size(20, 20)
        Me.mnsClientesNuevos.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.VolverAlMenuPrincipalToolStripMenuItem, Me.SalirToolStripMenuItem})
        Me.mnsClientesNuevos.Location = New System.Drawing.Point(0, 0)
        Me.mnsClientesNuevos.Name = "mnsClientesNuevos"
        Me.mnsClientesNuevos.Size = New System.Drawing.Size(984, 28)
        Me.mnsClientesNuevos.TabIndex = 0
        Me.mnsClientesNuevos.Text = "MenuStrip1"
        '
        'VolverAlMenuPrincipalToolStripMenuItem
        '
        Me.VolverAlMenuPrincipalToolStripMenuItem.Name = "VolverAlMenuPrincipalToolStripMenuItem"
        Me.VolverAlMenuPrincipalToolStripMenuItem.Size = New System.Drawing.Size(186, 24)
        Me.VolverAlMenuPrincipalToolStripMenuItem.Text = "Volver al Menu Principal "
        '
        'SalirToolStripMenuItem
        '
        Me.SalirToolStripMenuItem.Name = "SalirToolStripMenuItem"
        Me.SalirToolStripMenuItem.Size = New System.Drawing.Size(56, 24)
        Me.SalirToolStripMenuItem.Text = "Salir "
        '
        'lblnombre
        '
        Me.lblnombre.AutoSize = True
        Me.lblnombre.Location = New System.Drawing.Point(29, 131)
        Me.lblnombre.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.lblnombre.Name = "lblnombre"
        Me.lblnombre.Size = New System.Drawing.Size(56, 17)
        Me.lblnombre.TabIndex = 2
        Me.lblnombre.Text = "nombre"
        '
        'lblapellido
        '
        Me.lblapellido.AutoSize = True
        Me.lblapellido.Location = New System.Drawing.Point(28, 166)
        Me.lblapellido.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.lblapellido.Name = "lblapellido"
        Me.lblapellido.Size = New System.Drawing.Size(101, 17)
        Me.lblapellido.TabIndex = 3
        Me.lblapellido.Text = "primer apellido"
        '
        'lblCedula
        '
        Me.lblCedula.AutoSize = True
        Me.lblCedula.Location = New System.Drawing.Point(28, 96)
        Me.lblCedula.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.lblCedula.Name = "lblCedula"
        Me.lblCedula.Size = New System.Drawing.Size(50, 17)
        Me.lblCedula.TabIndex = 4
        Me.lblCedula.Text = "cedula"
        '
        'lbladdress
        '
        Me.lbladdress.AutoSize = True
        Me.lbladdress.Location = New System.Drawing.Point(29, 207)
        Me.lbladdress.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.lbladdress.Name = "lbladdress"
        Me.lbladdress.Size = New System.Drawing.Size(65, 17)
        Me.lbladdress.TabIndex = 5
        Me.lbladdress.Text = "direccion"
        '
        'lblcellphone
        '
        Me.lblcellphone.AutoSize = True
        Me.lblcellphone.Location = New System.Drawing.Point(29, 251)
        Me.lblcellphone.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.lblcellphone.Name = "lblcellphone"
        Me.lblcellphone.Size = New System.Drawing.Size(59, 17)
        Me.lblcellphone.TabIndex = 6
        Me.lblcellphone.Text = "telefono"
        '
        'txtemail
        '
        Me.txtemail.Location = New System.Drawing.Point(106, 292)
        Me.txtemail.Margin = New System.Windows.Forms.Padding(4)
        Me.txtemail.Name = "txtemail"
        Me.txtemail.Size = New System.Drawing.Size(226, 22)
        Me.txtemail.TabIndex = 15
        '
        'lblemail
        '
        Me.lblemail.AutoSize = True
        Me.lblemail.Location = New System.Drawing.Point(29, 297)
        Me.lblemail.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.lblemail.Name = "lblemail"
        Me.lblemail.Size = New System.Drawing.Size(49, 17)
        Me.lblemail.TabIndex = 14
        Me.lblemail.Text = "correo"
        '
        'txtcellphone
        '
        Me.txtcellphone.Location = New System.Drawing.Point(104, 246)
        Me.txtcellphone.Margin = New System.Windows.Forms.Padding(4)
        Me.txtcellphone.Name = "txtcellphone"
        Me.txtcellphone.Size = New System.Drawing.Size(227, 22)
        Me.txtcellphone.TabIndex = 11
        '
        'txtaddress
        '
        Me.txtaddress.Location = New System.Drawing.Point(113, 202)
        Me.txtaddress.Margin = New System.Windows.Forms.Padding(4)
        Me.txtaddress.Name = "txtaddress"
        Me.txtaddress.Size = New System.Drawing.Size(219, 22)
        Me.txtaddress.TabIndex = 10
        '
        'txtlastname1
        '
        Me.txtlastname1.Location = New System.Drawing.Point(144, 163)
        Me.txtlastname1.Margin = New System.Windows.Forms.Padding(4)
        Me.txtlastname1.Name = "txtlastname1"
        Me.txtlastname1.Size = New System.Drawing.Size(188, 22)
        Me.txtlastname1.TabIndex = 9
        '
        'txtname
        '
        Me.txtname.Location = New System.Drawing.Point(103, 128)
        Me.txtname.Margin = New System.Windows.Forms.Padding(4)
        Me.txtname.Name = "txtname"
        Me.txtname.Size = New System.Drawing.Size(228, 22)
        Me.txtname.TabIndex = 8
        '
        'txtId
        '
        Me.txtId.Location = New System.Drawing.Point(104, 91)
        Me.txtId.Margin = New System.Windows.Forms.Padding(4)
        Me.txtId.Name = "txtId"
        Me.txtId.Size = New System.Drawing.Size(228, 22)
        Me.txtId.TabIndex = 7
        '
        'btnRegistrar
        '
        Me.btnRegistrar.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.btnRegistrar.Location = New System.Drawing.Point(353, 47)
        Me.btnRegistrar.Name = "btnRegistrar"
        Me.btnRegistrar.Size = New System.Drawing.Size(139, 34)
        Me.btnRegistrar.TabIndex = 16
        Me.btnRegistrar.Text = "Registrar"
        Me.btnRegistrar.UseVisualStyleBackColor = False
        '
        'PictureBox1
        '
        Me.PictureBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PictureBox1.Image = Global.Veterinaria.My.Resources.Resources.imagen21
        Me.PictureBox1.Location = New System.Drawing.Point(0, 0)
        Me.PictureBox1.Margin = New System.Windows.Forms.Padding(4)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(984, 608)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 1
        Me.PictureBox1.TabStop = False
        '
        'dgvCliente
        '
        Me.dgvCliente.AllowUserToDeleteRows = False
        Me.dgvCliente.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgvCliente.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.clID, Me.clname, Me.cllastname, Me.claddress, Me.cltelefono, Me.clemail})
        Me.dgvCliente.Location = New System.Drawing.Point(32, 401)
        Me.dgvCliente.Name = "dgvCliente"
        Me.dgvCliente.ReadOnly = True
        Me.dgvCliente.RowHeadersWidth = 51
        Me.dgvCliente.RowTemplate.Height = 24
        Me.dgvCliente.Size = New System.Drawing.Size(805, 195)
        Me.dgvCliente.TabIndex = 17
        '
        'clID
        '
        Me.clID.HeaderText = "Cedula"
        Me.clID.MinimumWidth = 6
        Me.clID.Name = "clID"
        Me.clID.ReadOnly = True
        Me.clID.Width = 125
        '
        'clname
        '
        Me.clname.HeaderText = "nombre"
        Me.clname.MinimumWidth = 6
        Me.clname.Name = "clname"
        Me.clname.ReadOnly = True
        Me.clname.Width = 125
        '
        'cllastname
        '
        Me.cllastname.HeaderText = "apellido"
        Me.cllastname.MinimumWidth = 6
        Me.cllastname.Name = "cllastname"
        Me.cllastname.ReadOnly = True
        Me.cllastname.Width = 125
        '
        'claddress
        '
        Me.claddress.HeaderText = "direccion"
        Me.claddress.MinimumWidth = 6
        Me.claddress.Name = "claddress"
        Me.claddress.ReadOnly = True
        Me.claddress.Width = 125
        '
        'cltelefono
        '
        Me.cltelefono.HeaderText = "telefono"
        Me.cltelefono.MinimumWidth = 6
        Me.cltelefono.Name = "cltelefono"
        Me.cltelefono.ReadOnly = True
        Me.cltelefono.Width = 125
        '
        'clemail
        '
        Me.clemail.HeaderText = "correo electronico"
        Me.clemail.MinimumWidth = 6
        Me.clemail.Name = "clemail"
        Me.clemail.ReadOnly = True
        Me.clemail.Width = 125
        '
        'txtruta
        '
        Me.txtruta.Location = New System.Drawing.Point(65, 47)
        Me.txtruta.Name = "txtruta"
        Me.txtruta.Size = New System.Drawing.Size(266, 22)
        Me.txtruta.TabIndex = 19
        '
        'lblruta
        '
        Me.lblruta.AutoSize = True
        Me.lblruta.Location = New System.Drawing.Point(27, 50)
        Me.lblruta.Name = "lblruta"
        Me.lblruta.Size = New System.Drawing.Size(33, 17)
        Me.lblruta.TabIndex = 20
        Me.lblruta.Text = "ruta"
        '
        'frmClientesNuevos
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(984, 608)
        Me.ControlBox = False
        Me.Controls.Add(Me.lblruta)
        Me.Controls.Add(Me.txtruta)
        Me.Controls.Add(Me.dgvCliente)
        Me.Controls.Add(Me.btnRegistrar)
        Me.Controls.Add(Me.txtemail)
        Me.Controls.Add(Me.lblemail)
        Me.Controls.Add(Me.mnsClientesNuevos)
        Me.Controls.Add(Me.txtcellphone)
        Me.Controls.Add(Me.txtaddress)
        Me.Controls.Add(Me.lblCedula)
        Me.Controls.Add(Me.lblcellphone)
        Me.Controls.Add(Me.lbladdress)
        Me.Controls.Add(Me.lblnombre)
        Me.Controls.Add(Me.txtId)
        Me.Controls.Add(Me.txtname)
        Me.Controls.Add(Me.txtlastname1)
        Me.Controls.Add(Me.lblapellido)
        Me.Controls.Add(Me.PictureBox1)
        Me.MainMenuStrip = Me.mnsClientesNuevos
        Me.Margin = New System.Windows.Forms.Padding(4)
        Me.Name = "frmClientesNuevos"
        Me.Text = "Clientes Nuevos"
        Me.mnsClientesNuevos.ResumeLayout(False)
        Me.mnsClientesNuevos.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.dgvCliente, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents mnsClientesNuevos As MenuStrip
    Friend WithEvents VolverAlMenuPrincipalToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents SalirToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents lblnombre As Label
    Friend WithEvents lblapellido As Label
    Friend WithEvents lblCedula As Label
    Friend WithEvents lbladdress As Label
    Friend WithEvents lblcellphone As Label
    Friend WithEvents txtcellphone As TextBox
    Friend WithEvents txtaddress As TextBox
    Friend WithEvents txtlastname1 As TextBox
    Friend WithEvents txtname As TextBox
    Friend WithEvents txtId As TextBox
    Friend WithEvents txtemail As TextBox
    Friend WithEvents lblemail As Label
    Friend WithEvents btnRegistrar As Button
    Friend WithEvents dgvCliente As DataGridView
    Friend WithEvents sfdXML As SaveFileDialog
    Friend WithEvents clID As DataGridViewTextBoxColumn
    Friend WithEvents clname As DataGridViewTextBoxColumn
    Friend WithEvents cllastname As DataGridViewTextBoxColumn
    Friend WithEvents claddress As DataGridViewTextBoxColumn
    Friend WithEvents cltelefono As DataGridViewTextBoxColumn
    Friend WithEvents clemail As DataGridViewTextBoxColumn
    Friend WithEvents txtruta As TextBox
    Friend WithEvents lblruta As Label
End Class
