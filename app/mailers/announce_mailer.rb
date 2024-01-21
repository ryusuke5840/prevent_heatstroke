class AnounceMailer < ApplicationMailer
  default from: '温度監視システム'
  def notice_mail(room,temperature)
    @room = room
    @temperature = temperature
    mail(
      to:   @room.user_email,
      subject: '高温を検出しました'
    )
  end

  def danger_mail(room,count)
    @minute = 5 * count
    @room = room
    mail(
      to:   @room.family_email,
      subject: '危険です'
    )
  end
end