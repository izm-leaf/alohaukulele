class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_aloha.subject
  #
  def sendmail_aloha(ukulele)
    @ukulele = ukulele

    mail to: "yizumi.nttpc@gmail.com",
      subject: '投稿されました'
  end
end
