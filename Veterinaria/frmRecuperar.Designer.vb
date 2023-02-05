<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class lblcelular
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
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.VolverAlMenuPrincipalToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MostrarDatosParaRecuperarToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.dgvClienteRegistrado = New System.Windows.Forms.DataGridView()
        Me.ofdAbrir = New System.Windows.Forms.OpenFileDialog()
        Me.lblbuscar = New System.Windows.Forms.Label()
        Me.txtbuscar = New System.Windows.Forms.TextBox()
        Me.txtname = New System.Windows.Forms.TextBox()
        Me.txtId = New System.Windows.Forms.TextBox()
        Me.txtlastname = New System.Windows.Forms.TextBox()
        Me.txtaddress = New System.Windows.Forms.TextBox()
        Me.lblname = New System.Windows.Forms.Label()
        Me.lbldireccion = New System.Windows.Forms.Label()
        Me.apellido = New System.Windows.Forms.Label()
        Me.lblid = New System.Windows.Forms.Label()
        Me.txtemail = New System.Windows.Forms.TextBox()
        Me.lblcorreo = New System.Windows.Forms.Label()
        Me.gbBuscar = New System.Windows.Forms.GroupBox()
        Me.txtcelular = New System.Windows.Forms.TextBox()
        Me.lbltelefono = New System.Windows.Forms.Label()
        Me.btnbuscar = New System.Windows.Forms.Button()
        Me.laldato = New System.Windows.Forms.Label()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.MenuStrip1.SuspendLayout()
        CType(Me.dgvClienteRegistrado, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gbBuscar.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'MenuStrip1
        '
        Me.MenuStrip1.ImageScalingSize = New System.Drawing.Size(20, 20)
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.VolverAlMenuPrincipalToolStripMenuItem, Me.MostrarDatosParaRecuperarToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(995, 30)
        Me.MenuStrip1.TabIndex = 0
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'VolverAlMenuPrincipalToolStripMenuItem
        '
        Me.VolverAlMenuPrincipalToolStripMenuItem.Name = "VolverAlMenuPrincipalToolStripMenuItem"
        Me.VolverAlMenuPrincipalToolStripMenuItem.Size = New System.Drawing.Size(183, 26)
        Me.VolverAlMenuPrincipalToolStripMenuItem.Text = "Volver al menu principal"
        '
        'MostrarDatosParaRecuperarToolStripMenuItem
        '
        Me.MostrarDatosParaRecuperarToolStripMenuItem.Name = "MostrarDatosParaRecuperarToolStripMenuItem"
        Me.MostrarDatosParaRecuperarToolStripMenuItem.Size = New System.Drawing.Size(218, 26)
        Me.MostrarDatosParaRecuperarToolStripMenuItem.Text = "Mostrar Datos para recuperar"
        '
        'dgvClienteRegistrado
        '
        Me.dgvClienteRegistrado.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgvClienteRegistrado.Location = New System.Drawing.Point(28, 368)
        Me.dgvClienteRegistrado.Name = "dgvClienteRegistrado"
        Me.dgvClienteRegistrado.RowHeadersWidth = 51
        Me.dgvClienteRegistrado.RowTemplate.Height = 24
        Me.dgvClienteRegistrado.Size = New System.Drawing.Size(899, 201)
        Me.dgvClienteRegistrado.TabIndex = 4
        '
        'ofdAbrir
        '
        Me.ofdAbrir.FileName = "OpenFileDialog1"
        '
        'lblbuscar
        '
        Me.lblbuscar.AutoSize = True
        Me.lblbuscar.Location = New System.Drawing.Point(28, 29)
        Me.lblbuscar.Name = "lblbuscar"
        Me.lblbuscar.Size = New System.Drawing.Size(51, 17)
        Me.lblbuscar.TabIndex = 5
        Me.lblbuscar.Text = "buscar"
        '
        'txtbuscar
        '
        Me.txtbuscar.Location = New System.Drawing.Point(91, 26)
        Me.txtbuscar.Name = "txtbuscar"
        Me.txtbuscar.Size = New System.Drawing.Size(136, 22)
        Me.txtbuscar.TabIndex = 6
        '
        'txtname
        '
        Me.txtname.Location = New System.Drawing.Point(116, 106)
        Me.txtname.Name = "txtname"
        Me.txtname.Size = New System.Drawing.Size(303, 22)
        Me.txtname.TabIndex = 8
        '
        'txtId
        '
        Me.txtId.Location = New System.Drawing.Point(116, 63)
        Me.txtId.Name = "txtId"
        Me.txtId.Size = New System.Drawing.Size(303, 22)
        Me.txtId.TabIndex = 9
        '
        'txtlastname
        '
        Me.txtlastname.Location = New System.Drawing.Point(116, 155)
        Me.txtlastname.Name = "txtlastname"
        Me.txtlastname.Size = New System.Drawing.Size(303, 22)
        Me.txtlastname.TabIndex = 10
        '
        'txtaddress
        '
        Me.txtaddress.Location = New System.Drawing.Point(116, 203)
        Me.txtaddress.Name = "txtaddress"
        Me.txtaddress.Size = New System.Drawing.Size(303, 22)
        Me.txtaddress.TabIndex = 11
        '
        'lblname
        '
        Me.lblname.AutoSize = True
        Me.lblname.Location = New System.Drawing.Point(29, 109)
        Me.lblname.Name = "lblname"
        Me.lblname.Size = New System.Drawing.Size(56, 17)
        Me.lblname.TabIndex = 12
        Me.lblname.Text = "nombre"
        '
        'lbldireccion
        '
        Me.lbldireccion.AutoSize = True
        Me.lbldireccion.Location = New System.Drawing.Point(29, 208)
        Me.lbldireccion.Name = "lbldireccion"
        Me.lbldireccion.Size = New System.Drawing.Size(65, 17)
        Me.lbldireccion.TabIndex = 13
        Me.lbldireccion.Text = "direccion"
        '
        'apellido
        '
        Me.apellido.AutoSize = True
        Me.apellido.Location = New System.Drawing.Point(29, 158)
        Me.apellido.Name = "apellido"
        Me.apellido.Size = New System.Drawing.Size(56, 17)
        Me.apellido.TabIndex = 14
        Me.apellido.Text = "nombre"
        '
        'lblid
        '
        Me.lblid.AutoSize = True
        Me.lblid.Location = New System.Drawing.Point(29, 66)
        Me.lblid.Name = "lblid"
        Me.lblid.Size = New System.Drawing.Size(50, 17)
        Me.lblid.TabIndex = 15
        Me.lblid.Text = "cedula"
        '
        'txtemail
        '
        Me.txtemail.Location = New System.Drawing.Point(160, 279)
        Me.txtemail.Name = "txtemail"
        Me.txtemail.Size = New System.Drawing.Size(259, 22)
        Me.txtemail.TabIndex = 16
        '
        'lblcorreo
        '
        Me.lblcorreo.AutoSize = True
        Me.lblcorreo.Location = New System.Drawing.Point(29, 282)
        Me.lblcorreo.Name = "lblcorreo"
        Me.lblcorreo.Size = New System.Drawing.Size(122, 17)
        Me.lblcorreo.TabIndex = 17
        Me.lblcorreo.Text = "correo electronico"
        '
        'gbBuscar
        '
        Me.gbBuscar.Controls.Add(Me.txtcelular)
        Me.gbBuscar.Controls.Add(Me.lbltelefono)
        Me.gbBuscar.Controls.Add(Me.lblid)
        Me.gbBuscar.Controls.Add(Me.btnbuscar)
        Me.gbBuscar.Controls.Add(Me.lblcorreo)
        Me.gbBuscar.Controls.Add(Me.txtbuscar)
        Me.gbBuscar.Controls.Add(Me.txtname)
        Me.gbBuscar.Controls.Add(Me.lblbuscar)
        Me.gbBuscar.Controls.Add(Me.txtemail)
        Me.gbBuscar.Controls.Add(Me.txtId)
        Me.gbBuscar.Controls.Add(Me.txtlastname)
        Me.gbBuscar.Controls.Add(Me.apellido)
        Me.gbBuscar.Controls.Add(Me.txtaddress)
        Me.gbBuscar.Controls.Add(Me.lbldireccion)
        Me.gbBuscar.Controls.Add(Me.lblname)
        Me.gbBuscar.Location = New System.Drawing.Point(28, 43)
        Me.gbBuscar.Name = "gbBuscar"
        Me.gbBuscar.Size = New System.Drawing.Size(594, 319)
        Me.gbBuscar.TabIndex = 18
        Me.gbBuscar.TabStop = False
        Me.gbBuscar.Text = "busqueda"
        '
        'txtcelular
        '
        Me.txtcelular.Location = New System.Drawing.Point(116, 239)
        Me.txtcelular.Name = "txtcelular"
        Me.txtcelular.Size = New System.Drawing.Size(303, 22)
        Me.txtcelular.TabIndex = 19
        '
        'lbltelefono
        '
        Me.lbltelefono.AutoSize = True
        Me.lbltelefono.Location = New System.Drawing.Point(29, 244)
        Me.lbltelefono.Name = "lbltelefono"
        Me.lbltelefono.Size = New System.Drawing.Size(50, 17)
        Me.lbltelefono.TabIndex = 18
        Me.lbltelefono.Text = "celular"
        '
        'btnbuscar
        '
        Me.btnbuscar.Image = Global.Veterinaria.My.Resources.Resources.iamgen
        Me.btnbuscar.Location = New System.Drawing.Point(233, 24)
        Me.btnbuscar.Name = "btnbuscar"
        Me.btnbuscar.Size = New System.Drawing.Size(144, 26)
        Me.btnbuscar.TabIndex = 7
        Me.btnbuscar.Text = "Buscar"
        Me.btnbuscar.UseVisualStyleBackColor = True
        '
        'laldato
        '
        Me.laldato.AutoSize = True
        Me.laldato.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.laldato.Location = New System.Drawing.Point(628, 52)
        Me.laldato.Name = "laldato"
        Me.laldato.Size = New System.Drawing.Size(242, 50)
        Me.laldato.TabIndex = 41
        Me.laldato.Text = "Digite el numero de cedula" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & " para encontrar sus datos " & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10)
        '
        'PictureBox1
        '
        Me.PictureBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PictureBox1.Image = Global.Veterinaria.My.Resources.Resources.imagen2
        Me.PictureBox1.Location = New System.Drawing.Point(0, 0)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(995, 581)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 19
        Me.PictureBox1.TabStop = False
        '
        'lblcelular
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.ClientSize = New System.Drawing.Size(995, 581)
        Me.Controls.Add(Me.laldato)
        Me.Controls.Add(Me.gbBuscar)
        Me.Controls.Add(Me.dgvClienteRegistrado)
        Me.Controls.Add(Me.MenuStrip1)
        Me.Controls.Add(Me.PictureBox1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "lblcelular"
        Me.Text = "frmRecuperar"
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        CType(Me.dgvClienteRegistrado, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gbBuscar.ResumeLayout(False)
        Me.gbBuscar.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents MenuStrip1 As MenuStrip
    Friend WithEvents VolverAlMenuPrincipalToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents dgvClienteRegistrado As DataGridView
    Friend WithEvents ofdAbrir As OpenFileDialog
    Friend WithEvents lblbuscar As Label
    Friend WithEvents txtbuscar As TextBox
    Friend WithEvents btnbuscar As Button
    Friend WithEvents txtname As TextBox
    Friend WithEvents MostrarDatosParaRecuperarToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents txtId As TextBox
    Friend WithEvents txtlastname As TextBox
    Friend WithEvents txtaddress As TextBox
    Friend WithEvents lblname As Label
    Friend WithEvents lbldireccion As Label
    Friend WithEvents apellido As Label
    Friend WithEvents lblid As Label
    Friend WithEvents txtemail As TextBox
    Friend WithEvents lblcorreo As Label
    Friend WithEvents gbBuscar As GroupBox
    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents txtcelular As TextBox
    Friend WithEvents lbltelefono As Label
    Friend WithEvents laldato As Label
End Class
