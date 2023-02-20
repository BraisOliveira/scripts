On Error Resume Next
Dim IE, IE_URL
Set IE = CreateObject("InternetExplorer.Application")
With IE
  .Visible = True
  IE_URL = "https://www.google.com/"
  .Navigate IE_URL, 14, "_self", Null
End With