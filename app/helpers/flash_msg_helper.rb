module FlashMsgHelper
  def success(msg, redirect: false)
    if redirect
      flash[:success] = msg
    else
      flash.now[:success] = msg
    end
  end

  def failure(info, obj)
    flash.now[:danger] = "#{info}<ul class=\"error-list\">"
    obj.errors.full_messages.each do |msg|
      flash.now[:danger] += "<li>#{msg}</li>"
    end
    flash.now[:danger] += '</ul>'
  end
end
