class MessagesController < ApplicationController
    def create
        message=current_user.messages.build(params.require(:message).permit(:content))
        if message.save
            ActionCable.server.broadcast( 'chatroom_channel', 
                                          {mod_message: message_render(message)})
        end
   end
   def message_render(message)
    render(partial:'message', locals:{message: message})
   end
   
end