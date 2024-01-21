class GetTemperatureController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @rooms= Room.all.order(:id).map { |value| [value.name,value.id]}
    @list = Temperature.eager_load(:room).order(id: :desc).limit(1000)
  end

  def receive_data
    if request.post?
      temperature = params[:temperature].to_f
      room_id = Room.where(serialnumber: params[:serialnumber]).ids[0]
      if temperature != 0.0
        check_temperature(temperature,room_id)
        data = Temperature.new
        data.temperature = temperature
        data.room_id = room_id
        data.save
      end
    end
  end

  def detail
    if request.get?
      @room_name = Room.find(params[:room_id]).name
      @list = Temperature.all.where(room_id: params[:room_id]).order(id: :desc).limit(1000)
    end
  end

  def check_temperature(input,id)
    room = Room.find(id)
    if input >= 30.0
      if room.allert_count != 0
        AnounceMailer.danger_mail(room,room.allert_count).deliver_now
      end
      AnounceMailer.notice_mail(room,input).deliver_now
      room.allert_count += 1
    else
      room.allert_count = 0
    end
    room.save
  end

  def csv
    @users = Temperature.all
    csv_data = CSV.generate(row_sep: "\r\n", encoding:Encoding::SJIS) do |csv|
      csv << ["温度", "部屋番号","日付"]
      @users.each do |user|
        csv << [user.temperature, user.room_id,user.created_at]
      end
    end
    send_data(csv_data, filename: "温度一覧.csv")
  end

end
