# Preview all emails at http://localhost:3000/rails/mailers/visitor_mailer
class VisitorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/visitor_mailer/update
  def update
    VisitorMailer.update
  end

end
