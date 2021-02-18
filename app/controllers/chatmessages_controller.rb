class ChatmessagesController < ApplicationController
    before_action :authenticate_user!

    def create
        chatmessage = Chatmessage.new(chatmessage_params)
        chatmessage.user = current_user

        if chatmessage.save
            ActionCable.server.broadcast "room_channel",
                                         foo: chatmessage.body

            redirect_to chatrooms_path
        end
    end


    private

    def chatmessage_params
        params.require(:chatmessage).permit(:body)
    end
end