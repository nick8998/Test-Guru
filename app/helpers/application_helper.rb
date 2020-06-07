module ApplicationHelper
  def date_year
    Date.current.year
  end
  
  def github_url(author, repo)
    link_to "#{repo}", "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def flash_alert
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert' 
    end
  end
end
