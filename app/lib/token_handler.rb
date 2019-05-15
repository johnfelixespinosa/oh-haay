module TokenHandler
  def self.encode(sub)
    payload = {
      iss: 'http://localhost:3000',
      sub: sub,
      exp: 4.hours.from_now.to_i,
      iat: Time.now.to_i
    }
    JWT.encode(payload, 'my_s3cr3t', 'HS256')
  end

  def self.decode(token)
    options = {
      iss: 'http://localhost:3000',
      verify_iss: true,
      verify_iat: true,
      leeway: 30,
      algorithm: 'HS256'
    }
    JWT.decode(token, 'my_s3cr3t', true, options)
  end
end