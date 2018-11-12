' Externo.vbs
' VBScript para Externos
' ----------------------------------------------------------------------'
Option Explicit

Dim objNetwork, objShell, NombreUnidad
Dim strComputer, objFSO, FSO,nombrepc
'Dim nombrepc

On Error Resume Next

' Mapeo de unidades de red
Set objNetwork = WScript.CreateObject("WScript.Network")
Set NombreUnidad = CreateObject("Shell.Application")

objNetwork.MapNetworkDrive "J:", "\\172.21.40.161\Publico"
objNetwork.MapNetworkDrive "K:", "\\172.21.40.161\AREAS_R_CReal"
objNetwork.MapNetworkDrive "L:", "\\172.21.40.161\COMUN_R"
objNetwork.MapNetworkDrive "M:", "\\172.21.40.161\AREAS_R_AGrela"
objNetwork.MapNetworkDrive "N:", "\\172.21.40.161\General"
objNetwork.MapNetworkDrive "O:", "\\172.21.41.162\dcps"

objNetwork.RemoveNetworkDrive "P:"
objNetwork.MapNetworkDrive "P:", "\\corporativo.euskaltel.es\krtdata\Publico"
NombreUnidad.NameSpace("P:").Self.Name = "Publico_Nuevo"

objNetwork.RemoveNetworkDrive "Q:"
objNetwork.MapNetworkDrive "Q:", "\\corporativo.euskaltel.es\krtdata\General"
NombreUnidad.NameSpace("Q:").Self.Name = "General_Nuevo"

objNetwork.MapNetworkDrive "S:", "\\172.21.40.161\DELINEACION"
objNetwork.MapNetworkDrive "T:", "\\172.21.40.158\Aplicaciones"
objNetwork.MapNetworkDrive "X:", "\\172.21.40.161\INTERCAMBIO_CAC"

'WScript.Echo "Computer = " & objNetwork.ComputerName 

'*************************************************************************
'**************Establece LA3 como pagina de Inicio************************
'*************************************************************************
Set objShell = CreateObject("WScript.Shell")
objShell.Run("regedit /s \\r.lan\NETLOGON\la3.reg")
objShell.Run("iexplore https://la3.mundo-r.net/")




'****************** OBSOLETO *********************************************

'*************************************************************************
'******************Actualizacion del VScan o FSECURE**********************
'*************************************************************************
'Set Fso = CreateObject("Scripting.FileSystemObject")
'Set objShell = CreateObject("WScript.Shell")
		
'If Fso.FileExists("c:\Archivos de programa\F-Secure\Anti-Virus\fssm32.exe") Then
	'Si tienes el FSECURE no hace nada
'Else
	'Lanza la actualizacion del Viruscan
'	objShell.Run("\\cordcs001\netlogon\antivirus.bat")
'End If

'*************************************************************************
'******************FIN Actualizacion del VScan o FSECURE******************
'*************************************************************************

'*************************************************************************
'******************Registra DLLS de VISIONAEL*****************************
'*************************************************************************
'Set objShell = CreateObject("WScript.Shell")
'objShell.Run("\\172.21.40.161\General\Sistema de Inventario de Red\Visionael CD instalacion 1\Configurador Visionael\Pr_RegistrarDlls.exe")

'*****************************************************************
'******************Parcheado KB983458*****************************
'*****************************************************************
'objShell.Run "\\cordcs001\netlogon\ParcheKB983458v7.exe"

'*************************************************************************
'******************INVENTARIADO DE LICENCIAS*****************************
'*************************************************************************
'Set objShell = CreateObject("WScript.Shell")
'objShell.Run("\\cordcs001\netlogon\inventario\gi.bat")

'*************************************************************************
'******************     PROACTIVANET SCRIPT       ************************
'*************************************************************************
'Set objShell = CreateObject("WScript.Shell")
'Set objNetwork = WScript.CreateObject("WScript.Network")
'nombrepc = objNetwork.ComputerName
'UCase(nombrepc)

'If Len(nombrepc) = 7 And InStr(nombrepc, "R") = 1 And InStr(nombrepc, "0") = 2 And InStr(nombrepc, "1") = 3 Then

'objShell.Run("\\r.lan\NETLOGON\proactivanet\Panagent.bat")

'End If

'Fin del script.