Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Form Setup
$form = New-Object System.Windows.Forms.Form
$form.Text = "3x3 Grid"
$form.ClientSize = New-Object System.Drawing.Size(180, 180) # Inner area exactly 180x180
$form.StartPosition = "CenterScreen"

$boxSize = 50
$spacing = 10
# (180 - (3*50 + 2*10)) / 2 = 5px margin to center the grid
$margin = 5 

# Create 3x3 Grid
for ($row = 0; $row -lt 3; $row++) {
    for ($col = 0; $col -lt 3; $col++) {
        $panel = New-Object System.Windows.Forms.Panel
        
        # Calculate Position
        $x = $margin + ($col * ($boxSize + $spacing))
        $y = $margin + ($row * ($boxSize + $spacing))
        
        $panel.Location = New-Object System.Drawing.Point($x, $y)
        $panel.Size = New-Object System.Drawing.Size($boxSize, $boxSize)
        $panel.BackColor = "SteelBlue"
        
        $form.Controls.Add($panel)
    }
}

$form.ShowDialog()
