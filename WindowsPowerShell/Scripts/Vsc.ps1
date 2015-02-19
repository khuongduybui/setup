#New-Label "Hello World" -Show
$excel = New-Object -ComObject "Excel.Application"
$excel.Visible = $True
$wb = $excel.Workbooks.Add()
$ws = $wb.ActiveSheet
$cells=$ws.Cells

for ($i = 1; $i -le 10000; $i++)
{
    #for ($j = 1; $j -le 20; $j++)
    #{
    #    $cells.item($i, $j) = "aasd"
    #}
    $ws.range("A$i:A$i").cells="Cell a1"
}
# $ws.range("A1:A1").cells="Cell a1"
# $ws.range("A1:A1").cells="Cell a1"
# $ws.range("A2:A2").cells="A2"
# $ws.range("b1:b1").cells="Cell B1"
# $ws.range("b2:b2").cells="b2"
# $ws.range("D1:D1").cells=2
# $ws.range("D2:D2").cells=2
# $ws.range("D3:D3").cells.formula = "=sum(d1,d2)"

$path = Resolve-Path("~")
$path = "$path\test.xlsx"
#$wb.saveas($path)
$wb.close()
$excel.quit()
