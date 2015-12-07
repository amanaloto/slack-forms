class Forms::DailyBuzzForm

  def generate_query_string params
    body =
      self.format_body :today => params[:today], :tomorrow => params[:tomorrow]
    comment =
      self.format_comment :load => params[:load], :project => params[:project]

    { :content => body,
      :filetype => 'post',
      :title => params[:date],
      :initial_comment => comment,
      :channels => ::Form::CHANNEL_IDS[params[:channel].to_sym]
    }
  end



  protected

  def format_body options = {:today => [], :tomorrow => []}
    today_list = self.format_list options[:today]
    tomorrow_list = self.format_list options[:tomorrow]

    "### Tasks done today:\n" \
      "#{today_list}\n" \
    "### Tasks for tomorrow:\n" \
      "#{tomorrow_list}"
  end

  def format_comment options = {:load => nil, :project => nil}
    "#{options[:load]} #{options[:project]}"
  end

  def format_list task_array
    return '' if task_array.empty?
    task_array.map { |t| "- #{t}" }.join("\n")
  end

end
