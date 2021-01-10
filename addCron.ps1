$action = New-ScheduledTaskAction -Execute './addCron.ps1'
$trigger = New-ScheduledTaskTrigger -Daily -At 12am
$task = Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "check volt"
$task.Triggers.Repetition.Interval = "PT1M" #Repeat every 1 minutes, use PT1H for every hour
$task | Set-ScheduledTask