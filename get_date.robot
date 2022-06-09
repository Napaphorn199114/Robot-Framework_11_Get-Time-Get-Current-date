*** Settings ***
Library    DateTime
Library    Selenium2Library

*** Test Cases ***
Get Time 
    ${year}    ${month}    ${day}    ${hour}    ${minute}    ${second}    Get Time    year month day hour minute second
    ${year}    Convert To Integer    ${year}
    ${date_time}    Set Variable    ${year-10}-${month}-${day}  ${hour}:${minute}:${second}   #นับถอยไป 10 ปี 2022-10 = 2012
    Log To Console    \n${date_time}

Get Current Date UTC
    ${date} =    Get Current Date    UTC    exclude_millis=yes               # UTC เวลามาตรฐานโลก
    ${plus14} =    Add Time To Date    ${date}    14 days                    # เวลาปัจจุบัน +14 วัน
    ${future}    Convert Date    ${plus14}    result_format=%a %B %d %H:%M:%S UTC %Y   #Ex. (%a =Mon , %A=Monday , %B=May ,%H%M%S = 13:04:09 UTC=part of string needed, %Y = 2022 )
    Log    ${future}    console=yes