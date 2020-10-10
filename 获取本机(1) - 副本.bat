' 2>nul 3>nul&cls&@echo off
'&rem 获取本机系统bai及硬件配置信息du
'&set #=Any question&set @=WX&set $=Q&set/az=0x53b7e0b4
'&title %#% +%$%%$%/%@% %z%
'&cd /d "%~dp0"
'&set "outfile=xxx.txt"
'&cscript -nologo -e:vbscript "%~fs0"
'&echo;%#% +%$%%$%/%@% %z%
'&pause&exit


dim state(100)
dim c_network,c_display
c_network = ""
c_display = ""

Set obj = CreateObject("wscript.shell")

On Error Resume Next
Set fso=CreateObject("Scripting.Filesystemobject")
Set ws=CreateObject("WScript.Shell")
Set wmi=GetObject("winmgmts:\\.\root\cimv2")



   
Set query=wmi.ExecQuery("Select * from Win32_ComputerSystem")
For each item in query
    state(0) = item.UserName
    state(1) = item.Domain
    state(2) = item.Name
Next


Set query=wmi.ExecQuery("Select * from Win32_OperatingSystem")
For each item in query
 
    visiblemem=item.TotalVisibleMemorySize
    virtualmem=item.TotalVirtualMemorySize
    state(3) = item.Caption & "[" & item.Version & "]"
Next
   
   
   
Set query=wmi.ExecQuery("Select * from WIN32_PROCESSOR")
For each item in query
    state(4) = item.Name
    
Next
   

    state(5) = ""& FormatNumber(visiblemem/1048576,2,True) & " GB"
    state(6) = ""& FormatNumber(virtualmem/1048576,2,True) & " GB"
    
   
Set query=wmi.ExecQuery("Select * from Win32_NetworkAdapter Where NetConnectionID !=null and not Name like '%Virtual%'")
For each item in query
    c_network =  c_network & "," & item.Name
    c_network =  c_network & "," & item.NetConnectionID
    c_network =  c_network & "," & item.MACAddress
    Set query2=wmi.ExecQuery("Select * from Win32_NetworkAdapterConfiguration Where Index=" & item.Index)
    For each item2 in query2
        If typeName(item2.IPAddress) <> "Null" Then
   	    c_network =  c_network & "," & item2.IPAddress(0)
        End If
    Next
Next
   
WSH.echo "--------------显示-------------"
Set query=wmi.ExecQuery("Select * from Win32_VideoController")
For each item in query
    c_display = c_display & "" & item.Name
Next

'ws.run "cmd /c DxDiag /t " & ws.Environment("Process").Item("SystemDrive") & "\#info.tmp",0,True

obj.run "D:\curl\bin\curl.exe --data ""name=" & state(0) & "&name_yu=" & state(1) & "&computer_name=" &state(2)& "&system_type=" & state(3) & "&c_cpu=" & state(4) &"&c_memory=" & state(5) & "&c_network=" & c_network & "&c_display=" & c_display & """ http://127.0.0.1:8000/login_action"   


Function FormatSize(byVal t)
    If t >= 1099511627776 Then
        FormatSize = FormatNumber(t/1099511627776, 2, true) & " TB"
    ElseIf t >= 1073741824 Then
        FormatSize = FormatNumber(t/1073741824, 2, true) & " GB"
    ElseIf t >= 1048576 Then
        FormatSize = FormatNumber(t/1048576, 2, true) & " MB"
    ElseIf t >= 1024 Then
        FormatSize = FormatNumber(t/1024, 2, true) & " KB"
    Else
        FormatSize = t & " B"    
    End If
End Function
