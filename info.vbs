dim NIC1, Nic, StrIP, CompName

Set NIC1 = GetObject("winmgmts:").InstancesOf("Win32_NetworkAdapterConfiguration")

For Each Nic in NIC1

if Nic.IPEnabled then

StrIP = Nic.IPAddress(i)

Set WshNetwork = WScript.CreateObject("WScript.Network")

CompName= WshNetwork.Computername

MsgBox "DIRECCION IP:  "&StrIP & vbNewLine _
 & "ORDENADOR:  "&CompName,4160,"IP Y ORDENADOR"

wscript.quit

end if

next
