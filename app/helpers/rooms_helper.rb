module RoomsHelper

  def message_lists(companyMessages, messages)
    html = ''
    message_box = []
    
    messages.each do |message|
      message_box.push(message)
    end
    
    companyMessages.each do |company_message|
      message_box.push(company_message)
    end
    
    message_box.sort do |a, b|
      b[:created_at] <=> a[:created_at]
    end

    message_box.each do |chats|
      html += render(partial: 'room', locals: {chats: chats})
      return raw(html)
    end
  end

end