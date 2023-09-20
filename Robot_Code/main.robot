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

Validate restaurant page
    #Go to restaurant page
    click element    //*[@id="root"]/div/div[1]/div/div[3]/div/div[3]/a
    sleep    2s
    # Get the element using its XPath
    ${element}    Get WebElement    //*[@id="root"]/div/div[1]/div/div[3]/div/div[3]/a
    # Get the CSS property value that indicates highlighting (e.g., background color)
    ${background_color}    Get Element Attribute    ${element}    style.backgroundColor
    # Verify if the background color indicates highlighting (you can customize this condition)
    Run Keyword If    '${background_color}' == 'green'    Log    Element is highlighted    ELSE    Log    Element is not highlighted
    sleep    2s
Validate WTT logo image in restaurant page
    #WTT logo image
    Element Should Be Visible    xpath:/html/body/div/div/div[1]/div/div[2]/div[1]/div[2]/a/img
    sleep    2s
Validate search bar restaurant page
    #Search bar
    Element Should Be Visible    xpath:/html/body/div/div/div[1]/div/div[2]/div[2]/div/div[1]/input
    sleep    2s
    input text      xpath:/html/body/div/div/div[1]/div/div[2]/div[2]/div/div[1]/input      Dumbu and pilla marri raju
    sleep    3s
    clear element text      xpath:/html/body/div/div/div[1]/div/div[2]/div[2]/div/div[1]/input

validate favourite button
    #Favorites button
    page should contain button      xpath://*[@id="root"]/div/div[1]/div/div[2]/div[3]/div[2]/div/button
    sleep   1s
    element should be enabled       xpath://*[@id="root"]/div/div[1]/div/div[2]/div[3]/div[2]/div/button
    sleep    1s
    click element       xpath://*[@id="root"]/div/div[1]/div/div[2]/div[3]/div[2]/div/button
    sleep    1s
    go back
    Validate restaurant page

Validate cart button
    #cart button
    page should contain button    //*[@id="root"]/div/div[1]/div/div[2]/div[3]/div[2]/a/div/button
    sleep    2s
    click button        //*[@id="root"]/div/div[1]/div/div[2]/div[3]/div[2]/a/div/button
    sleep    2s
    go back

Validate profiles dropdown
    #profiles dropdown
    page should contain element      //*[@id="root"]/div/div[1]/div/div[2]/div[3]/div[3]
    sleep    2s
    click element       //*[@id="root"]/div/div[1]/div/div[2]/div[3]/div[3]
    sleep    3s
    sleep    2s

Validate dropdown options and dropdown closing
    #dropdown options checking
    page should contain element     //*[@id="menu-"]/div[3]/ul/li[1]
    sleep    1s
    page should contain element     //*[@id="menu-"]/div[3]/ul/a
    sleep    1s
    page should contain element     //*[@id="menu-"]/div[3]/ul/li[2]
    sleep    2s
    #Closing dropdown
    Click Element       //*[@id="menu-"]
    sleep    2s

Validate Profile Picture
    #Checking and clicking on profile pic
    page should contain element     //*[@id="root"]/div/div[1]/div/div[2]/div[3]/div[4]/a/img
    sleep    2s
    click element       //*[@id="root"]/div/div[1]/div/div[2]/div[3]/div[4]/a/img
    sleep    2s
    #Landing of my account page
    page should contain    My Account
    sleep    2s

Validate Restaurant page main banner image & image text
    #Go to restaurant page
    Validate restaurant page
    sleep    2s
    page should contain    Welcome to Wtt Restaurants !!!!!!
    sleep    1s
    page should contain    Find Something delicious and healthy!!!!
    sleep    1s
Validate search bar in restaurant banner
    page should contain textfield    //*[@id="root"]/div/div[1]/div/div[5]/div/div/div[2]/div/input
    sleep    2s
    input text      //*[@id="root"]/div/div[1]/div/div[5]/div/div/div[2]/div/input      Dum & Pilla marri raju
    sleep    2s
    clear element text    //*[@id="root"]/div/div[1]/div/div[5]/div/div/div[2]/div/input
    sleep    5s
    ${input_value}=    Get Value    //*[@id="root"]/div/div[1]/div/div[5]/div/div/div[2]/div/input
    # Check if the input value is empty and set the result as either true or false
    ${is_cleared}=    Evaluate    '${input_value}' == ''
    Log    Text box is cleared: ${is_cleared}
    scroll element into view