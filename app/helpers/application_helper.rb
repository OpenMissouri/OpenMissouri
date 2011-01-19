module ApplicationHelper
  def title(page_title, show_title = true)
    @show_title = show_title
    content_for(:title) { page_title.to_s }
  end

  def show_title?
    @show_title
  end
  
  def first_x_words(str,n=20,finish='&hellip;')
     "#{str.split(' ')[0,n].inject{|sum,word| sum + ' ' + word}}#{finish}"
  end
  
end
