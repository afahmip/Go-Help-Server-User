module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def json_message(message, status)
    render json: {
        status: status,
        message: message
    }.to_json
  end
end