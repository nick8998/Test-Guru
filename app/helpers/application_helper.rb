module ApplicationHelper
  def date_year
    Date.current.year
  end
  
  def github_url(author, repo)
    link_to "#{repo}", "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def flash_message(message)
    if flash[message]
      content_tag :p, flash[message], class: "flash #{message.to_s}" 
    end
  end
end
