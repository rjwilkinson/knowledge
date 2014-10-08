module UserSearchHelper

# Determines whether a user is subscribed or not. If they are not, returns a table data tag with a coloured background.
  def is_subscribed(sub_date)
    if sub_date.present? && sub_date >= Date.today
      return content_tag(:td, 'Yes', class: 'bg-success')
      # alternate    '<td class="text-success">Yes</td>'.html_safe
    elsif sub_date == nil
      return '<td></td>'.html_safe
    else
      return '<td class="bg-danger">No</td>'.html_safe
    end
  end



  
end
