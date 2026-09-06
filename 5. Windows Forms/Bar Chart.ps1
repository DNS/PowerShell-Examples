Add-Type -AssemblyName System.Windows.Forms, System.Windows.Forms.DataVisualization

$data = @'
12/29/23,12/30/23,12/31/23,1/1/24,1/2/24,1/3/24
11,16,22,28,38,55,1
22,24,28,32,44,55,1
'@ | ConvertFrom-Csv

$chart = New-Object System.Windows.Forms.DataVisualization.Charting.Chart
$chart.Titles.Add('Chart Title')
$chart.Dock = [System.Windows.Forms.DockStyle]::Fill
$chart.Series.Add('Series1') | Out-Null
$chart.ChartAreas.Add([System.Windows.Forms.DataVisualization.Charting.ChartArea]::new())
$chart.Series['Series1'].ChartType = 'StackedColumn'
# set to `$true` so that the values are shown in the columns
$chart.Series['Series1'].IsValueShownAsLabel = $true
# foreground color for the column values 
$chart.Series['Series1'].LabelForeColor = [System.Drawing.Color]::White

# Add data to the chart (last 5 columns)
$data[0].PSObject.Properties.Name | Select-Object -Last 5 | ForEach-Object {
    foreach ($row in $data) {
        $chart.Series['Series1'].Points.AddXY($_, $row.$_)
    }
}

# Display the chart
$form = [System.Windows.Forms.Form]::new()
$form.Size = '1280, 720'
$form.Controls.Add($chart)
$form.ShowDialog()
