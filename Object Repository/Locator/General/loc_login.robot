# LOGIN

*** Variables ***
# -- image --
${img_logo}                     //img[@alt='logo' and contains(@src, 'paper-white')]

# -- title --
${title_login}                  //div[@class='auth-form__title__text']

# -- input field --
${input_email}                  //input[(@name='email') and (@formcontrolname='identifier')]
${input_password}               //input[(@name='password') and (@type='password') and (@placeholder= 'Masukkan kata sandi Anda')]

# -- button --
${btn_next_email}               //form[contains(@class, 'auth')]/button[@type='submit']
${btn_next_pass}                //form[contains(@class, 'form-wrapper')]/button[@type='submit']
${btn_login}                    //button[(@type='submit') and contains(text(), 'Masuk')]

${btn_user}                     //button[contains(@class, 'btn-custom-users')]
${btn_logout}                   //div[contains(@class, 'sign-out')]

# -- popup --
${popup_error}                  //div[@class='paper-toast error']/div[@class='toast-content']
${popup_error_title}            ${popup_error}/h1
${popup_error_text}             ${popup_error}/h3

# -- message --
${msg_error_login}              //auth-login-limit[@type='danger']
${msg_wrong_pass_title}         ${msg_error_login}/div/div/div[2]/div[1]
${msg_wrong_pass_text}          ${msg_error_login}/div/div/div[2]/div[2]