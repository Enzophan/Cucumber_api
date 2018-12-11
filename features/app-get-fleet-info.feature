Feature: Passenger get fleet info

    I want get fleet info from app passenger/ driver/ mdispatcher to check data

    #################################### Passenger App ######################################
    # TappCar
    Scenario: 01. Connect socket Create Account
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType   | verifyCode | ime                                  | appName   | rv       | password |
            | android  | {"number":"909119999","country":"VN"} | tappcar | passenger | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | tappcar_p | 4.6.2500 |          |
        When I get my account info "register"
        Then I get return info with passenger info
            | res                                                   |
            | {"info":{"fleetId":"tappcar","phone":"+84909119999"}} |

    Scenario: 02. Connect socket Update Profile Account
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType   | verifyCode | ime                                  | appName   | rv       | password |
            | android  | {"number":"909119999","country":"VN"} | tappcar | passenger | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | tappcar_p | 4.6.2500 |          |
        When I send a request to edit account profile with "editProfile"
            | firstName | lastName | email                         | tips | gender | dob        | street                   | city       | state | zipcode | country |
            | Auto      | Update   | autoupdate123123@qupworld.com | 99   | 2      | 09/29/1999 | 1600 Pennsylvania Ave NW | Washington | DC    | 20500   | Vietnam |
        Then I get return info with passenger info
            | res                                                                                                                                                                                                                                                                                                                                                                                                |
            | {"returnCode":200,"response":{"phone":"+84909119999","firstName":"Auto","lastName":"Update","fullName":"Auto Update","fullNameSort":"auto update","email":"autoupdate123123@qupworld.com","firstRegisterFrom":"App","tips":"99","profile":{"gender":2,"dob":"09/29/1999","address":{"street":"1600 Pennsylvania Ave NW","city":"Washington","state":"DC","zipcode":"20500","country":"Vietnam"}}}} |


    Scenario: 03. Connect socket get user account info with "Android"
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType   | verifyCode | ime                                  | appName   | rv       | password |
            | android  | {"number":"909119999","country":"VN"} | tappcar | passenger | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | tappcar_p | 4.6.2500 |          |
        When I send request to get my account info "getUserInfo"
        Then I get return info with passenger info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
            | {"firstName":"Auto","lastName":"Update","fullName":"Auto Update","email":"autoupdate123123@qupworld.com","avatar":"images/avatar/avatarDefault.png","isActive":true,"fleetInfo":{"googleKey":{"key":"4LuGz/8mPN00Q56mmXRRWQTtbdNgfWrsMeI7Aacu5nw=","source":"customized","place":{"key":"ql3exY2vITQjV3lXEIwuoi/e5vKJVrCPH2HlZNAW+X4=","clientId":"vKQq+6c5cBzWOJqEG/M1p+xQy5QHEXlwUGf3yHCROlU=","privateKey":"61vqulBKVObrPiwANyRCwQ8ugbQnGzLhPrrFPryZdzI="},"other":{"key":"4LuGz/8mPN00Q56mmXRRWQTtbdNgfWrsMeI7Aacu5nw=","clientId":"vKQq+6c5cBzWOJqEG/M1pzRm+LxAaIorFtfDUaxGxlg=","privateKey":"61vqulBKVObrPiwANyRCwfw7K2L8MDMzIUA4p4K6ONU="}}},"googleKeys":{"key":"SAeXqfLNfyFcwx+79ADVAwz7zoC+3TwqUB6YHSNIHGw=","place":{"key":"zgFJPZ9G5NLg2fAF+WPT7Fd8Si+oCu5vTs66KBR2Lpg=","clientId":"JmHzlFdjXAtCOxCVdR9tY7FpRXaMBy+70xUk6yIV7tY=","privateKey":"p2FDdh5pYb6pnIC5SD9um+ve9LP3GJ9d62FDqVYlrIg="},"other":{"key":"SAeXqfLNfyFcwx+79ADVAwz7zoC+3TwqUB6YHSNIHGw=","clientId":"drTloM7JWNl/viqTeeSBKVFuyN2xP9ykO/9Cks1zNkE=","privateKey":"ujMUC4Jo6/OFn9kSZWMAzEFDW9/JkaItRvJu9Gi5sCc="}},"googleKey":"SAeXqfLNfyFcwx+79ADVAwz7zoC+3TwqUB6YHSNIHGw="} |


    Scenario: 04. Connect socket get user account info with "iOS"
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType   | verifyCode | ime                                  | appName   | rv       | password |
            | ios      | {"number":"909119999","country":"VN"} | tappcar | passenger | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | tappcar_p | 4.6.2500 |          |
        When I send request to get my account info "getUserInfo"
        Then I get return info with passenger info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
            | {"firstName":"Auto","lastName":"Update","fullName":"Auto Update","email":"autoupdate123123@qupworld.com","avatar":"images/avatar/avatarDefault.png","isActive":true,"fleetInfo":{"googleKey":{"key":"4LuGz/8mPN00Q56mmXRRWb2tpx8lW4pbY3ABP28tPhw=","source":"customized","place":{"key":"ql3exY2vITQjV3lXEIwuosmn4vJDArSbpvJdX1PWLLA=","clientId":"vKQq+6c5cBzWOJqEG/M1p1bT5sQk5BBQ0nwai163L+M=","privateKey":"61vqulBKVObrPiwANyRCwQgnLEMk5dJK/TOBpyQxROk="},"other":{"key":"4LuGz/8mPN00Q56mmXRRWb2tpx8lW4pbY3ABP28tPhw=","clientId":"vKQq+6c5cBzWOJqEG/M1py8gYjYjnGUwhp6QMAsWkJs=","privateKey":"61vqulBKVObrPiwANyRCwbJmla1mR1of7H/4THQRwtg="}}},"googleKeys":{"key":"vMkANq6gwcmaM6Hq/epu2A==","place":{"key":"QtWELNgjMpqby61oj5cAOg==","clientId":"mxqdB+TGXAV24Gve0EEzIvO1PDCfSVdGruBEFnvIXmk=","privateKey":"rTZsyYJYTtZQTWdw9Tib3w=="},"other":{"key":"vMkANq6gwcmaM6Hq/epu2A==","clientId":"OtFWjw3jjQIUTFY3QkZlywBQ9NdXufERj7SKeSbmMwg=","privateKey":"jCzv2cLf+LkSdbPfSBvfxA=="}},"googleKey":"vMkANq6gwcmaM6Hq/epu2A=="} |

    # Yago
    Scenario: 05. Connect socket Create Account
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType   | verifyCode | ime                                  | appName | rv       | password |
            | android  | {"number":"909119999","country":"VN"} | yago    | passenger | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | yago_p  | 4.6.2500 |          |
        When I get my account info "register"
        Then I get return info with passenger info
            | res                                                |
            | {"info":{"fleetId":"yago","phone":"+84909119999"}} |

    Scenario: 06. Connect socket Update Profile Account
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType   | verifyCode | ime                                  | appName | rv       | password |
            | android  | {"number":"909119999","country":"VN"} | yago    | passenger | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | yago_p  | 4.6.2500 |          |
        When I send a request to edit account profile with "editProfile"
            | firstName | lastName | email                         | tips | gender | dob        | street                   | city       | state | zipcode | country |
            | Auto      | Update   | autoupdate123123@qupworld.com | 99   | 2      | 09/29/1999 | 1600 Pennsylvania Ave NW | Washington | DC    | 20500   | Vietnam |
        Then I get return info with passenger info
            | res                                                                                                                                                                                                                                                                                                                                                                                                |
            | {"returnCode":200,"response":{"phone":"+84909119999","firstName":"Auto","lastName":"Update","fullName":"Auto Update","fullNameSort":"auto update","email":"autoupdate123123@qupworld.com","firstRegisterFrom":"App","tips":"99","profile":{"gender":2,"dob":"09/29/1999","address":{"street":"1600 Pennsylvania Ave NW","city":"Washington","state":"DC","zipcode":"20500","country":"Vietnam"}}}} |


    Scenario: 07. Connect socket get user account info with "Android"
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType   | verifyCode | ime                                  | appName | rv       | password |
            | android  | {"number":"909119999","country":"VN"} | yago    | passenger | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | yago_p  | 4.6.2500 |          |
        When I send request to get my account info "getUserInfo"
        Then I get return info with passenger info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"firstName":"Auto","lastName":"Update","fullName":"Auto Update","email":"autoupdate123123@qupworld.com","avatar":"images/avatar/avatarDefault.png","isActive":true,"fleetInfo":{"googleKey":{ "key":"", "source":"default", "place":{ "key":"", "clientId":"", "privateKey":"" }, "other":{ "key":"", "clientId":"", "privateKey":"" } }},"googleKeys":{ "key":"ULmluNfuGsslxN1i93MD7SJs8f5XgsONK7BPsGK85Ko=", "place":{ "key":"udsdHGCOpb1dTtPQYq4+Kk+6PdE/nZB/pke5hsvnmD4=", "clientId":"nsCaK+ClKeY3TMpO76nYT0skf92qgS/VT4DV+S3QMMI=", "privateKey":"iPjm40N/MapO2TJp6q1APvzDJvF4YNZ0RmoDYXQJqJw=" }, "other":{ "key":"ULmluNfuGsslxN1i93MD7SJs8f5XgsONK7BPsGK85Ko=", "clientId":"pWqmIL/JpXKdwWM/XSg2SpdNei+EyJZzPiflbAQPvNw=", "privateKey":"TF802toNwAnbAFfpzElyFmExTz5MKVNVU3qTc9hjmBY=" } }, "googleKey":"ULmluNfuGsslxN1i93MD7SJs8f5XgsONK7BPsGK85Ko="} |


    Scenario: 08. Connect socket get user account info with "iOS"
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType   | verifyCode | ime                                  | appName | rv       | password |
            | ios      | {"number":"909119999","country":"VN"} | yago    | passenger | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | yago_p  | 4.6.2500 |          |
        When I send request to get my account info "getUserInfo"
        Then I get return info with passenger info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
            | {"firstName":"Auto","lastName":"Update","fullName":"Auto Update","email":"autoupdate123123@qupworld.com","avatar":"images/avatar/avatarDefault.png","isActive":true,"fleetInfo":{"googleKey":{ "key":"", "source":"default", "place":{ "key":"", "clientId":"", "privateKey":"" }, "other":{ "key":"", "clientId":"", "privateKey":"" } }},"googleKeys":{"key":"Ih2Ti6kY2/uKqeDbhQ722w==","place":{"key":"v9fgOr//Ket1ovtAc2CRJQ==","clientId":"DQ1Ap6gEDKxz6kw6h/lpW44Jg20+H40MLz3E8W2wbAU=","privateKey":"VpMqc8n3IEZqdhsGGtXzIA=="},"other":{"key":"Ih2Ti6kY2/uKqeDbhQ722w==","clientId":"F25qFVwOii4/qF13YI5ZFCZtuyq75/593KVnGBlIr9Q=","privateKey":"0axjBUyXGc2qb4Y1R+D98Q=="}},"googleKey":"Ih2Ti6kY2/uKqeDbhQ722w=="} |


    #################################### Driver App ######################################

    # TappCar
    Scenario: 01. Connect socket & login driver
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                  | fleetId | appType | verifyCode | ime                                  | appName   | rv       | password |
            | android  | {"number":"2055176419","country":"US"} | tappcar | driver  | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | tappcar_d | 4.6.2800 |          |
        When I get my account info "register"
        Then I get return info with driver info
            | res                                                                   |
            | {"returnCode":1, "info":{"phone":"+12055176419","fleetId":"tappcar"}} |


    Scenario: 02. Connect socket & get Driver Info with Android
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                  | fleetId | appType | verifyCode | ime                                  | appName   | rv       | password |
            | android  | {"number":"2055176419","country":"US"} | tappcar | driver  | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | tappcar_d | 4.6.2800 |          |
        When I send request to get my account info "getDriverInfo"
        Then I get return info with driver info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
            | {"userInfo":{"phone":"+12055176419", "fleetId":"tappcar"},"fleetInfo":{"googleKey":{"key":"CczaaQTOrA3gc0sDsxjd8cdMnCy3OCCSmua6TmZFACI=","source":"customized","place":{"key":"YqcHuIIljDN97QX3sgnDaWubMTwDLaS79Qw5irRNaVU=","clientId":"lZ9THu8rLrD5ZDl5TizyAuaOmuJvaeM62aafCVdur1w=","privateKey":"Ep7Cp5zJY0UW+9FkSW+z9+bUQyrDjJFOn/kucNCI45c="},"other":{"key":"CczaaQTOrA3gc0sDsxjd8cdMnCy3OCCSmua6TmZFACI=","clientId":"lZ9THu8rLrD5ZDl5TizyAheQDfDfcZsnjKTnb751eQ0=","privateKey":"Ep7Cp5zJY0UW+9FkSW+z97U2SRaoXsSbzeF1FutR/is="}}},"googleKeys":{ "key":"NlqYL2wk545SsCHEI/PLUElgXmskJx7pzn7sbZztA10=", "place":{ "key":"1niGsIUY2f8TV7P8Em1vf/mjosmv9demGo8eC0H0Fp4=", "clientId":"bMRT+j32PYv2Yh3nAVcVis+PkJ9ND9WDvYRnhCoBmis=", "privateKey":"tgU9rpa8ucWCYIdY2FYBXMK5Ek+rgI8acvRV+WV0Vfc=" }, "other":{ "key":"NlqYL2wk545SsCHEI/PLUElgXmskJx7pzn7sbZztA10=", "clientId":"JIFMBJhEjk8+CMd0S5l/OssnX+xVy4amB5pF80c1MxY=", "privateKey":"jm6JaHfENfErd5MtZ1WAwd0t6FbOX7Z6lg+Nb53EAkI=" } },"googleKey":"NlqYL2wk545SsCHEI/PLUElgXmskJx7pzn7sbZztA10="} |


    Scenario: 03. Connect socket & get Driver Info with ios
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                  | fleetId | appType | verifyCode | ime                                  | appName   | rv       | password |
            | ios      | {"number":"2055176419","country":"US"} | tappcar | driver  | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | tappcar_d | 4.6.2800 |          |
        When I send request to get my account info "getDriverInfo"
        Then I get return info with driver info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
            | {"userInfo":{"phone":"+12055176419", "fleetId":"tappcar"},"fleetInfo":{"googleKey":{ "key":"CczaaQTOrA3gc0sDsxjd8Xh0DkAjrWBKQ2CxMslBQ3Q=", "source":"customized", "place":{ "key":"YqcHuIIljDN97QX3sgnDaYxge8Cd2E+ah/fkyPeN3QY=", "clientId":"lZ9THu8rLrD5ZDl5TizyAsLGJKtHPvP9qskZMMCl5E4=", "privateKey":"Ep7Cp5zJY0UW+9FkSW+z9znTa8PRD/5Jcvvwh5rd1WE=" }, "other":{ "key":"CczaaQTOrA3gc0sDsxjd8Xh0DkAjrWBKQ2CxMslBQ3Q=", "clientId":"lZ9THu8rLrD5ZDl5TizyApxC3DxBlMsMXsawI0SXOdQ=", "privateKey":"Ep7Cp5zJY0UW+9FkSW+z9+K9mSdG+FiDAFMF5mHXHwk=" } }},"googleKeys":{"key":"g6qRxigiA55rO2pGTGg+TQ==","place":{"key":"MZOxMDIP8t7ArpjoBSTTgQ==","clientId":"+hobgoE/xgqeLbWWUhA6DgqKrCUmPKQUGSfIs4WDnH0=","privateKey":"d5TXlkWb8I5GVTEMgtY7TQ=="},"other":{"key":"g6qRxigiA55rO2pGTGg+TQ==","clientId":"mEnIe6U0XjRFGJK/HdiGYvuolRGFNmUEZozQMsmVa6Q=","privateKey":"+r+kA3W8k+Z/fO3qWxcS9Q=="}},"googleKey":"g6qRxigiA55rO2pGTGg+TQ=="} |

    # Yago
    Scenario: 04. Connect socket & login driver
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType | verifyCode | ime                                  | appName | rv       | password |
            | android  | {"number":"619999999","country":"FR"} | yago    | driver  | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | yago_d  | 4.6.2800 |          |
        When I get my account info "register"
        Then I get return info with driver info
            | res                                                                |
            | {"returnCode":1, "info":{"phone":"+33619999999","fleetId":"yago"}} |


    Scenario: 05. Connect socket & get Driver Info with Android
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType | verifyCode | ime                                  | appName | rv       | password |
            | android  | {"number":"619999999","country":"FR"} | yago    | driver  | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | yago_d  | 4.6.2800 |          |
        When I send request to get my account info "getDriverInfo"
        Then I get return info with driver info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
            | {"userInfo":{"phone":"+33619999999", "fleetId":"yago"},"fleetInfo":{"googleKey":{"key":"","source":"default","place":{"key":"","clientId":"","privateKey":""},"other":{"key":"","clientId":"","privateKey":""}}},"googleKeys":{ "key":"vayqEzEYg/mt5WV6GbOc+i0sfkxXLsk+iGrzrYl4qP8=", "place":{ "key":"uP1aSw53Z/Ogp8efEO6jyScR4fph0QBFgYY2mauTML0=", "clientId":"sfbq7JjAQ0Hc+ONyxs23GO6qcawcNI7NhjHj+/QsBe4=", "privateKey":"HNe14u/Vz15QC6OWVVxLYC0K/MEE6lvllCAXc/HrgDE=" }, "other":{ "key":"vayqEzEYg/mt5WV6GbOc+i0sfkxXLsk+iGrzrYl4qP8=", "clientId":"TccgkJHTzSfbcazZE3yq2mk4sfWIf1nOhPLEqzkwHZg=", "privateKey":"3Lr8Li/hqgzDQiFq5mk+bCNYDEgAb00sFw0RK71KJ7k=" } },"googleKey":"vayqEzEYg/mt5WV6GbOc+i0sfkxXLsk+iGrzrYl4qP8="} |


    Scenario: 06. Connect socket & get Driver Info with ios
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType | verifyCode | ime                                  | appName | rv       | password |
            | ios      | {"number":"619999999","country":"FR"} | yago    | driver  | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | yago_d  | 4.6.2800 |          |
        When I send request to get my account info "getDriverInfo"
        Then I get return info with driver info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
            | {"userInfo":{"phone":"+33619999999", "fleetId":"yago"},"fleetInfo":{"googleKey":{"key":"","source":"default","place":{"key":"","clientId":"","privateKey":""},"other":{"key":"","clientId":"","privateKey":""}}},"googleKeys":{ "key":"h/Q5X0CKYqZu6gKGWU8uLw==", "place":{ "key":"5zeGQmcHJnuZf+dDbrkKYg==", "clientId":"ap8pDC3KF2vUPPVoMrhPgGn4tfE70011il7gHO1s9Y4=", "privateKey":"mAMNPAaa217wisYE3naCsQ==" }, "other":{ "key":"h/Q5X0CKYqZu6gKGWU8uLw==", "clientId":"Bh4UK8qMWp5iI5PaZiyUUYL1fx1nLPWncEH+kfe5T7o=", "privateKey":"36cKL9aHIUal4JeNNt3OsQ==" } },"googleKey":"h/Q5X0CKYqZu6gKGWU8uLw=="} |


    #################################### mDispatcher App ######################################

    # TappCar
    Scenario: 01. Connect socket & login mDispatcher
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                  | fleetId | appType     | verifyCode | ime                                  | appName   | rv       | password |
            | android  | {"number":"2042011234","country":"CA"} | tappcar | mDispatcher | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | tappcar_m | 4.6.2800 | password |
        When I get my account info "register"
        Then I get return info with mDispatcher info
            | res                                                                                                                                                                                                                                                                                                                                                                                              |
            | {"returnCode":1,"info":{"userId":"585d05fbe4b026d8092148f1","language":"en","phone":"+12042011234","fleetId":"tappcar","agreement":false,"queuingAreaId":"585d05b6e4b026d8092148ef","phoneFormat":{"country":"CA","number":"2042011234","full":"+12042011234"}},"loginPw":true,"trackUrl":"https://track.lab.qup.vn/","rvsSetting":{"inbox":0,"userInfo":0,"fleetInfo":[{"fleetId":"tappcar"}]}} |


    Scenario: 02. Connect socket & get mDispatcher Info
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                  | fleetId | appType     | verifyCode | ime                                  | appName   | rv       | password |
            | android  | {"number":"2042011234","country":"CA"} | tappcar | mDispatcher | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | tappcar_m | 4.6.2800 | password |
        When I send request to get my account info "getMDispatcherInfo"
        Then I get return info with mDispatcher info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
            | {"phone":"+12042011234","fleetId":"tappcar","firstName":"mDispatcher","lastName":"Hiền","email":"tester.qup@gmail.com","mDispatcherInfo":{"googleKey":{"key":"gOA1uvzzNGm6RrpNpmbnnoDSkd8dpc5hH3b4mJFso+k=","source":"customized","place":{"key":"xuNfpqKKUZrntb25Pe10QeoPtKzqJN0ri+7ffVUzH7M=","clientId":"SPcLzT8xFPbtGYRzLqz8sWc6Mu8pCJ9tGGzrffNWsgU=","privateKey":"ZbtXLhUNJXuNKO/zco/oFbHHDqaVshRxMcaFimxtmsU="},"other":{"key":"gOA1uvzzNGm6RrpNpmbnnoDSkd8dpc5hH3b4mJFso+k=","clientId":"SPcLzT8xFPbtGYRzLqz8sdWQCPfafLUv52HzvXdF1ko=","privateKey":"ZbtXLhUNJXuNKO/zco/oFWtk1JyhX0bfzvOy9CI9Fck="}}},"googleKeys":{ "key":"ZKz8zxMuk8O1sOPKUI7L4www5+klCplRukCV2LCqm0Y=", "place":{ "key":"dlSYqquZ+5C43IOUzVcSq/ZXcufww+kqMi4Ig9ZXQUE=", "clientId":"w+X8r84C0n0gyYiXgA+D/3KAct4lckT1cEzBLUSYiuI=", "privateKey":"OUGQK+qeZQjCeVa865yMIFhofwFqj4H8Rg2FRBmB6wQ=" }, "other":{ "key":"ZKz8zxMuk8O1sOPKUI7L4www5+klCplRukCV2LCqm0Y=", "clientId":"Ja6YWXD3tYIHKzhEx7dbMvRa72HiVzjVfdofJlw+mvs=", "privateKey":"XmA3SCzCIctoKw0/6fzh0hnM6ZdjX8sUkq0Feke20Do=" } }, "googleKey":"ZKz8zxMuk8O1sOPKUI7L4www5+klCplRukCV2LCqm0Y="} |


    Scenario: 03. Connect socket & get mDispatcher Info
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                  | fleetId | appType     | verifyCode | ime                                  | appName   | rv       | password |
            | ios      | {"number":"2042011234","country":"CA"} | tappcar | mDispatcher | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | tappcar_m | 4.6.2800 | password |
        When I send request to get my account info "getMDispatcherInfo"
        Then I get return info with mDispatcher info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"phone":"+12042011234","fleetId":"tappcar","firstName":"mDispatcher","lastName":"Hiền","email":"tester.qup@gmail.com","mDispatcherInfo":{"googleKey":{"key":"gOA1uvzzNGm6RrpNpmbnnjRtiS9aahpu8B+q0Ks1dt0=","source":"customized","place":{"key":"xuNfpqKKUZrntb25Pe10QSeYLVAQMFrsmgswgMbK/PM=","clientId":"SPcLzT8xFPbtGYRzLqz8sX8yzdf2ZX2tD/19ErCLIPk=","privateKey":"ZbtXLhUNJXuNKO/zco/oFS8dbAmwdTEU9EzLCeUfnUg="},"other":{"key":"gOA1uvzzNGm6RrpNpmbnnjRtiS9aahpu8B+q0Ks1dt0=","clientId":"SPcLzT8xFPbtGYRzLqz8sTFrM3mW6l0TTUqQaFdvw74=","privateKey":"ZbtXLhUNJXuNKO/zco/oFf2mSGAomO7HfKrU9R2F+d8="}}},"googleKeys":{"key":"JcrPBufd9D/y+xIT+ZN3Rg==","place":{"key":"PcICCIqHY2cPxnNd+K4FMQ==","clientId":"Xk1GK2Br5ZjhTSIKMNMQ+aFvLUoQKYBe7akqe7Nl/+s=","privateKey":"9PXVBiddeLDQRaQMJ8NHkg=="},"other":{"key":"JcrPBufd9D/y+xIT+ZN3Rg==","clientId":"jMAo49tmm+hhRWdxq3lc6jpCzX6Ut4glnXA4c/OBKyE=","privateKey":"k3RiMct63Q1QRo+yKKMT5A=="}},"googleKey":"JcrPBufd9D/y+xIT+ZN3Rg=="} |


    # Yago
    Scenario: 04. Connect socket & login mDispatcher
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType     | verifyCode | ime                                  | appName | rv       | password |
            | android  | {"number":"608888888","country":"FR"} | yago    | mDispatcher | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | yago_m  | 4.6.2800 | password |
        When I get my account info "register"
        Then I get return info with mDispatcher info
            | res                                                                                                                                                                                                                                                                                                                                            |
            | {"returnCode":1,"info":{"userId":"5c0e323fa6e0b6259f81985c","language":"en","phone":"+33608888888","fleetId":"yago","agreement":false,"phoneFormat":{"country":"FR","number":"608888888","full":"+33608888888"}},"loginPw":true,"trackUrl":"https://track.lab.qup.vn/","rvsSetting":{"inbox":0,"userInfo":0,"fleetInfo":[{"fleetId":"yago"}]}} |


    Scenario: 05. Connect socket & get mDispatcher Info
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType     | verifyCode | ime                                  | appName | rv       | password |
            | android  | {"number":"608888888","country":"FR"} | yago    | mDispatcher | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | yago_m  | 4.6.2800 | password |
        When I send request to get my account info "getMDispatcherInfo"
        Then I get return info with mDispatcher info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
            | {"phone":"+33608888888","fleetId":"yago","firstName":"Hiền","lastName":"Đỗ","email":"","mDispatcherInfo":{"googleKey":{"key":"","source":"default","place":{"key":"","clientId":"","privateKey":""},"other":{"key":"","clientId":"","privateKey":""}}},"googleKeys":{"key":"kB/w57btnfZbBXnmYkRzyiLCwfMRYFQjDvoQ2xvMWhw=","place":{"key":"LJEoPNPQqAWN4aQ1/u+jdJ7lvRNKw6IeQwYmkUyAFV0=","clientId":"Hx/MDcGoy49Y2PvLhN5voLynMH9yOleij7aedE1YGsk=","privateKey":"oyaJ688+VrF6GokHEDhvpmXHDRUs/Xa1aSS3gtwdcBs="},"other":{"key":"kB/w57btnfZbBXnmYkRzyiLCwfMRYFQjDvoQ2xvMWhw=","clientId":"5deePoDCoa9ujt7bq0DGwsOyjNFUG5WWJ1ceU8bbMos=","privateKey":"KQ9MkokZJOtmNbtmlJPI7fyQZp9ePdQIe1GW9akWIVc="}},"googleKey":"kB/w57btnfZbBXnmYkRzyiLCwfMRYFQjDvoQ2xvMWhw="} |


    Scenario: 06. Connect socket & get mDispatcher Info
        Given I request connect socket to "https://dispatcher.lab.qup.vn"
        And I want register socket with data
            | platform | phone                                 | fleetId | appType     | verifyCode | ime                                  | appName | rv       | password |
            | ios      | {"number":"608888888","country":"FR"} | yago    | mDispatcher | 1211       | A1E17271-7671-40EB-851B-71D4515652B8 | yago_m  | 4.6.2800 | password |
        When I send request to get my account info "getMDispatcherInfo"
        Then I get return info with mDispatcher info
            | res                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
            | {"phone":"+33608888888","fleetId":"yago","firstName":"Hiền","lastName":"Đỗ","email":"","mDispatcherInfo":{"googleKey":{"key":"","source":"default","place":{"key":"","clientId":"","privateKey":""},"other":{"key":"","clientId":"","privateKey":""}}},"googleKeys":{"key":"cjknaPMkuofhtrEHfJI55Q==","place":{"key":"/F+KIbWPR3ZUcHnHEUbgqg==","clientId":"xCEQXp5XTaBz68IcFOW8CsVp8TJ7TfK0+tCSIZxwViA=","privateKey":"ydOk946G7JZWRWAkH4SsBg=="},"other":{"key":"cjknaPMkuofhtrEHfJI55Q==","clientId":"fdjVAWKSw89UvbuLtjlNkGPg+Ft2Q7eoH5Tz/J8Oao0=","privateKey":"h2y3MzkRcIs6EYAkRTd6eA=="}},"googleKey":"cjknaPMkuofhtrEHfJI55Q=="} |

