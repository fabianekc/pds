require 'bunny'
namespace :rabbit do
  task consume: :environment do
    conn = Bunny.new(ENV['RABBITMQ_BIGWIG_RX_URL'])
    conn.start
    ch   = conn.create_channel
    q    = ch.queue("message")
    puts "waiting for messages..."

    # Wait for a message from the queue
    q.subscribe(:ack => true, :timeout => 10, :message_max => 1) do |itm|
      # Show what we got
      puts itm[:payload]
    end

  end

end
