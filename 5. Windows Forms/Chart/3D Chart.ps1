[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms.DataVisualization")
$WeekTable = @{
    "Week1" = 50
    "Week2" = 50
}
$WeekChart = New-Object System.Windows.Forms.DataVisualization.Charting.Chart
$WeekChart.Width = 1200
$WeekChart.Height = 768
$Area3DStyle = New-Object System.Windows.Forms.DataVisualization.Charting.ChartArea3DStyle;
$Area3DStyle.Enable3D = $true;
$ChartArea = $WeekChart.ChartAreas.Add('ChartArea');
$ChartArea.Area3DStyle = $Area3DStyle;

$ChartSeries = $WeekChart.Series.Add("Data")
$WeekChart.Series["Data"].Points.DataBindXY($WeekTable.Keys, $WeekTable.Values)
#$WeekChart.Series["Data"].ChartType = [System.Windows.Forms.DataVisualization.Charting.SeriesChartType]::Pie
# Display chart on form
$WeekChart.Anchor = [System.Windows.Forms.AnchorStyles]::Bottom -bor [System.Windows.Forms.AnchorStyles]::Right -bor 
[System.Windows.Forms.AnchorStyles]::Top -bor [System.Windows.Forms.AnchorStyles]::Left 
$Form = New-Object Windows.Forms.Form
$Form.Text = "Escape Windows XP statistics"
$Form.Width = 1024
$Form.Height = 820
$Form.controls.add($WeekChart)
$Form.Add_Shown({$Form.Activate()})
$Form.ShowDialog()
