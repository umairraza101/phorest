class PhorestApi
  def initialize()
    @auth = {username: credential(:username), password: credential(:password)}
    @headers = {'Content-Type' => 'application/json'}
  end


  def clients(email=nil, phone_number= nil)
    email_query = email.present? ? "email=#{email}" : ""
    phone_query = phone_number.present? ? "phone=#{phone_number}" : ""
    query = "?#{email_query}&#{phone_query}"

    response = HTTParty.get("#{credential(:endpoint)}#{credential(:business_id)}/client#{query}",
                            basic_auth: @auth, headers: @headers)
    result = parse_json(response)
    result._embedded&.clients
  end


  def create_voucher(amount, client_id)
    query =
        {
            "clientId": "#{client_id}",
            "creatingBranchId": "#{credential(:branch_id)}",
            "expiryDate": "2020-08-07T14:14:40.183Z",
            "issueDate": "2020-08-07T14:14:40.183Z",
            "originalBalance": amount
        }

    response = HTTParty.post("#{credential(:endpoint)}#{credential(:business_id)}/voucher",
                             basic_auth: @auth, body: query.to_json, headers: @headers)

    parse_json(response)

  end


  def parse_json(response)
    JSON.parse(response.body, object_class: OpenStruct)
  end


  def credential(key)
    Rails.application.credentials.send(key)
  end
end