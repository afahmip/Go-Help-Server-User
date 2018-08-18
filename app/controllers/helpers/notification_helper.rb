require 'net/http'
require 'uri'
require 'json'

module NotificationHelper

  BASE_URL = 'https://fcm.googleapis.com/fcm/send'

  def NotificationHelper.push_notification(device_id, title)
    header = {
        'Content-Type': 'application/json',
        'Authorization': 'key=AAAAB_w-ypY:APA91bFTVNCUMlZ6iRKNcgPH_2FtxO268-d7Qx42x8nZV-lnYUBNhb8wMc_NB1otku2eHd0hFE60ZSFbD8puAVKzCXLTAtSygnMeGiMJaTjsgZJ8uRO5kiQ98Yfjjo9aqDQyPE1Juvbz'
    }
    data = NotificationHelper.create_data(device_id, title)
    http, request = NotificationHelper.create_http_objects(header, data)
    response = http.request(request)
    puts "response #{response.body}"
    response
  end

  def NotificationHelper.create_data(device_id, title)
    {
        to: device_id,
        collapse_key: 'type_a',
        notification: {
            title: title
        },
        data: {
            body: 'Test',
            title: 'Test judul',
            key_1: 'Hello',
            key_2: 'Teman semua'
        }
    }
  end

  def NotificationHelper.create_http_objects(header, data)
    uri = URI.parse(BASE_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.set_debug_output($stdout)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = data.to_json

    puts request.body

    return http, request
  end

end