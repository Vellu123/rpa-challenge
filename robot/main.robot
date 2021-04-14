*** Settings ***
Resource    ./keywords/browser_keywords.robot
Resource    ./keywords/challenge_keywords.robot


*** Tasks ***
Browser Setup
    Open Firefox

Challenge Tasks
    Go To Rpa Challenge
    Download Excel File
    Start Challenge
    Input Fields
    [Teardown]    Close Firefox