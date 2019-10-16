$TargetMachine = “Target-Machine-Name”
(Get-WmiObject -class Win32_TSGeneralSetting -Namespace root\cimv2\terminalservices -ComputerName $ComputerName -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0)
