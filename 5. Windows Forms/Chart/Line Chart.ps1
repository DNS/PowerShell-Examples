# 1. Load the required assemblies
Add-Type -AssemblyName System.Windows.Forms
[Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms.DataVisualization") | Out-Null

# 2. Create the Form
$form = New-Object System.Windows.Forms.Form
$form.Text = "PowerShell Line Chart - No Grid"
$form.Size = New-Object System.Drawing.Size(800, 600)
$form.StartPosition = "CenterScreen"

# 3. Create the Chart control
$chart = New-Object System.Windows.Forms.DataVisualization.Charting.Chart
$chart.Dock = [System.Windows.Forms.DockStyle]::Fill

# 4. Create a ChartArea
$chartArea = New-Object System.Windows.Forms.DataVisualization.Charting.ChartArea
$chartArea.Name = "MainArea"

# --- GRID REMOVAL START ---
# Disable grid lines for X Axis
$chartArea.AxisX.MajorGrid.Enabled = $false
$chartArea.AxisX.MinorGrid.Enabled = $false

# Disable grid lines for Y Axis
$chartArea.AxisY.MajorGrid.Enabled = $false
$chartArea.AxisY.MinorGrid.Enabled = $false
# --- GRID REMOVAL END ---

$chartArea.AxisX.Title = "Time (Days)"
$chartArea.AxisY.Title = "Value"
$chart.ChartAreas.Add($chartArea)

# 5. Create a Series
$series = New-Object System.Windows.Forms.DataVisualization.Charting.Series
$series.Name = "Performance"
$series.ChartType = [System.Windows.Forms.DataVisualization.Charting.SeriesChartType]::Line
$series.BorderWidth = 3
$series.MarkerStyle = [System.Windows.Forms.DataVisualization.Charting.MarkerStyle]::Circle
$series.MarkerSize = 8

# 6. Add Data Points
$dataPoints = @(
    @{X=1; Y=10}, @{X=2; Y=25}, @{X=3; Y=15}, @{X=4; Y=40},
    @{X=5; Y=35}, @{X=6; Y=50}, @{X=7; Y=45}
)

foreach ($point in $dataPoints) {
    $series.Points.AddXY($point.X, $point.Y)
}

$chart.Series.Add($series)

# 7. Add Legend and Title
$legend = New-Object System.Windows.Forms.DataVisualization.Charting.Legend
$chart.Legends.Add($legend)
$chart.Titles.Add("Clean Line Chart (No Grid)")

# 8. Finalize and Show
$form.Controls.Add($chart)
$form.ShowDialog()
