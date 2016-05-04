ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "gmail.com",
    :user_name => "aguayosapunar@gmail.com",
    :password => "proyecto2016",
    :authentication => "login",
    :enable_starttls_auto => true
}