module FlashMsgHelper
    def success(msg)
        flash.now[:success] = msg
    end

    def failure(msg)
        flash.now[:danger] = msg + '<ul class="error-list">'
        new_food.errors.full_messages.each do |msg|
          flash.now[:danger] += "<li>#{msg}</li>"
        end
        flash.now[:danger] += '</ul>'
    end
end