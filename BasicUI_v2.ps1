# Load Windows Forms Assembly
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Main Login Window
$form = New-Object System.Windows.Forms.Form
$form.Text = "Basic PowerShell UI"
$form.Size = New-Object System.Drawing.Size(500, 225) # Adjusted size for a more typical Windows form
$form.StartPosition = "CenterScreen"

# Username (Label)
$usernameLabel = New-Object System.Windows.Forms.Label
$usernameLabel.Text = "Enter your username:"
$usernameLabel.Location = New-Object System.Drawing.Point(10, 20)
$usernameLabel.Size = New-Object System.Drawing.Size(150, 20)
$form.Controls.Add($usernameLabel)

# Username (Textbox)
$usernameTextBox = New-Object System.Windows.Forms.TextBox
$usernameTextBox.Location = New-Object System.Drawing.Point(160, 20)
$usernameTextBox.Size = New-Object System.Drawing.Size(300, 20)
$usernameTextBox.Text = "testuser" # Pre-filled with a sample username for testing
$form.Controls.Add($usernameTextBox)

# Password (Label)
$passwordLabel = New-Object System.Windows.Forms.Label
$passwordLabel.Text = "Enter your password:"
$passwordLabel.Location = New-Object System.Drawing.Point(10, 60)
$passwordLabel.Size = New-Object System.Drawing.Size(150, 20)
$form.Controls.Add($passwordLabel)

# Password (Textbox)
$passwordTextBox = New-Object System.Windows.Forms.TextBox
$passwordTextBox.Location = New-Object System.Drawing.Point(160, 60)
$passwordTextBox.Size = New-Object System.Drawing.Size(300, 20)
$passwordTextBox.UseSystemPasswordChar = $true # Masks input with *
$passwordTextBox.Text = "testpassword" # Pre-filled with a sample password for testing
$form.Controls.Add($passwordTextBox)

# Selection Combo Box
$comboBox = New-Object System.Windows.Forms.ComboBox
$comboBox.Location = New-Object System.Drawing.Point(160, 100)
$comboBox.Size = New-Object System.Drawing.Size(300, 20)
$comboBox.Items.AddRange(@("Option 1", "Option 2", "Option 3"))
$form.Controls.Add($comboBox)

# Sumbit Button
$button = New-Object System.Windows.Forms.Button
$button.Text = "Submit"
$button.Location = New-Object System.Drawing.Point(160, 140)
$button.Size = New-Object System.Drawing.Size(100, 30)
$form.Controls.Add($button)

# Button Handler
$button.Add_Click({
    # Fetch values from the textboxes and combo box
    $username = $usernameTextBox.Text
    $password = $passwordTextBox.Text
    $selectedOption = $comboBox.SelectedItem

    # Display a message box with the entered data
    [System.Windows.Forms.MessageBox]::Show("Username: $username`nPassword: $password`nSelected Option: $selectedOption", "Information")
})

# Show the form (Main)
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
