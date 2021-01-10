$action = New-ScheduledTaskAction -Execute './addCron.ps1'
$trigger = New-ScheduledTaskTrigger -Daily -At 12am
$task = Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "check tmp"
# $task.Triggers.Repetition.Duration = "P1D" #Repeat for a duration of one day
$task.Triggers.Repetition.Interval = "PT1M" #Repeat every 1 minutes, use PT1H for every hour
$task | Set-ScheduledTask