class WelcomeController < ApplicationController
  def index
    require 'mysql2'

    client = Mysql2::Client.new(host: "127.0.0.1", username: "test", password: '123456', database: 'test')

    results = client.query("SELECT * FROM users WHERE id = #{params[:id]}")

    @result = ""

    results.each do |row|
      @result += row['username']
    end
  end
end
