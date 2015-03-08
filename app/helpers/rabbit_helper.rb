require 'bunny'

module RabbitHelper
  class MSG
    def initialize
      # Ensure that the queue is created in RabbitMQ.
      myMessage.messages_queue
    end

    # Opens a consumer connection to the RabbitMQ service, if one isn't
    # already open.  This is a class method because a new instance of
    # the controller class will be created upon each request.  But AMQP
    # connections can be long-lived, so we would like to re-use the
    # connection across many requests.
    def self.consumer
      unless @consumer
        c = Bunny.new(ENV['RABBITMQ_BIGWIG_RX_URL'])
        c.start
        @consumer = c

        # We only want to accept one un-acked message
        @consumer.qos :prefetch_count => 1
      end
      @consumer
    end

    # Return the "nameless exchange", pre-defined by AMQP as a means to
    # send messages to specific queues.  Again, we use a class method to
    # share this across requests.
    def self.nameless_exchange
      @nameless_exchange ||= producer.exchange('')
    end

    # Return a queue named "messages".  This will create the queue on
    # the server, if it did not already exist.  Again, we use a class
    # method to share this across requests.
    def self.messages_queue
      @messages_queue ||= consumer.queue("messages")
    end
  end

  def get
    # Wait for a message from the queue
    MSG.messages_queue.subscribe(:ack => true, :timeout => 10,
                                 :message_max => 1) do |itm|
      # Show what we got
puts itm[:payload]
    end
  end

end
