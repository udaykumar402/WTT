*** Settings ***
Library    SeleniumLibrary
Variables    ../Variables/variables.py



*** Variables ***
${website}  https://wtt-51243-react-native.b51243.dev.eastus.az.svc.builder.cafe/
${browser}  Chrome


*** Test Cases ***
1.Open WTT page landing
    Open WTT website
    sleep    2s

2.Login with valid credentials
    Login in page
    sleep    2s

#3.Restaurant page loading
#    Validate restaurant page
#    sleep    2s
#
#4.WTT logo in restaurant page
#    Validate WTT logo image in restaurant page
#    sleep    2s
#
#5.Search bar in restaurant page
#    Validate search bar restaurant page
#    sleep    2s
#
#6.Favourites button
#    validate favourite button
#    sleep    2s
#
#7.Cart button
#    Validate cart button
#    sleep    2s
#
#8.Profiles dropdown
#    Validate profiles dropdown
#    sleep    2s
#
#9.Dropdown options and dropdown closing
#    Validate dropdown options and dropdown closing
#    sleep    2s
#
#10.Profile Picture
#    Validate Profile Picture
#    sleep    2s
#
#11.Restaurant page main banner image & image text
#    Validate Restaurant page main banner image & image text
#    sleep    2s
#
#12.Search bar in Restaurant page main banner
#    Validate search bar in restaurant banner
#    sleep    2s



*** Keywords ***
Open WTT website
    #open browser
    Open Browser  ${website}  ${browser}
    Sleep  2s
    Maximize Browser Window

Login in page
    #Go to login
    Click Element  xpath://span[@class="MuiButton-label" and text()="Log in"]
    #enter inpput email
    Input Text  xpath://input[@name="email"]  vijaya@yopmail.com
    #Enter password
    Input Text  xpath://input[@name="password"]  Test@123
    #Click on login button
    Click Element  xpath://span[@class="MuiButton-label normal_login_btn" and text()="Login"]
    Sleep   5s