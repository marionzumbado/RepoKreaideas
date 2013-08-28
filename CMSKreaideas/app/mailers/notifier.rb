class Notifier < ActionMailer::Base
  #default :from => 'Sam Ruby <depot@example.com>'
  #default from: "mzumbado@cecropiasolutions.com"
  #default to: "mzumbado@cecropiasolutions.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.emailcontact_received.subject
  #
  def emailcontact_received(mail2)
    @mail2 = mail2

   # mail to: "mzumbado@cecropiasolutions.com", :from => mail.email, :subject => mail.message
    mail :to => "Kreaideascompany@gmail.com", :from => mail2.email, :subject => "Correo de contacto"
  end
end
