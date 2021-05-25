*** Settings ***
Library    SeleniumLibrary 

Suite Setup    Log    I am in Test Suite Setup   
Suite Teardown    Log    I am in test Suite Teardown    
Test Setup    Log    I am in Test Suite Setup   
Test Teardown    Log    I am in test Suite Teardown 

Default Tags    NonTaggedCasesWillHave  #only adds tag if the test does not have a tag
Force Tags    All_Test_Will_Have_This_Tag
*** Test Cases ***
MyFirstTest
    [Tags]    Simple    Hello World
    Log    Hello World...    
    
FirstSeleniumTest
    [Tags]    Selenium
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    2s
    Input Text    name=q    Automation step by step
    Press Keys    name=q    ENTER 
    # Click Button    name=btnk    
    Sleep    1.5s       
    Close Browser
    Log    Test Completed    
    
SampleLoginTest
    [Tags]    Selenium
    [Documentation]    This is a simple login selinuim test    
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    2.5s
    Input Text    id=txtUsername    @{CREDENTIALS}[0]    
    Input Password    id=txtPassword    &{LoginData}[password]    
    Click Button    id=btnLogin    
    Click Element    id=welcome    
    Click Element    link=Logout
    Sleep    1.5s       
    Close Browser
    Log    Test completed 
    Log    This Test was executed on %{USERNAME} on %{os} 
    
KeyWordTest  
    [Tags]    Selenium 
    [Documentation]    This is a simple login selinuim test using tags   
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    2.5s
    LoginKW
    Click Element    id=welcome    
    Click Element    link=Logout
    Sleep    1.5s       
    Close Browser
    Log    Test completed 
    Log    This Test was executed on %{USERNAME} on %{os} 
   
TagTest
    [Tags]    Not Selenium
    Log    TagTest    
    Set Tags    regression1
    Remove Tags    regression1
    
CompareSTringsTest
    [Tags]    compare
    Should Be Equal As Strings    ${s1}    ${s1}  
  
MathTest
    [Tags]    Math
    The result of 22+2 should be 24
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/ 
@{CREDENTIALS}    Admin    admin123
&{LoginData}    usename=Admin    password=admin123
${s1}   MyString
${s2}    MyString    
*** Keywords ***
The result of ${calculation} should be ${expected}
    ${result} =    Evaluate    ${calculation}
    ${expected} =    Convert To Integer    ${expected} 
    Should Be Equal    ${result}     ${expected}
LoginKW
    Input Text    id=txtUsername    @{CREDENTIALS}[0]    
    Input Password    id=txtPassword    &{LoginData}[password]    
    Click Button    id=btnLogin
