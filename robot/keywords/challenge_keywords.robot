*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/excel_downloader.py
Library    ../libraries/excel_reader.py


*** Variables ***
${rpa_challenge_url}=       http://www.rpachallenge.com/
${excel_download_url}=      http://www.rpachallenge.com/assets/downloadFiles/challenge.xlsx

${xpath_phone_number_field}=     xpath://rpa1-field[@ng-reflect-dictionary-value="Phone Number"]/div/input
${xpath_email_field}=            xpath://rpa1-field[@ng-reflect-dictionary-value="Email"]/div/input
${xpath_address_field}=          xpath://rpa1-field[@ng-reflect-dictionary-value="Address"]/div/input
${xpath_role_field}=             xpath://rpa1-field[@ng-reflect-dictionary-value="Role in Company"]/div/input
${xpath_company_field}=          xpath://rpa1-field[@ng-reflect-dictionary-value="Company Name"]/div/input
${xpath_name_last_field}=        xpath://rpa1-field[@ng-reflect-dictionary-value="Last Name"]/div/input
${xpath_name_first_field}=       xpath://rpa1-field[@ng-reflect-dictionary-value="First Name"]/div/input

*** Keywords ***
Go To Rpa Challenge
    Go To    ${rpa_challenge_url}

Download Excel File
    Get File    ${excel_download_url}

Input Fields
    @{excel_data}=    Read Excel
    FOR    ${row}    IN    @{excel_data}
        Fill Form    ${row}[name_first]    ${row}[name_last]
...                  ${row}[company]    ${row}[role]    ${row}[address]
...                  ${row}[email]    ${row}[phone]
    END

Fill Form
    [Arguments]    ${name_first}    ${name_last}    ${company}
...                ${role}    ${address}    ${email}    ${phone}
    Input Text    ${xpath_name_first_field}    ${name_first}
    Input Text    ${xpath_name_last_field}    ${name_last}
    Input Text    ${xpath_company_field}    ${company}
    Input Text    ${xpath_role_field}    ${role}
    Input Text    ${xpath_address_field}    ${address}
    Input Text    ${xpath_email_field}    ${email}
    Input Text    ${xpath_phone_number_field}    ${phone}
    Click Button    Submit

Start Challenge
    Click Button    Start
