require 'bunny'
namespace :rabbit do
  task consume: :environment do
    conn = Bunny.new("amqp://xvxqvlzc:ThQpXOX21MZHh58ghM_NQx01VyFg5ica@bunny.cloudamqp.com/xvxqvlzc")
    conn.start
    ch   = conn.create_channel
    q    = ch.queue("message")
    puts "waiting for messages..."

    # Wait for a message from the queue
    q.subscribe(:block => true) do |delivery_info, properties, body|
      puts " [x] Received #{body}"
      @d = Response.new
      obj = JSON.parse(body)
      obj.keys.each do |k|
        @d[k] = obj[k]
      end
      @d.save
    end

  end

end
