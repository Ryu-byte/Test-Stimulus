module ApplicationCable
  class Channel < ActionCable::Channel::Base
    
    include CableReady::Broadcaster

    def stream_name
      "#{params[:channel]}:#{connection.session_id.to_s}"
    end

  end
end
