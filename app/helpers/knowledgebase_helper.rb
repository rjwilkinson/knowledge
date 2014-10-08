module KnowledgebaseHelper

  def display_title(title = null)
    if title.empty?
     'Knowledgebase'
    else
     title.html_safe
    end    
  end


  def list_icon(view)
    if view == 'list'
     return "#{view}-pressed.png"
    else
     return "list.png"
    end
  end

  def preview_icon(view)
    if view == 'list'
     return "preview.png"
    else
     return "preview-pressed.png"
    end
  end


  def article_count
    if @all_articles.nil?  
      'there were no results to show'
    else
      pluralize(@all_articles.count, 'result')
    end
  end
    
    
end
