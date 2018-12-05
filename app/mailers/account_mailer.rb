class AccountMailer < ApplicationMailer
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.update.subject
  #
  def confirmation( in_visitor )
    @greeting = [ 'Hallo', in_visitor.name ].compact.join( ' ' ) + ','
    @visitor = in_visitor
    @confirm_url = confirm_visitor_url( in_visitor, ato: in_visitor.generate_auth_token )
    
    mail to: in_visitor.email,
          subject: "[TeiltMit] Bitte bestätigen!"
  end
  
  def password_reset( in_account )
    @greeting = [ 'Hallo', in_account.name ].compact.join( ' ' ) + ','
    @account = in_account
    @confirm_url = set_password_account_url( in_account, ato: in_account.generate_auth_token )
    
    mail to: in_account.email,
          subject: "[TeiltMit] Kennwort neu setzen!"
  end
  
end
